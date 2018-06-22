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
M_.fname = 'rbc2';
M_.dynare_version = '4.5.5';
oo_.dynare_version = '4.5.5';
options_.dynare_version = '4.5.5';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('rbc2.log');
M_.exo_names = 'e1';
M_.exo_names_tex = 'e1';
M_.exo_names_long = 'e1';
M_.exo_names = char(M_.exo_names, 'e2');
M_.exo_names_tex = char(M_.exo_names_tex, 'e2');
M_.exo_names_long = char(M_.exo_names_long, 'e2');
M_.exo_names = char(M_.exo_names, 'e');
M_.exo_names_tex = char(M_.exo_names_tex, 'e');
M_.exo_names_long = char(M_.exo_names_long, 'e');
M_.endo_names = 'a1';
M_.endo_names_tex = 'a1';
M_.endo_names_long = 'a1';
M_.endo_names = char(M_.endo_names, 'a2');
M_.endo_names_tex = char(M_.endo_names_tex, 'a2');
M_.endo_names_long = char(M_.endo_names_long, 'a2');
M_.endo_names = char(M_.endo_names, 'c1');
M_.endo_names_tex = char(M_.endo_names_tex, 'c1');
M_.endo_names_long = char(M_.endo_names_long, 'c1');
M_.endo_names = char(M_.endo_names, 'c2');
M_.endo_names_tex = char(M_.endo_names_tex, 'c2');
M_.endo_names_long = char(M_.endo_names_long, 'c2');
M_.endo_names = char(M_.endo_names, 'k1');
M_.endo_names_tex = char(M_.endo_names_tex, 'k1');
M_.endo_names_long = char(M_.endo_names_long, 'k1');
M_.endo_names = char(M_.endo_names, 'k2');
M_.endo_names_tex = char(M_.endo_names_tex, 'k2');
M_.endo_names_long = char(M_.endo_names_long, 'k2');
M_.endo_names = char(M_.endo_names, 'i1');
M_.endo_names_tex = char(M_.endo_names_tex, 'i1');
M_.endo_names_long = char(M_.endo_names_long, 'i1');
M_.endo_names = char(M_.endo_names, 'i2');
M_.endo_names_tex = char(M_.endo_names_tex, 'i2');
M_.endo_names_long = char(M_.endo_names_long, 'i2');
M_.endo_names = char(M_.endo_names, 'lambda');
M_.endo_names_tex = char(M_.endo_names_tex, 'lambda');
M_.endo_names_long = char(M_.endo_names_long, 'lambda');
M_.endo_partitions = struct();
M_.param_names = 'alpha';
M_.param_names_tex = 'alpha';
M_.param_names_long = 'alpha';
M_.param_names = char(M_.param_names, 'beta');
M_.param_names_tex = char(M_.param_names_tex, 'beta');
M_.param_names_long = char(M_.param_names_long, 'beta');
M_.param_names = char(M_.param_names, 'gamma1');
M_.param_names_tex = char(M_.param_names_tex, 'gamma1');
M_.param_names_long = char(M_.param_names_long, 'gamma1');
M_.param_names = char(M_.param_names, 'gamma2');
M_.param_names_tex = char(M_.param_names_tex, 'gamma2');
M_.param_names_long = char(M_.param_names_long, 'gamma2');
M_.param_names = char(M_.param_names, 'A');
M_.param_names_tex = char(M_.param_names_tex, 'A');
M_.param_names_long = char(M_.param_names_long, 'A');
M_.param_names = char(M_.param_names, 'delta');
M_.param_names_tex = char(M_.param_names_tex, 'delta');
M_.param_names_long = char(M_.param_names_long, 'delta');
M_.param_names = char(M_.param_names, 'rho');
M_.param_names_tex = char(M_.param_names_tex, 'rho');
M_.param_names_long = char(M_.param_names_long, 'rho');
M_.param_names = char(M_.param_names, 'sigma');
M_.param_names_tex = char(M_.param_names_tex, 'sigma');
M_.param_names_long = char(M_.param_names_long, 'sigma');
M_.param_names = char(M_.param_names, 'phi');
M_.param_names_tex = char(M_.param_names_tex, 'phi');
M_.param_names_long = char(M_.param_names_long, 'phi');
M_.param_names = char(M_.param_names, 'tau1');
M_.param_names_tex = char(M_.param_names_tex, 'tau1');
M_.param_names_long = char(M_.param_names_long, 'tau1');
M_.param_names = char(M_.param_names, 'tau2');
M_.param_names_tex = char(M_.param_names_tex, 'tau2');
M_.param_names_long = char(M_.param_names_long, 'tau2');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 3;
M_.endo_nbr = 9;
M_.param_nbr = 11;
M_.orig_endo_nbr = 9;
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
erase_compiled_function('rbc2_static');
erase_compiled_function('rbc2_dynamic');
M_.orig_eq_nbr = 9;
M_.eq_nbr = 9;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 1 5 14;
 2 6 15;
 0 7 0;
 0 8 0;
 3 9 0;
 4 10 0;
 0 11 16;
 0 12 17;
 0 13 18;]';
M_.nstatic = 2;
M_.nfwrd   = 3;
M_.npred   = 2;
M_.nboth   = 2;
M_.nsfwrd   = 5;
M_.nspred   = 4;
M_.ndynamic   = 7;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:3];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(9, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(3, 1);
M_.params = NaN(11, 1);
M_.NNZDerivatives = [40; -1; -1];
M_.params( 2 ) = 0.99;
beta = M_.params( 2 );
M_.params( 1 ) = 0.36;
alpha = M_.params( 1 );
M_.params( 5 ) = (1-M_.params(2))/(M_.params(2)*M_.params(1));
A = M_.params( 5 );
M_.params( 6 ) = 0.025;
delta = M_.params( 6 );
M_.params( 7 ) = 0.95;
rho = M_.params( 7 );
M_.params( 8 ) = 0.01;
sigma = M_.params( 8 );
M_.params( 9 ) = 0.5;
phi = M_.params( 9 );
M_.params( 3 ) = 0.625;
gamma1 = M_.params( 3 );
M_.params( 4 ) = 1;
gamma2 = M_.params( 4 );
M_.params( 10 ) = M_.params(5)^(1/M_.params(3));
tau1 = M_.params( 10 );
M_.params( 11 ) = M_.params(5)^(1/M_.params(4));
tau2 = M_.params( 11 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 5 ) = 1;
oo_.steady_state( 6 ) = 1;
oo_.steady_state( 3 ) = M_.params(5);
oo_.steady_state( 4 ) = M_.params(5);
oo_.steady_state( 1 ) = 1;
oo_.steady_state( 2 ) = 1;
oo_.steady_state( 7 ) = M_.params(6);
oo_.steady_state( 8 ) = M_.params(6);
oo_.steady_state( 9 ) = 1;
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (1)^2;
M_.Sigma_e(2, 2) = (1)^2;
M_.Sigma_e(3, 3) = (1)^2;
steady;
oo_.dr.eigval = check(M_,options_,oo_);
options_.order = 1;
var_list_ = char();
info = stoch_simul(var_list_);
save('rbc2_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('rbc2_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('rbc2_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('rbc2_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('rbc2_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('rbc2_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('rbc2_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
