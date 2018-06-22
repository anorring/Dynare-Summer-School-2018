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
M_.fname = 'ex_4';
M_.dynare_version = '4.5.5';
oo_.dynare_version = '4.5.5';
options_.dynare_version = '4.5.5';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('ex_4.log');
M_.exo_names = 'eta_r';
M_.exo_names_tex = 'eta\_r';
M_.exo_names_long = 'eta_r';
M_.exo_names = char(M_.exo_names, 'eta_a');
M_.exo_names_tex = char(M_.exo_names_tex, 'eta\_a');
M_.exo_names_long = char(M_.exo_names_long, 'eta_a');
M_.exo_names = char(M_.exo_names, 'eta_b');
M_.exo_names_tex = char(M_.exo_names_tex, 'eta\_b');
M_.exo_names_long = char(M_.exo_names_long, 'eta_b');
M_.endo_names = 'y';
M_.endo_names_tex = 'y';
M_.endo_names_long = 'y';
M_.endo_names = char(M_.endo_names, 'pie');
M_.endo_names_tex = char(M_.endo_names_tex, 'pie');
M_.endo_names_long = char(M_.endo_names_long, 'pie');
M_.endo_names = char(M_.endo_names, 'r');
M_.endo_names_tex = char(M_.endo_names_tex, 'r');
M_.endo_names_long = char(M_.endo_names_long, 'r');
M_.endo_names = char(M_.endo_names, 'eps_a');
M_.endo_names_tex = char(M_.endo_names_tex, 'eps\_a');
M_.endo_names_long = char(M_.endo_names_long, 'eps_a');
M_.endo_names = char(M_.endo_names, 'eps_b');
M_.endo_names_tex = char(M_.endo_names_tex, 'eps\_b');
M_.endo_names_long = char(M_.endo_names_long, 'eps_b');
M_.endo_partitions = struct();
M_.param_names = 'sigma';
M_.param_names_tex = 'sigma';
M_.param_names_long = 'sigma';
M_.param_names = char(M_.param_names, 'rho_r');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_r');
M_.param_names_long = char(M_.param_names_long, 'rho_r');
M_.param_names = char(M_.param_names, 'rho_pie');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_pie');
M_.param_names_long = char(M_.param_names_long, 'rho_pie');
M_.param_names = char(M_.param_names, 'rho_y');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_y');
M_.param_names_long = char(M_.param_names_long, 'rho_y');
M_.param_names = char(M_.param_names, 'beta');
M_.param_names_tex = char(M_.param_names_tex, 'beta');
M_.param_names_long = char(M_.param_names_long, 'beta');
M_.param_names = char(M_.param_names, 'rho_a');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_a');
M_.param_names_long = char(M_.param_names_long, 'rho_a');
M_.param_names = char(M_.param_names, 'rho_b');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_b');
M_.param_names_long = char(M_.param_names_long, 'rho_b');
M_.param_names = char(M_.param_names, 'kappa');
M_.param_names_tex = char(M_.param_names_tex, 'kappa');
M_.param_names_long = char(M_.param_names_long, 'kappa');
M_.param_names = char(M_.param_names, 'delta');
M_.param_names_tex = char(M_.param_names_tex, 'delta');
M_.param_names_long = char(M_.param_names_long, 'delta');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 3;
M_.endo_nbr = 5;
M_.param_nbr = 9;
M_.orig_endo_nbr = 5;
M_.aux_vars = [];
M_.Sigma_e = zeros(3, 3);
M_.Correlation_matrix = eye(3, 3);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('ex_4_static');
erase_compiled_function('ex_4_dynamic');
M_.orig_eq_nbr = 5;
M_.eq_nbr = 5;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 0 5 10;
 1 6 11;
 2 7 0;
 3 8 0;
 4 9 12;]';
M_.nstatic = 0;
M_.nfwrd   = 1;
M_.npred   = 2;
M_.nboth   = 2;
M_.nsfwrd   = 3;
M_.nspred   = 4;
M_.ndynamic   = 5;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:3];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(5, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(3, 1);
M_.params = NaN(9, 1);
M_.NNZDerivatives = [21; 0; -1];
M_.params( 1 ) = 2;
sigma = M_.params( 1 );
M_.params( 2 ) = 0.96;
rho_r = M_.params( 2 );
M_.params( 3 ) = 1.68;
rho_pie = M_.params( 3 );
M_.params( 4 ) = 0.1;
rho_y = M_.params( 4 );
M_.params( 5 ) = 0.99;
beta = M_.params( 5 );
M_.params( 6 ) = 0.82;
rho_a = M_.params( 6 );
M_.params( 7 ) = 0.85;
rho_b = M_.params( 7 );
M_.params( 9 ) = 0.67;
delta = M_.params( 9 );
M_.params( 8 ) = 0.1;
kappa = M_.params( 8 );
%
% SHOCKS instructions
%
M_.det_shocks = [ M_.det_shocks;
struct('exo_det',0,'exo_id',2,'multiplicative',0,'periods',1:1,'value',0.1) ];
M_.exo_det_length = 0;
steady;
options_.periods = 300;
perfect_foresight_setup;
perfect_foresight_solver;
var_list_ = char('r');
rplot(var_list_);
save('ex_4_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('ex_4_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('ex_4_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('ex_4_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('ex_4_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('ex_4_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('ex_4_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
