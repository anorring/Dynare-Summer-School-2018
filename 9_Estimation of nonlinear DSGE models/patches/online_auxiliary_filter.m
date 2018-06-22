function [xparam,std_param,lb_95,ub_95,median_param] = online_auxiliary_filter(xparam1,DynareDataset,dataset_info,DynareOptions,Model,EstimatedParameters,BayesInfo,bounds,DynareResults)

% Liu & West particle filter = auxiliary particle filter including Liu & West filter on parameters.
%
% INPUTS
%    ReducedForm     [structure] Matlab's structure describing the reduced form model.
%                                       ReducedForm.measurement.H   [double]   (pp x pp) variance matrix of measurement errors.
%                                       ReducedForm.state.Q         [double]   (qq x qq) variance matrix of state errors.
%                                       ReducedForm.state.dr        [structure] output of resol.m.
%    Y                      [double]    pp*smpl matrix of (detrended) data, where pp is the maximum number of observed variables.
%    start                  [integer]   scalar, likelihood evaluation starts at 'start'.
%    mf                     [integer]   pp*1 vector of indices.
%    number_of_particles    [integer]   scalar.
%
% OUTPUTS
%    LIK        [double]    scalar, likelihood
%    lik        [double]    vector, density of observations in each period.
%
% REFERENCES
%
% NOTES
%   The vector "lik" is used to evaluate the jacobian of the likelihood.

% Copyright (C) 2013-2017 Dynare Team
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
persistent Y init_flag mf0 mf1 number_of_particles number_of_parameters liu_west_delta liu_west_chol_sigma_bar
persistent start_param sample_size number_of_observed_variables number_of_structural_innovations

% Set seed for randn().
set_dynare_seed('default') ;
pruning = DynareOptions.particle.pruning;
second_resample = DynareOptions.particle.resampling.status.systematic ;
variance_update = 1 ;

% initialization of state particles
[ys,trend_coeff,exit_flag,info,Model,DynareOptions,BayesInfo,DynareResults,ReducedForm] = ...
    solve_model_for_online_filter(1,xparam1,DynareDataset,DynareOptions,Model,EstimatedParameters,BayesInfo,DynareResults) ;

% Set persistent variables.
if isempty(init_flag)
    mf0 = ReducedForm.mf0;
    mf1 = ReducedForm.mf1;
    number_of_particles = DynareOptions.particle.number_of_particles;
    number_of_parameters = size(xparam1,1) ;
    Y = DynareDataset.data ;
    sample_size = size(Y,1);
    number_of_observed_variables = length(mf1);
    number_of_structural_innovations = length(ReducedForm.Q);
    liu_west_delta = DynareOptions.particle.liu_west_delta ;
    start_param = xparam1 ;
    init_flag = 1;
end

% Get initial conditions for the state particles
StateVectorMean = ReducedForm.StateVectorMean;
StateVectorVarianceSquareRoot = chol(ReducedForm.StateVectorVariance)';
state_variance_rank = size(StateVectorVarianceSquareRoot,2);
StateVectors = bsxfun(@plus,StateVectorVarianceSquareRoot*randn(state_variance_rank,number_of_particles),StateVectorMean);
if pruning
    StateVectors_ = StateVectors;
end

% parameters for the Liu & West filter
small_a = (3*liu_west_delta-1)/(2*liu_west_delta) ;
b_square = 1-small_a*small_a ;

% Initialization of parameter particles
xparam = zeros(number_of_parameters,number_of_particles) ;
%stderr = sqrt(bsxfun(@power,bounds.ub-bounds.lb,2)/12)/100 ;
%stderr = sqrt(bsxfun(@power,bounds.ub-bounds.lb,2)/12)/50 ;
%stderr = sqrt(bsxfun(@power,bounds.ub-bounds.lb,2)/12)/20 ;
bounds = prior_bounds(BayesInfo,DynareOptions.prior_trunc); %reset bounds as lb and ub must only be operational during mode-finding
prior_draw(BayesInfo,DynareOptions.prior_trunc);
for i=1:number_of_particles
    info = 1;
    while info==1
        %candidate = start_param + .001*liu_west_chol_sigma_bar*randn(number_of_parameters,1) ;
        %candidate = start_param + bsxfun(@times,stderr,randn(number_of_parameters,1)) ;
        candidate = prior_draw()';
        if all(candidate(:) >= bounds.lb) && all(candidate(:) <= bounds.ub)
            [ys,trend_coeff,exit_flag,info,Model,DynareOptions,BayesInfo,DynareResults,ReducedForm] = ...
                solve_model_for_online_filter(1,candidate(:),DynareDataset,DynareOptions,Model,EstimatedParameters,BayesInfo,DynareResults) ;
            if info==0
                xparam(:,i) = candidate(:) ;
            end
        end 
    end
end 
%xparam = bsxfun(@plus,bounds(:,1),bsxfun(@times,(bounds(:,2)-bounds(:,1)),rand(number_of_parameters,number_of_particles))) ;

% Initialization of the weights of particles.
weights = ones(1,number_of_particles)/number_of_particles ;

% Initialization of the likelihood.
const_lik = log(2*pi)*number_of_observed_variables;
mean_xparam = zeros(number_of_parameters,sample_size) ;
median_xparam = zeros(number_of_parameters,sample_size) ;
std_xparam = zeros(number_of_parameters,sample_size) ;
lb95_xparam = zeros(number_of_parameters,sample_size) ;
ub95_xparam = zeros(number_of_parameters,sample_size) ;

%% The Online filter
for t=1:sample_size
    if t>1
        fprintf('\nSubsample with %s first observations.\n\n', int2str(t))
    else
        fprintf('\nSubsample with only the first observation.\n\n', int2str(t))
    end
    % Moments of parameters particles distribution
    m_bar = xparam*(weights') ;
    temp = bsxfun(@minus,xparam,m_bar) ;
    sigma_bar = (bsxfun(@times,weights,temp))*(temp') ;
    if variance_update==1
        chol_sigma_bar = chol(b_square*sigma_bar)' ;
    end
    % Prediction (without shocks)
    fore_xparam = bsxfun(@plus,(1-small_a).*m_bar,small_a.*xparam) ;
    tau_tilde = zeros(1,number_of_particles) ;
    for i=1:number_of_particles
        % model resolution
        [ys,trend_coeff,exit_flag,info,Model,DynareOptions,BayesInfo,DynareResults,ReducedForm] = ...
            solve_model_for_online_filter(t,fore_xparam(:,i),DynareDataset,DynareOptions,Model,EstimatedParameters,BayesInfo,DynareResults) ;
        if info==0
            steadystate = ReducedForm.steadystate;
            state_variables_steady_state = ReducedForm.state_variables_steady_state;
            % Set local state space model (second-order approximation).
            constant = ReducedForm.constant;
            ghx  = ReducedForm.ghx;
            ghu  = ReducedForm.ghu;
            ghxx = ReducedForm.ghxx;
            ghuu = ReducedForm.ghuu;
            ghxu = ReducedForm.ghxu;
            % particle likelihood contribution
            yhat = bsxfun(@minus,StateVectors(:,i),state_variables_steady_state);
            if pruning
                yhat_ = bsxfun(@minus,StateVectors_(:,i),state_variables_steady_state);
                [tmp, tmp_] = local_state_space_iteration_2(yhat,zeros(number_of_structural_innovations,1),ghx,ghu,constant,ghxx,ghuu,ghxu,yhat_,steadystate,DynareOptions.threads.local_state_space_iteration_2);
            else
                tmp = local_state_space_iteration_2(yhat,zeros(number_of_structural_innovations,1),ghx,ghu,constant,ghxx,ghuu,ghxu,DynareOptions.threads.local_state_space_iteration_2);
            end
            PredictionError = bsxfun(@minus,Y(t,:)',tmp(mf1,:));
            % Replace Gaussian density with a Student density with 3 degrees of
            % freedom for fat tails.
            z = sum(PredictionError.*(ReducedForm.H\PredictionError),1) ;
            tau_tilde(i) = weights(i).*(tpdf(z,3*ones(size(z)))+1e-99) ;
            %tau_tilde(i) = weights(i).*exp(-.5*(const_lik+log(det(ReducedForm.H))+sum(PredictionError.*(ReducedForm.H\PredictionError),1))) ;
        end 
    end
    % particles selection
    tau_tilde = tau_tilde/sum(tau_tilde)  ;
    indx = resample(0,tau_tilde',DynareOptions.particle);
    StateVectors = StateVectors(:,indx) ;
    xparam = fore_xparam(:,indx);	
    if pruning
        StateVectors_ = StateVectors_(:,indx) ;
    end
    w_stage1 = weights(indx)./tau_tilde(indx) ;
    % draw in the new distributions
    wtilde = zeros(1,number_of_particles) ;
    for i=1:number_of_particles
        info=1 ;
        while info==1 
            candidate = xparam(:,i) + chol_sigma_bar*randn(number_of_parameters,1) ;
            if all(candidate >= bounds.lb) && all(candidate <= bounds.ub)
	                % model resolution for new parameters particles
                [ys,trend_coeff,exit_flag,info,Model,DynareOptions,BayesInfo,DynareResults,ReducedForm] = ...
                    solve_model_for_online_filter(t,candidate,DynareDataset,DynareOptions,Model,EstimatedParameters,BayesInfo,DynareResults) ;
                if info==0
                    xparam(:,i) = candidate ;
                    steadystate = ReducedForm.steadystate;
                    state_variables_steady_state = ReducedForm.state_variables_steady_state;
                    % Set local state space model (second order approximation).
                    constant = ReducedForm.constant;
                    ghx  = ReducedForm.ghx;
                    ghu  = ReducedForm.ghu;
                    ghxx = ReducedForm.ghxx;
                    ghuu = ReducedForm.ghuu;
                    ghxu = ReducedForm.ghxu;
                    % Get covariance matrices and structural shocks
                    epsilon = chol(ReducedForm.Q)'*randn(number_of_structural_innovations,1) ;
                    % compute particles likelihood contribution
                    yhat = bsxfun(@minus,StateVectors(:,i),state_variables_steady_state);
                    if pruning
                        yhat_ = bsxfun(@minus,StateVectors_(:,i),state_variables_steady_state);
                        [tmp, tmp_] = local_state_space_iteration_2(yhat,epsilon,ghx,ghu,constant,ghxx,ghuu,ghxu,yhat_,steadystate,DynareOptions.threads.local_state_space_iteration_2);
                        StateVectors_(:,i) = tmp_(mf0,:) ;
                    else
                        tmp = local_state_space_iteration_2(yhat,epsilon,ghx,ghu,constant,ghxx,ghuu,ghxu,DynareOptions.threads.local_state_space_iteration_2);
                    end
                    StateVectors(:,i) = tmp(mf0,:) ;
                    PredictionError = bsxfun(@minus,Y(t,:)',tmp(mf1,:));
                    wtilde(i) = w_stage1(i)*exp(-.5*(const_lik+log(det(ReducedForm.H))+sum(PredictionError.*(ReducedForm.H\PredictionError),1)));
                end 
            end
        end
    end
    % normalization
    weights = wtilde/sum(wtilde);
    if (variance_update==1) && (neff(weights)<DynareOptions.particle.resampling.threshold*sample_size)
        variance_update = 0 ;
    end
    % final resampling (not advised)
    if second_resample==1
        indx = resample(0,weights,DynareOptions.particle);
        StateVectors = StateVectors(:,indx) ;
        if pruning
            StateVectors_ = StateVectors_(:,indx) ;
        end
        xparam = xparam(:,indx) ;
        weights = ones(1,number_of_particles)/number_of_particles ;
        mean_xparam(:,t) = mean(xparam,2);
        mat_var_cov = bsxfun(@minus,xparam,mean_xparam(:,t)) ;
        mat_var_cov = (mat_var_cov*mat_var_cov')/(number_of_particles-1) ;
        std_xparam(:,t) = sqrt(diag(mat_var_cov)) ;
        for i=1:number_of_parameters
            temp = sortrows(xparam(i,:)') ;
            lb95_xparam(i,t) = temp(0.025*number_of_particles) ;
            median_xparam(i,t) = temp(0.5*number_of_particles) ;
            ub95_xparam(i,t) = temp(0.975*number_of_particles) ;
        end
    end
    if second_resample==0
        mean_xparam(:,t) = xparam*(weights') ;
        mat_var_cov = bsxfun(@minus,xparam,mean_xparam(:,t)) ;
        mat_var_cov = mat_var_cov*(bsxfun(@times,mat_var_cov,weights)') ;
        std_xparam(:,t) = sqrt(diag(mat_var_cov)) ;
        for i=1:number_of_parameters
            temp = sortrows([xparam(i,:)' weights'],1) ;
            cumulated_weights = cumsum(temp(:,2)) ;
            pass1=1 ;
            pass2=1 ;
            pass3=1 ;
            for j=1:number_of_particles
                if cumulated_weights(j)>=0.025 && pass1==1
                    lb95_xparam(i,t) = temp(j,1) ;
                    pass1 = 2 ;
                end
                if cumulated_weights(j)>=0.5 && pass2==1
                    median_xparam(i,t) = temp(j,1) ;
                    pass2 = 2 ;
                end
                if cumulated_weights(j)>=0.975 && pass3==1
                    ub95_xparam(i,t) = temp(j,1) ;
                    pass3 = 2 ;
                end
            end
        end
    end
    str = sprintf(' Lower Bound (95%%) \t Mean \t\t\t Upper Bound (95%%)');
    for l=1:size(xparam,1)
        str = sprintf('%s\n %5.4f \t\t %7.5f \t\t %5.4f', str, lb95_xparam(l,t), mean_xparam(l,t), ub95_xparam(l,t));
    end
    disp([str])
    disp('')
end
distrib_param = xparam ;
xparam = mean_xparam(:,sample_size) ;
std_param = std_xparam(:,sample_size) ;
lb_95 = lb95_xparam(:,sample_size) ;
ub_95 = ub95_xparam(:,sample_size) ;
median_param = median_xparam(:,sample_size) ;

%% Plot parameters trajectory
TeX = DynareOptions.TeX;

[nbplt,nr,nc,lr,lc,nstar] = pltorg(number_of_parameters);
nr = ceil(sqrt(number_of_parameters)) ;
nc = floor(sqrt(number_of_parameters));
nbplt = 1 ;


if TeX
    fidTeX = fopen([Model.fname '_param_traj.tex'],'w');
    fprintf(fidTeX,'%% TeX eps-loader file generated by online_auxiliary_filter.m (Dynare).\n');
    fprintf(fidTeX,['%% ' datestr(now,0) '\n']);
    fprintf(fidTeX,' \n');
end

z = 1:1:sample_size ;

for plt = 1:nbplt,
    if TeX
        NAMES = [];
        TeXNAMES = [];
    end
    hh = dyn_figure(DynareOptions.nodisplay,'Name','Parameters Trajectories');
    for k=1:length(xparam)
        subplot(nr,nc,k)
        [name,texname] = get_the_name(k,TeX,Model,EstimatedParameters,DynareOptions);
        if TeX
            if isempty(NAMES)
                NAMES = name;
                TeXNAMES = texname;
            else
                NAMES = char(NAMES,name);
                TeXNAMES = char(TeXNAMES,texname);
            end
        end
        y = [mean_xparam(k,:)' median_xparam(k,:)' lb95_xparam(k,:)' ub95_xparam(k,:)' xparam(k)*ones(sample_size,1)] ;
        plot(z,y);
        hold on
        title(name,'interpreter','none')
        hold off
        axis tight
        drawnow
    end
    dyn_saveas(hh,[ Model.fname '_param_traj' int2str(plt) ],DynareOptions.nodisplay,DynareOptions.graph_format);
    if TeX
        % TeX eps loader file
        fprintf(fidTeX,'\\begin{figure}[H]\n');
        for jj = 1:length(x)
            fprintf(fidTeX,'\\psfrag{%s}[1][][0.5][0]{%s}\n',deblank(NAMES(jj,:)),deblank(TeXNAMES(jj,:)));
        end
        fprintf(fidTeX,'\\centering \n');
        fprintf(fidTeX,'\\includegraphics[scale=0.5]{%s_ParamTraj%s}\n',Model.fname,int2str(plt));
        fprintf(fidTeX,'\\caption{Parameters trajectories.}');
        fprintf(fidTeX,'\\label{Fig:ParametersPlots:%s}\n',int2str(plt));
        fprintf(fidTeX,'\\end{figure}\n');
        fprintf(fidTeX,' \n');
    end
end

%% Plot Parameter Densities
number_of_grid_points = 2^9;      % 2^9 = 512 !... Must be a power of two.
bandwidth = 0;                    % Rule of thumb optimal bandwidth parameter.
kernel_function = 'gaussian';     % Gaussian kernel for Fast Fourier Transform approximation.
for plt = 1:nbplt,
    if TeX
        NAMES = [];
        TeXNAMES = [];
    end
    hh = dyn_figure(DynareOptions.nodisplay,'Name','Parameters Densities');
    for k=1:length(xparam)
        subplot(nr,nc,k)
        [name,texname] = get_the_name(k,TeX,Model,EstimatedParameters,DynareOptions);
        if TeX
            if isempty(NAMES)
                NAMES = name;
                TeXNAMES = texname;
            else
                NAMES = char(NAMES,name);
                TeXNAMES = char(TeXNAMES,texname);
            end
        end
        optimal_bandwidth = mh_optimal_bandwidth(distrib_param(k,:)',number_of_particles,bandwidth,kernel_function);
        [density(:,1),density(:,2)] = kernel_density_estimate(distrib_param(k,:)',number_of_grid_points,...
                                                          number_of_particles,optimal_bandwidth,kernel_function);
        plot(density(:,1),density(:,2));
        hold on
        title(name,'interpreter','none')
        hold off
        axis tight
        drawnow
    end
    dyn_saveas(hh,[ Model.fname '_param_density' int2str(plt) ],DynareOptions.nodisplay,DynareOptions.graph_format);
    if TeX
        % TeX eps loader file
        fprintf(fidTeX,'\\begin{figure}[H]\n');
        for jj = 1:length(x)
            fprintf(fidTeX,'\\psfrag{%s}[1][][0.5][0]{%s}\n',deblank(NAMES(jj,:)),deblank(TeXNAMES(jj,:)));
        end
        fprintf(fidTeX,'\\centering \n');
        fprintf(fidTeX,'\\includegraphics[scale=0.5]{%s_ParametersDensities%s}\n',Model.fname,int2str(plt));
        fprintf(fidTeX,'\\caption{ParametersDensities.}');
        fprintf(fidTeX,'\\label{Fig:ParametersDensities:%s}\n',int2str(plt));
        fprintf(fidTeX,'\\end{figure}\n');
        fprintf(fidTeX,' \n');
    end
end
