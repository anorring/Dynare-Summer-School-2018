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
M_.fname = 'jermann98';
M_.dynare_version = '4.5.5';
oo_.dynare_version = '4.5.5';
options_.dynare_version = '4.5.5';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('jermann98.log');
M_.exo_names = 'ez';
M_.exo_names_tex = 'ez';
M_.exo_names_long = 'ez';
M_.endo_names = 'c';
M_.endo_names_tex = 'c';
M_.endo_names_long = 'c';
M_.endo_names = char(M_.endo_names, 'd');
M_.endo_names_tex = char(M_.endo_names_tex, 'd');
M_.endo_names_long = char(M_.endo_names_long, 'd');
M_.endo_names = char(M_.endo_names, 'erp1');
M_.endo_names_tex = char(M_.endo_names_tex, 'erp1');
M_.endo_names_long = char(M_.endo_names_long, 'erp1');
M_.endo_names = char(M_.endo_names, 'i');
M_.endo_names_tex = char(M_.endo_names_tex, 'i');
M_.endo_names_long = char(M_.endo_names_long, 'i');
M_.endo_names = char(M_.endo_names, 'k');
M_.endo_names_tex = char(M_.endo_names_tex, 'k');
M_.endo_names_long = char(M_.endo_names_long, 'k');
M_.endo_names = char(M_.endo_names, 'r1');
M_.endo_names_tex = char(M_.endo_names_tex, 'r1');
M_.endo_names_long = char(M_.endo_names_long, 'r1');
M_.endo_names = char(M_.endo_names, 'rf1');
M_.endo_names_tex = char(M_.endo_names_tex, 'rf1');
M_.endo_names_long = char(M_.endo_names_long, 'rf1');
M_.endo_names = char(M_.endo_names, 'w');
M_.endo_names_tex = char(M_.endo_names_tex, 'w');
M_.endo_names_long = char(M_.endo_names_long, 'w');
M_.endo_names = char(M_.endo_names, 'y');
M_.endo_names_tex = char(M_.endo_names_tex, 'y');
M_.endo_names_long = char(M_.endo_names_long, 'y');
M_.endo_names = char(M_.endo_names, 'z');
M_.endo_names_tex = char(M_.endo_names_tex, 'z');
M_.endo_names_long = char(M_.endo_names_long, 'z');
M_.endo_names = char(M_.endo_names, 'mu');
M_.endo_names_tex = char(M_.endo_names_tex, 'mu');
M_.endo_names_long = char(M_.endo_names_long, 'mu');
M_.endo_names = char(M_.endo_names, 'AUX_EXPECT_LEAD_0_107');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_EXPECT\_LEAD\_0\_107');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_EXPECT_LEAD_0_107');
M_.endo_partitions = struct();
M_.param_names = 'alf';
M_.param_names_tex = 'alf';
M_.param_names_long = 'alf';
M_.param_names = char(M_.param_names, 'chihab');
M_.param_names_tex = char(M_.param_names_tex, 'chihab');
M_.param_names_long = char(M_.param_names_long, 'chihab');
M_.param_names = char(M_.param_names, 'xi');
M_.param_names_tex = char(M_.param_names_tex, 'xi');
M_.param_names_long = char(M_.param_names_long, 'xi');
M_.param_names = char(M_.param_names, 'delt');
M_.param_names_tex = char(M_.param_names_tex, 'delt');
M_.param_names_long = char(M_.param_names_long, 'delt');
M_.param_names = char(M_.param_names, 'tau');
M_.param_names_tex = char(M_.param_names_tex, 'tau');
M_.param_names_long = char(M_.param_names_long, 'tau');
M_.param_names = char(M_.param_names, 'g');
M_.param_names_tex = char(M_.param_names_tex, 'g');
M_.param_names_long = char(M_.param_names_long, 'g');
M_.param_names = char(M_.param_names, 'rho');
M_.param_names_tex = char(M_.param_names_tex, 'rho');
M_.param_names_long = char(M_.param_names_long, 'rho');
M_.param_names = char(M_.param_names, 'a1');
M_.param_names_tex = char(M_.param_names_tex, 'a1');
M_.param_names_long = char(M_.param_names_long, 'a1');
M_.param_names = char(M_.param_names, 'a2');
M_.param_names_tex = char(M_.param_names_tex, 'a2');
M_.param_names_long = char(M_.param_names_long, 'a2');
M_.param_names = char(M_.param_names, 'betstar');
M_.param_names_tex = char(M_.param_names_tex, 'betstar');
M_.param_names_long = char(M_.param_names_long, 'betstar');
M_.param_names = char(M_.param_names, 'bet');
M_.param_names_tex = char(M_.param_names_tex, 'bet');
M_.param_names_long = char(M_.param_names_long, 'bet');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 12;
M_.param_nbr = 11;
M_.orig_endo_nbr = 11;
M_.aux_vars(1).endo_index = 12;
M_.aux_vars(1).type = 4;
M_.aux_vars(1).orig_expr = '\mathbb{E}_{t+0}(\frac{\frac{{betstar}}{{g}}\, {mu_{t+1}}}{{mu_{t}}})';
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 0;
erase_compiled_function('jermann98_static');
erase_compiled_function('jermann98_dynamic');
M_.orig_eq_nbr = 12;
M_.eq_nbr = 12;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 1 4 16;
 0 5 0;
 0 6 0;
 0 7 17;
 2 8 0;
 0 9 0;
 0 10 0;
 0 11 0;
 0 12 0;
 3 13 18;
 0 14 19;
 0 15 0;]';
M_.nstatic = 7;
M_.nfwrd   = 2;
M_.npred   = 1;
M_.nboth   = 2;
M_.nsfwrd   = 4;
M_.nspred   = 3;
M_.ndynamic   = 5;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(12, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(11, 1);
M_.NNZDerivatives = [43; 74; 282];
M_.params( 1 ) = 0.36;
alf = M_.params( 1 );
M_.params( 2 ) = 0.819;
chihab = M_.params( 2 );
M_.params( 3 ) = 0.1;
xi = M_.params( 3 );
M_.params( 4 ) = 0.025;
delt = M_.params( 4 );
M_.params( 6 ) = 1.005;
g = M_.params( 6 );
M_.params( 5 ) = 5;
tau = M_.params( 5 );
M_.params( 7 ) = 0.95;
rho = M_.params( 7 );
M_.params( 8 ) = (M_.params(6)-1+M_.params(4))^(1/M_.params(3));
a1 = M_.params( 8 );
M_.params( 9 ) = M_.params(6)-1+M_.params(4)-(M_.params(6)-1+M_.params(4))^(1/M_.params(3))/(1-1/M_.params(3))*(M_.params(6)-1+M_.params(4))^(1-1/M_.params(3));
a2 = M_.params( 9 );
M_.params( 10 ) = M_.params(6)/1.011138;
betstar = M_.params( 10 );
M_.params( 11 ) = M_.params(10)/M_.params(6)^(1-M_.params(5));
bet = M_.params( 11 );
steady;
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (0.01)^2;
options_.k_order_solver = 1;
options_.order = 3;
options_.periods = 50000;
var_list_ = char('erp1','rf1','r1');
info = stoch_simul(var_list_);
save('jermann98_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('jermann98_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('jermann98_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('jermann98_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('jermann98_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('jermann98_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('jermann98_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
