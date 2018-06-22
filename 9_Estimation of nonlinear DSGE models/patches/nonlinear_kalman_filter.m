function [LIK,lik] = nonlinear_kalman_filter(ReducedForm, Y, start, ParticleOptions, ThreadsOptions)
% Evaluates the likelihood of a non-linear model approximating the
% predictive (prior) and filtered (posterior) densities for state variables
% by a Kalman filter.
% Gaussian distribution approximation is done by:
% - a spherical-radial cubature (ref: Arasaratnam & Haykin, 2009).
% - a scaled unscented transform cubature (ref: Julier & Uhlmann 1995)
% - Monte-Carlo draws from a multivariate gaussian distribution.
% First and second moments of prior and posterior state densities are computed
% from the resulting nodes/particles and allows to generate new distributions at the
% following observation.
% Pros: The use of nodes is much faster than Monte-Carlo Gaussian particle and standard particles
% filters since it treats a lesser number of particles.
% Cons: 1. Application a linear projection formulae in a nonlinear context.
% 2. Parameter estimations may be biaised if the model is truly non-gaussian since predictive and
% filtered densities are unimodal.
%
% INPUTS
%    Reduced_Form     [structure] Matlab's structure describing the reduced form model.
%    Y                [double]    matrix of original observed variables.
%    start            [double]    structural parameters.
%    ParticleOptions  [structure] Matlab's structure describing options concerning particle filtering.
%    ThreadsOptions   [structure] Matlab's structure.
%
% OUTPUTS
%    LIK        [double]    scalar, likelihood
%    lik        [double]    vector, density of observations in each period.
%
% REFERENCES
%
% NOTES
%   The vector "lik" is used to evaluate the jacobian of the likelihood.
% Copyright (C) 2009-2017 Dynare Team
%
% This file is part of Dynare.
%
% Dynare is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% Dynare is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with Dynare.  If not, see <http://www.gnu.org/licenses/>.

persistent init_flag mf0 mf1 nodes weights weights_c
persistent sample_size number_of_state_variables number_of_observed_variables number_of_structural_innovations

% Set default
if isempty(start)
    start = 1;
end

% Set local state space model (first-order approximation).
ghx  = ReducedForm.ghx;
ghu  = ReducedForm.ghu;
% Set local state space model (second-order approximation).
ghxx = ReducedForm.ghxx;
ghuu = ReducedForm.ghuu;
ghxu = ReducedForm.ghxu;

if any(any(isnan(ghx))) || any(any(isnan(ghu))) || any(any(isnan(ghxx))) || any(any(isnan(ghuu))) || any(any(isnan(ghxu))) || ...
        any(any(isinf(ghx))) || any(any(isinf(ghu))) || any(any(isinf(ghxx))) || any(any(isinf(ghuu))) || any(any(isinf(ghxu))) ...
        any(any(abs(ghx)>1e4)) || any(any(abs(ghu)>1e4)) || any(any(abs(ghxx)>1e4)) || any(any(abs(ghuu)>1e4)) || any(any(abs(ghxu)>1e4))
    ghx
    ghu
    ghxx
    ghuu
    ghxu
end

constant = ReducedForm.constant;
state_variables_steady_state = ReducedForm.state_variables_steady_state;

% Set persistent variables.
if isempty(init_flag)
    mf0 = ReducedForm.mf0;
    mf1 = ReducedForm.mf1;
    sample_size = size(Y,2);
    number_of_state_variables = length(mf0);
    number_of_observed_variables = length(mf1);
    number_of_structural_innovations = length(ReducedForm.Q);
    init_flag = 1;
end

% compute gaussian quadrature nodes and weights on states and shocks

if ParticleOptions.proposal_approximation.montecarlo
    nodes = randn(ParticleOptions.number_of_particles,number_of_state_variables+number_of_structural_innovations) ;
    weights = 1/ParticleOptions.number_of_particles ;
    weights_c = weights ;
elseif ParticleOptions.proposal_approximation.cubature
    [nodes,weights] = spherical_radial_sigma_points(number_of_state_variables+number_of_structural_innovations) ;
    weights_c = weights ;
elseif ParticleOptions.proposal_approximation.unscented
    [nodes,weights,weights_c] = unscented_sigma_points(number_of_state_variables+number_of_structural_innovations,ParticleOptions);
else
    error('Estimation: This approximation for the proposal is not implemented or unknown!')
end

if ParticleOptions.distribution_approximation.montecarlo
    set_dynare_seed('default');
end

% Get covariance matrices
H = ReducedForm.H;
H_lower_triangular_cholesky = chol(H)' ;
Q_lower_triangular_cholesky = chol(ReducedForm.Q)';

% Get initial condition for the state vector.
StateVectorMean = ReducedForm.StateVectorMean;
StateVectorVarianceSquareRoot = chol(ReducedForm.StateVectorVariance)';

% Initialization of the likelihood.
lik  = NaN(sample_size,1);
LIK  = NaN;

for t=1:sample_size

    xbar = [StateVectorMean ; zeros(number_of_structural_innovations,1) ] ;
    sqr_Px = [ [ StateVectorVarianceSquareRoot zeros(number_of_state_variables,number_of_structural_innovations) ] ;
               [ zeros(number_of_structural_innovations,number_of_state_variables) Q_lower_triangular_cholesky ] ];
    sigma_points = bsxfun(@plus,xbar,sqr_Px*(nodes'));
    StateVectors = sigma_points(1:number_of_state_variables,:);
    epsilon = sigma_points(number_of_state_variables+1:number_of_state_variables+number_of_structural_innovations,:);
    yhat = bsxfun(@minus,StateVectors,state_variables_steady_state);
    tmp = local_state_space_iteration_2(yhat,epsilon,ghx,ghu,constant,ghxx,ghuu,ghxu,ThreadsOptions.local_state_space_iteration_2);
    PredictedStateMean = tmp(mf0,:)*weights ;
    PredictedObservedMean = tmp(mf1,:)*weights;

    if ParticleOptions.proposal_approximation.cubature || ParticleOptions.proposal_approximation.montecarlo
        PredictedStateMean = sum(PredictedStateMean,2);
        PredictedObservedMean = sum(PredictedObservedMean,2);
        dState = bsxfun(@minus,tmp(mf0,:),PredictedStateMean)'.*sqrt(weights);
        dObserved = bsxfun(@minus,tmp(mf1,:),PredictedObservedMean)'.*sqrt(weights);
        big_mat = [dObserved  dState ; [H_lower_triangular_cholesky zeros(number_of_observed_variables,number_of_state_variables)] ];
        [mat1,mat] = qr2(big_mat,0);
        mat = mat';
        clear('mat1');
        PredictedObservedVarianceSquareRoot = mat(1:number_of_observed_variables,1:number_of_observed_variables);
        CovarianceObservedStateSquareRoot = mat(number_of_observed_variables+(1:number_of_state_variables),1:number_of_observed_variables);
        StateVectorVarianceSquareRoot = mat(number_of_observed_variables+(1:number_of_state_variables),number_of_observed_variables+(1:number_of_state_variables));
        PredictionError = Y(:,t) - PredictedObservedMean;
        StateVectorMean = PredictedStateMean + (CovarianceObservedStateSquareRoot/PredictedObservedVarianceSquareRoot)*PredictionError;
    else
        dState = bsxfun(@minus,tmp(mf0,:),PredictedStateMean);
        dObserved = bsxfun(@minus,tmp(mf1,:),PredictedObservedMean);
        PredictedStateVariance = dState*diag(weights_c)*dState';
        PredictedObservedVariance = dObserved*diag(weights_c)*dObserved' + H;
        PredictedStateAndObservedCovariance = dState*diag(weights_c)*dObserved';
        PredictionError = Y(:,t) - PredictedObservedMean;
        KalmanFilterGain = PredictedStateAndObservedCovariance/PredictedObservedVariance;
        StateVectorMean = PredictedStateMean + KalmanFilterGain*PredictionError;
        StateVectorVariance = PredictedStateVariance - KalmanFilterGain*PredictedObservedVariance*KalmanFilterGain';
        [StateVectorVarianceSquareRoot, p]= chol(StateVectorVariance,'lower');
        if p
            LIK=-Inf;
            lik(t)=-Inf;
            return
        end
        [PredictedObservedVarianceSquareRoot, p]= chol(PredictedObservedVariance,'lower');
        if p
            LIK=-Inf;
            lik(t)=-Inf;
            return
        end
    end
    lik(t) = log( probability2(0,PredictedObservedVarianceSquareRoot,PredictionError) ) ;
end

LIK = -sum(lik(start:end));
