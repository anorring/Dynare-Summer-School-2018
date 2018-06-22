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
M_.fname = 'kim2';
M_.dynare_version = '4.5.5';
oo_.dynare_version = '4.5.5';
options_.dynare_version = '4.5.5';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('kim2.log');
M_.exo_names = 'ea';
M_.exo_names_tex = 'ea';
M_.exo_names_long = 'ea';
M_.exo_names = char(M_.exo_names, 'ec');
M_.exo_names_tex = char(M_.exo_names_tex, 'ec');
M_.exo_names_long = char(M_.exo_names_long, 'ec');
M_.endo_names = 'c';
M_.endo_names_tex = 'c';
M_.endo_names_long = 'c';
M_.endo_names = char(M_.endo_names, 'k');
M_.endo_names_tex = char(M_.endo_names_tex, 'k');
M_.endo_names_long = char(M_.endo_names_long, 'k');
M_.endo_names = char(M_.endo_names, 'i');
M_.endo_names_tex = char(M_.endo_names_tex, 'i');
M_.endo_names_long = char(M_.endo_names_long, 'i');
M_.endo_names = char(M_.endo_names, 'a');
M_.endo_names_tex = char(M_.endo_names_tex, 'a');
M_.endo_names_long = char(M_.endo_names_long, 'a');
M_.endo_names = char(M_.endo_names, 'lam');
M_.endo_names_tex = char(M_.endo_names_tex, 'lam');
M_.endo_names_long = char(M_.endo_names_long, 'lam');
M_.endo_partitions = struct();
M_.param_names = 'alph';
M_.param_names_tex = 'alph';
M_.param_names_long = 'alph';
M_.param_names = char(M_.param_names, 'betae');
M_.param_names_tex = char(M_.param_names_tex, 'betae');
M_.param_names_long = char(M_.param_names_long, 'betae');
M_.param_names = char(M_.param_names, 'delta');
M_.param_names_tex = char(M_.param_names_tex, 'delta');
M_.param_names_long = char(M_.param_names_long, 'delta');
M_.param_names = char(M_.param_names, 'as');
M_.param_names_tex = char(M_.param_names_tex, 'as');
M_.param_names_long = char(M_.param_names_long, 'as');
M_.param_names = char(M_.param_names, 's');
M_.param_names_tex = char(M_.param_names_tex, 's');
M_.param_names_long = char(M_.param_names_long, 's');
M_.param_names = char(M_.param_names, 'theta');
M_.param_names_tex = char(M_.param_names_tex, 'theta');
M_.param_names_long = char(M_.param_names_long, 'theta');
M_.param_names = char(M_.param_names, 'phi');
M_.param_names_tex = char(M_.param_names_tex, 'phi');
M_.param_names_long = char(M_.param_names_long, 'phi');
M_.param_names = char(M_.param_names, 'dumpy');
M_.param_names_tex = char(M_.param_names_tex, 'dumpy');
M_.param_names_long = char(M_.param_names_long, 'dumpy');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 2;
M_.endo_nbr = 5;
M_.param_nbr = 8;
M_.orig_endo_nbr = 5;
M_.aux_vars = [];
options_.varobs = cell(1);
options_.varobs(1)  = {'c'};
options_.varobs(2)  = {'i'};
options_.varobs(3)  = {'lam'};
options_.varobs_id = [ 1 3 5  ];
M_.Sigma_e = zeros(2, 2);
M_.Correlation_matrix = eye(2, 2);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 0;
erase_compiled_function('kim2_static');
erase_compiled_function('kim2_dynamic');
M_.orig_eq_nbr = 5;
M_.eq_nbr = 5;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 0 2 0;
 1 3 0;
 0 4 7;
 0 5 8;
 0 6 9;]';
M_.nstatic = 1;
M_.nfwrd   = 3;
M_.npred   = 1;
M_.nboth   = 0;
M_.nsfwrd   = 3;
M_.nspred   = 1;
M_.ndynamic   = 4;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:2];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(5, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(2, 1);
M_.params = NaN(8, 1);
M_.NNZDerivatives = [18; 35; -1];
M_.params( 1 ) = 0.6;
alph = M_.params( 1 );
M_.params( 2 ) = 0.99;
betae = M_.params( 2 );
M_.params( 3 ) = 0.0125;
delta = M_.params( 3 );
M_.params( 4 ) = 0.1;
as = M_.params( 4 );
M_.params( 7 ) = 2;
phi = M_.params( 7 );
M_.params( 5 ) = M_.params(2)*M_.params(3)*M_.params(1)/(M_.params(2)*M_.params(3)+1-M_.params(2));
s = M_.params( 5 );
M_.params( 6 ) = 1;
theta = M_.params( 6 );
steady;
oo_.dr.eigval = check(M_,options_,oo_);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = 1;
M_.Sigma_e(2, 2) = 0;
estim_params_.var_exo = [];
estim_params_.var_endo = [];
estim_params_.corrx = [];
estim_params_.corrn = [];
estim_params_.param_vals = [];
estim_params_.param_vals = [estim_params_.param_vals; 1, NaN, (-Inf), Inf, 5, 0.6, 0.04, 0.5, 0.7, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 7, NaN, (-Inf), Inf, 5, 0.5, 0.2, 0, 10, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 6, NaN, (-Inf), Inf, 5, 0.3, 0.1, 0, 10, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 8, NaN, (-Inf), Inf, 5, 0.5, 0.2, 0, 10, NaN ];
options_gsa = struct();
options_gsa.identification = 1;
options_gsa.morris_nliv = 4;
options_gsa.morris_ntra = 10;
dynare_sensitivity(options_gsa);
options_ident = struct();
options_ident.advanced = 1;
options_ident.max_dim_cova_group = 3;
dynare_identification(options_ident);
save('kim2_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('kim2_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('kim2_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('kim2_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('kim2_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('kim2_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('kim2_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
