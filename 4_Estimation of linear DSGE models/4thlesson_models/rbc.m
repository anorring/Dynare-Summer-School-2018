%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Save empty dates and dseries objects in memory.
dates('initialize');
dseries('initialize');
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'rbc';
M_.dynare_version = '4.5.5';
oo_.dynare_version = '4.5.5';
options_.dynare_version = '4.5.5';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('rbc.log');
M_.exo_names = 'EfficiencyInnovation';
M_.exo_names_tex = 'EfficiencyInnovation';
M_.exo_names_long = 'EfficiencyInnovation';
M_.endo_names = 'Capital';
M_.endo_names_tex = 'Capital';
M_.endo_names_long = 'Capital';
M_.endo_names = char(M_.endo_names, 'Output');
M_.endo_names_tex = char(M_.endo_names_tex, 'Output');
M_.endo_names_long = char(M_.endo_names_long, 'Output');
M_.endo_names = char(M_.endo_names, 'Labour');
M_.endo_names_tex = char(M_.endo_names_tex, 'Labour');
M_.endo_names_long = char(M_.endo_names_long, 'Labour');
M_.endo_names = char(M_.endo_names, 'Consumption');
M_.endo_names_tex = char(M_.endo_names_tex, 'Consumption');
M_.endo_names_long = char(M_.endo_names_long, 'Consumption');
M_.endo_names = char(M_.endo_names, 'Efficiency');
M_.endo_names_tex = char(M_.endo_names_tex, 'Efficiency');
M_.endo_names_long = char(M_.endo_names_long, 'Efficiency');
M_.endo_names = char(M_.endo_names, 'efficiency');
M_.endo_names_tex = char(M_.endo_names_tex, 'efficiency');
M_.endo_names_long = char(M_.endo_names_long, 'efficiency');
M_.endo_partitions = struct();
M_.param_names = 'beta';
M_.param_names_tex = 'beta';
M_.param_names_long = 'beta';
M_.param_names = char(M_.param_names, 'theta');
M_.param_names_tex = char(M_.param_names_tex, 'theta');
M_.param_names_long = char(M_.param_names_long, 'theta');
M_.param_names = char(M_.param_names, 'tau');
M_.param_names_tex = char(M_.param_names_tex, 'tau');
M_.param_names_long = char(M_.param_names_long, 'tau');
M_.param_names = char(M_.param_names, 'alpha');
M_.param_names_tex = char(M_.param_names_tex, 'alpha');
M_.param_names_long = char(M_.param_names_long, 'alpha');
M_.param_names = char(M_.param_names, 'psi');
M_.param_names_tex = char(M_.param_names_tex, 'psi');
M_.param_names_long = char(M_.param_names_long, 'psi');
M_.param_names = char(M_.param_names, 'delta');
M_.param_names_tex = char(M_.param_names_tex, 'delta');
M_.param_names_long = char(M_.param_names_long, 'delta');
M_.param_names = char(M_.param_names, 'rho');
M_.param_names_tex = char(M_.param_names_tex, 'rho');
M_.param_names_long = char(M_.param_names_long, 'rho');
M_.param_names = char(M_.param_names, 'effstar');
M_.param_names_tex = char(M_.param_names_tex, 'effstar');
M_.param_names_long = char(M_.param_names_long, 'effstar');
M_.param_names = char(M_.param_names, 'sigma');
M_.param_names_tex = char(M_.param_names_tex, 'sigma');
M_.param_names_long = char(M_.param_names_long, 'sigma');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 6;
M_.param_nbr = 9;
M_.orig_endo_nbr = 6;
M_.aux_vars = [];
options_.varobs = cell(1);
options_.varobs(1)  = {'Output'};
options_.varobs_id = [ 2  ];
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('rbc_static');
erase_compiled_function('rbc_dynamic');
M_.orig_eq_nbr = 6;
M_.eq_nbr = 6;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 1 3 0;
 0 4 9;
 0 5 10;
 0 6 11;
 0 7 0;
 2 8 0;]';
M_.nstatic = 1;
M_.nfwrd   = 3;
M_.npred   = 2;
M_.nboth   = 0;
M_.nsfwrd   = 3;
M_.nspred   = 2;
M_.ndynamic   = 5;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(6, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(9, 1);
M_.NNZDerivatives = [22; -1; -1];
M_.params( 1 ) = 0.9900;
beta = M_.params( 1 );
M_.params( 2 ) = 0.3570;
theta = M_.params( 2 );
M_.params( 3 ) = 30.0000;
tau = M_.params( 3 );
M_.params( 4 ) = 0.4500;
alpha = M_.params( 4 );
M_.params( 5 ) = (-0.5000);
psi = M_.params( 5 );
M_.params( 6 ) = 0.0200;
delta = M_.params( 6 );
M_.params( 7 ) = 0.9500;
rho = M_.params( 7 );
M_.params( 8 ) = 1.0000;
effstar = M_.params( 8 );
M_.params( 9 ) = 0.0100;
sigma = M_.params( 9 );
steady;
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = 1;
steady;
oo_.dr.eigval = check(M_,options_,oo_);
options_.order = 1;
options_.periods = 10000;
var_list_ = char();
info = stoch_simul(var_list_);
datatomfile('rbcdataset');
estim_params_.var_exo = [];
estim_params_.var_endo = [];
estim_params_.corrx = [];
estim_params_.corrn = [];
estim_params_.param_vals = [];
estim_params_.var_exo = [estim_params_.var_exo; 1, NaN, (-Inf), Inf, 5, NaN, NaN, 0, 1, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 7, NaN, (-Inf), Inf, 1, .9, .05, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 4, NaN, (-Inf), Inf, 1, .4, .1, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 5, NaN, (-Inf), Inf, 1, (-.5), .05, (-1), .5, NaN ];
options_.mh_replic = 0;
options_.mode_check.status = 1;
options_.datafile = 'rbcdataset';
options_.first_obs = 1001;
options_.nobs = 200;
options_.order = 1;
var_list_ = char();
oo_recursive_=dynare_estimation(var_list_);
options_.mh_jscale = 1.2;
options_.mh_nblck = 3;
options_.mh_replic = 5000;
options_.mode_compute = 0;
options_.datafile = 'rbcdataset';
options_.mode_file = 'rbc_mode';
options_.first_obs = 1001;
options_.nobs = 200;
options_.order = 1;
var_list_ = char();
oo_recursive_=dynare_estimation(var_list_);
save('rbc_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('rbc_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('rbc_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('rbc_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('rbc_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('rbc_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('rbc_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
