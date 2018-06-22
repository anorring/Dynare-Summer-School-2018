function [ProposalStateVector,Weights,flag] = conditional_filter_proposal(ReducedForm,obs,StateVectors,SampleWeights,Q_lower_triangular_cholesky,H_lower_triangular_cholesky,H,ParticleOptions,ThreadsOptions,normconst2)
%
% Computes the proposal for each past particle using Gaussian approximations
% for the state errors and the Kalman filter
%
% INPUTS
%    reduced_form_model     [structure] Matlab's structure describing the reduced form model.
%                                       reduced_form_model.measurement.H   [double]   (pp x pp) variance matrix of measurement errors.
%                                       reduced_form_model.state.Q         [double]   (qq x qq) variance matrix of state errors.
%                                       reduced_form_model.state.dr        [structure] output of resol.m.
%    Y                      [double]    pp*smpl matrix of (detrended) data, where pp is the maximum number of observed variables.
%
% OUTPUTS
%    LIK        [double]    scalar, likelihood
%    lik        [double]    vector, density of observations in each period.
%
% REFERENCES
%
% NOTES
%   The vector "lik" is used to evaluate the jacobian of the likelihood.
% Copyright (C) 2012-2017 Dynare Team
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
%
% AUTHOR(S) frederic DOT karame AT univ DASH lemans DOT fr
%           stephane DOT adjemian AT univ DASH lemans DOT fr

persistent init_flag2 mf0 mf1
persistent number_of_state_variables number_of_observed_variables
persistent number_of_structural_innovations

flag=0 ;
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
if isempty(init_flag2)
    mf0 = ReducedForm.mf0;
    mf1 = ReducedForm.mf1;
    number_of_state_variables = length(mf0);
    number_of_observed_variables = length(mf1);
    number_of_structural_innovations = length(ReducedForm.Q);
    init_flag2 = 1;
end

if ParticleOptions.proposal_approximation.cubature || ParticleOptions.proposal_approximation.montecarlo
    [nodes,weights] = spherical_radial_sigma_points(number_of_structural_innovations);
    weights_c = weights ;
elseif ParticleOptions.proposal_approximation.unscented
    [nodes,weights,weights_c] = unscented_sigma_points(number_of_structural_innovations,ParticleOptions);
else
    error('Estimation: This approximation for the proposal is not implemented or unknown!')
end

epsilon = Q_lower_triangular_cholesky*(nodes') ;
yhat = repmat(StateVectors-state_variables_steady_state,1,size(epsilon,2)) ;

tmp = local_state_space_iteration_2(yhat,epsilon,ghx,ghu,constant,ghxx,ghuu,ghxu,ThreadsOptions.local_state_space_iteration_2);

PredictedStateMean = tmp(mf0,:)*weights ;
PredictedObservedMean = tmp(mf1,:)*weights;

if ParticleOptions.proposal_approximation.cubature || ParticleOptions.proposal_approximation.montecarlo
    PredictedStateMean = sum(PredictedStateMean,2) ;
    PredictedObservedMean = sum(PredictedObservedMean,2) ;
    dState = bsxfun(@minus,tmp(mf0,:),PredictedStateMean)'.*sqrt(weights) ;
    dObserved = bsxfun(@minus,tmp(mf1,:),PredictedObservedMean)'.*sqrt(weights);
    PredictedStateVariance = dState*dState';
    big_mat = [dObserved  dState; [H_lower_triangular_cholesky zeros(number_of_observed_variables,number_of_state_variables)] ];
    [mat1,mat] = qr2(big_mat,0);
    mat = mat';
    clear('mat1');
    PredictedObservedVarianceSquareRoot = mat(1:number_of_observed_variables,1:number_of_observed_variables);
    CovarianceObservedStateSquareRoot = mat(number_of_observed_variables+(1:number_of_state_variables),1:number_of_observed_variables);
    StateVectorVarianceSquareRoot = mat(number_of_observed_variables+(1:number_of_state_variables),number_of_observed_variables+(1:number_of_state_variables));
    Error = obs - PredictedObservedMean ;
    StateVectorMean = PredictedStateMean + (CovarianceObservedStateSquareRoot/PredictedObservedVarianceSquareRoot)*Error ;
    if ParticleOptions.cpf_weights_method.amisanotristani
        Weights = SampleWeights.*probability2(zeros(number_of_observed_variables,1),PredictedObservedVarianceSquareRoot,Error) ;
    end
else
    dState = bsxfun(@minus,tmp(mf0,:),PredictedStateMean);
    dObserved = bsxfun(@minus,tmp(mf1,:),PredictedObservedMean);
    PredictedStateVariance = dState*diag(weights_c)*dState';
    PredictedObservedVariance = dObserved*diag(weights_c)*dObserved' + H;
    PredictedStateAndObservedCovariance = dState*diag(weights_c)*dObserved';
    KalmanFilterGain = PredictedStateAndObservedCovariance/PredictedObservedVariance ;
    Error = obs - PredictedObservedMean ;
    StateVectorMean = PredictedStateMean + KalmanFilterGain*Error ;
    StateVectorVariance = PredictedStateVariance - KalmanFilterGain*PredictedObservedVariance*KalmanFilterGain';
    StateVectorVariance = 0.5*(StateVectorVariance+StateVectorVariance');
    %StateVectorVarianceSquareRoot = reduced_rank_cholesky(StateVectorVariance)';%chol(StateVectorVariance + eye(number_of_state_variables)*1e-6)' ;
    [StateVectorVarianceSquareRoot,p] = chol(StateVectorVariance,'lower') ;
    if p
        flag=1;
        ProposalStateVector = zeros(number_of_state_variables,1) ;
        Weights = 0.0 ;
        return
    end 
    if ParticleOptions.cpf_weights_method.amisanotristani
        Weights = SampleWeights.*probability2(zeros(number_of_observed_variables,1),chol(PredictedObservedVariance)',Error) ;
    end
end

ProposalStateVector = StateVectorVarianceSquareRoot*randn(size(StateVectorVarianceSquareRoot,2),1)+StateVectorMean ;
if ParticleOptions.cpf_weights_method.murrayjonesparslow
    PredictedStateVariance = 0.5*(PredictedStateVariance+PredictedStateVariance');
    %PredictedStateVarianceSquareRoot = reduced_rank_cholesky(PredictedStateVariance)';%chol(PredictedStateVariance + eye(number_of_state_variables)*1e-6)'  ;
    [PredictedStateVarianceSquareRoot,p] = chol(PredictedStateVariance,'lower')  ;
    if p
        flag=1;
        ProposalStateVector = zeros(number_of_state_variables,1) ;
        Weights = 0.0 ;
        return
    end 
    Prior = probability2(PredictedStateMean,PredictedStateVarianceSquareRoot,ProposalStateVector) ;
    Posterior = probability2(StateVectorMean,StateVectorVarianceSquareRoot,ProposalStateVector) ;
    Likelihood = probability2(obs,H_lower_triangular_cholesky,measurement_equations(ProposalStateVector,ReducedForm,ThreadsOptions)) ;
    Weights = SampleWeights.*Likelihood.*(Prior./Posterior) ;
end
