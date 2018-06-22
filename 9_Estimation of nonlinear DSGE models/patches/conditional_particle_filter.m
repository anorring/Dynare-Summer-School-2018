function [LIK,lik] = conditional_particle_filter(ReducedForm,Y,start,ParticleOptions,ThreadsOptions)
%
% Evaluates the likelihood of a non-linear model with a particle filter
% - the proposal is built using the Kalman updating step for each particle.
% - we need draws in the errors distributions
% Whether we use Monte-Carlo draws from a multivariate gaussian distribution
% as in Amisano & Tristani (JEDC 2010).
% Whether we use multidimensional Gaussian sparse grids approximations:
% - a univariate Kronrod-Paterson Gaussian quadrature combined by the Smolyak
% operator (ref: Winschel & Kratzig, 2010).
% - a spherical-radial cubature (ref: Arasaratnam & Haykin, 2009a,2009b).
% - a scaled unscented transform cubature (ref: Julier & Uhlmann 1997, van der
% Merwe & Wan 2003).
%
% Pros:
% - Allows using current observable information in the proposal
% - The use of sparse grids Gaussian approximation is much faster than the Monte-Carlo approach
% Cons:
% - The use of the Kalman updating step may biais the proposal distribution since
% it has been derived in a linear context and is implemented in a nonlinear
% context. That is why particle resampling is performed.
%
% INPUTS
%    reduced_form_model     [structure] Matlab's structure describing the reduced form model.
%                                       reduced_form_model.measurement.H   [double]   (pp x pp) variance matrix of measurement errors.
%                                       reduced_form_model.state.Q         [double]   (qq x qq) variance matrix of state errors.
%                                       reduced_form_model.state.dr        [structure] output of resol.m.
%    Y                      [double]    pp*smpl matrix of (detrended) data, where pp is the maximum number of observed variables.
%    start                  [integer]   scalar, likelihood evaluation starts at 'start'.
%    smolyak_accuracy       [integer]   scalar.
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

% AUTHOR(S) frederic DOT karame AT univ DASH lemans DOT fr
%           stephane DOT adjemian AT univ DASH lemans DOT fr

persistent init_flag mf1
persistent number_of_particles
persistent sample_size number_of_observed_variables

% Set default
if isempty(start)
    start = 1;
end

% Set persistent variables.
if isempty(init_flag)
    mf1 = ReducedForm.mf1;
    sample_size = size(Y,2);
    number_of_observed_variables = length(mf1);
    init_flag = 1;
    number_of_particles = ParticleOptions.number_of_particles ;
end

% Get covariance matrices
Q = ReducedForm.Q;
H = ReducedForm.H;
if isempty(H)
    H = 0;
    H_lower_triangular_cholesky = 0;
else
    H_lower_triangular_cholesky = chol(H)';
end

% Get initial condition for the state vector.
StateVectorMean = ReducedForm.StateVectorMean;
StateVectorVarianceSquareRoot = chol(ReducedForm.StateVectorVariance)';
state_variance_rank = size(StateVectorVarianceSquareRoot,2);
Q_lower_triangular_cholesky = chol(Q)';

% Set seed for randn().
set_dynare_seed('default');

% Initialization of the likelihood.
normconst2 = sqrt( ((2*pi)^number_of_observed_variables)*prod(det(H)) ) ;
lik  = NaN(sample_size,1);
LIK  = NaN;
ks = 0 ;
StateParticles = bsxfun(@plus,StateVectorVarianceSquareRoot*randn(state_variance_rank,number_of_particles),StateVectorMean);
SampleWeights = ones(1,number_of_particles)/number_of_particles ;
for t=1:sample_size
    for i=1:number_of_particles
        [StateParticles(:,i),SampleWeights(i),flag] = ...
            conditional_filter_proposal(ReducedForm,Y(:,t),StateParticles(:,i),SampleWeights(i),Q_lower_triangular_cholesky,H_lower_triangular_cholesky,H,ParticleOptions,ThreadsOptions,normconst2) ;
        if flag==1 
            LIK=-Inf;
            lik(t)=-Inf;
            return 
        end 
    end
    SumSampleWeights = sum(SampleWeights) ;
    lik(t) = log(SumSampleWeights) ;
    SampleWeights = SampleWeights./SumSampleWeights ;
    if (ParticleOptions.resampling.status.generic && neff(SampleWeights)<ParticleOptions.resampling.threshold*sample_size) || ParticleOptions.resampling.status.systematic
        ks = ks + 1 ;
        StateParticles = resample(StateParticles',SampleWeights',ParticleOptions)';
        SampleWeights = ones(1,number_of_particles)/number_of_particles ;
    end
end

LIK = -sum(lik(start:end));
