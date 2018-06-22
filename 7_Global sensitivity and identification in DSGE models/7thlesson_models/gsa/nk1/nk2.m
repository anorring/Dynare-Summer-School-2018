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
M_.fname = 'nk2';
M_.dynare_version = '4.5.5';
oo_.dynare_version = '4.5.5';
options_.dynare_version = '4.5.5';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('nk2.log');
M_.exo_names = 'ac';
M_.exo_names_tex = 'ac';
M_.exo_names_long = 'ac';
M_.exo_names = char(M_.exo_names, 'api');
M_.exo_names_tex = char(M_.exo_names_tex, 'api');
M_.exo_names_long = char(M_.exo_names_long, 'api');
M_.endo_names = 'c';
M_.endo_names_tex = 'c';
M_.endo_names_long = 'c';
M_.endo_names = char(M_.endo_names, 'phi');
M_.endo_names_tex = char(M_.endo_names_tex, 'phi');
M_.endo_names_long = char(M_.endo_names_long, 'phi');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_0_1');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_0\_1');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_0_1');
M_.endo_partitions = struct();
M_.param_names = 'a';
M_.param_names_tex = 'a';
M_.param_names_long = 'a';
M_.param_names = char(M_.param_names, 'omegab');
M_.param_names_tex = char(M_.param_names_tex, 'omegab');
M_.param_names_long = char(M_.param_names_long, 'omegab');
M_.param_names = char(M_.param_names, 'omegaf');
M_.param_names_tex = char(M_.param_names_tex, 'omegaf');
M_.param_names_long = char(M_.param_names_long, 'omegaf');
M_.param_names = char(M_.param_names, 'tau');
M_.param_names_tex = char(M_.param_names_tex, 'tau');
M_.param_names_long = char(M_.param_names_long, 'tau');
M_.param_names = char(M_.param_names, 'tauy');
M_.param_names_tex = char(M_.param_names_tex, 'tauy');
M_.param_names_long = char(M_.param_names_long, 'tauy');
M_.param_names = char(M_.param_names, 'pie');
M_.param_names_tex = char(M_.param_names_tex, 'pie');
M_.param_names_long = char(M_.param_names_long, 'pie');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 2;
M_.endo_nbr = 3;
M_.param_nbr = 6;
M_.orig_endo_nbr = 2;
M_.aux_vars(1).endo_index = 3;
M_.aux_vars(1).type = 1;
M_.aux_vars(1).orig_index = 1;
M_.aux_vars(1).orig_lead_lag = -1;
options_.varobs = cell(1);
options_.varobs(1)  = {'phi'};
options_.varobs_id = [ 2  ];
M_.Sigma_e = zeros(2, 2);
M_.Correlation_matrix = eye(2, 2);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('nk2_static');
erase_compiled_function('nk2_dynamic');
M_.orig_eq_nbr = 2;
M_.eq_nbr = 3;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 1 4 0;
 2 5 7;
 3 6 0;]';
M_.nstatic = 0;
M_.nfwrd   = 0;
M_.npred   = 2;
M_.nboth   = 1;
M_.nsfwrd   = 1;
M_.nspred   = 3;
M_.ndynamic   = 3;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:2];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(3, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(2, 1);
M_.params = NaN(6, 1);
M_.NNZDerivatives = [11; 0; -1];
M_.params( 1 ) = 0.5;
a = M_.params( 1 );
M_.params( 4 ) = 20;
tau = M_.params( 4 );
M_.params( 2 ) = 0.7;
omegab = M_.params( 2 );
M_.params( 3 ) = 0.2;
omegaf = M_.params( 3 );
M_.params( 5 ) = 0.1;
tauy = M_.params( 5 );
M_.params( 6 ) = pi;
pie = M_.params( 6 );
steady;
oo_.dr.eigval = check(M_,options_,oo_);
estim_params_.var_exo = [];
estim_params_.var_endo = [];
estim_params_.corrx = [];
estim_params_.corrn = [];
estim_params_.param_vals = [];
estim_params_.param_vals = [estim_params_.param_vals; 1, NaN, (-Inf), Inf, 5, NaN, NaN, 0, 1, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 2, NaN, (-Inf), Inf, 5, NaN, NaN, 0, 1, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 3, NaN, (-Inf), Inf, 5, NaN, NaN, 0, 1, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 4, NaN, (-Inf), Inf, 5, NaN, NaN, 0, 100, NaN ];
options_gsa = struct();
options_gsa.lik_init = 3;
dynare_sensitivity(options_gsa);
save('nk2_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('nk2_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('nk2_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('nk2_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('nk2_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('nk2_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('nk2_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
