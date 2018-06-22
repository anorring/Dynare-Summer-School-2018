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
M_.fname = 'rbcn';
M_.dynare_version = '4.5.5';
oo_.dynare_version = '4.5.5';
options_.dynare_version = '4.5.5';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('rbcn.log');
M_.exo_names = 'e1';
M_.exo_names_tex = 'e1';
M_.exo_names_long = 'e1';
M_.exo_names = char(M_.exo_names, 'e2');
M_.exo_names_tex = char(M_.exo_names_tex, 'e2');
M_.exo_names_long = char(M_.exo_names_long, 'e2');
M_.exo_names = char(M_.exo_names, 'e3');
M_.exo_names_tex = char(M_.exo_names_tex, 'e3');
M_.exo_names_long = char(M_.exo_names_long, 'e3');
M_.exo_names = char(M_.exo_names, 'e4');
M_.exo_names_tex = char(M_.exo_names_tex, 'e4');
M_.exo_names_long = char(M_.exo_names_long, 'e4');
M_.exo_names = char(M_.exo_names, 'e5');
M_.exo_names_tex = char(M_.exo_names_tex, 'e5');
M_.exo_names_long = char(M_.exo_names_long, 'e5');
M_.exo_names = char(M_.exo_names, 'e');
M_.exo_names_tex = char(M_.exo_names_tex, 'e');
M_.exo_names_long = char(M_.exo_names_long, 'e');
M_.endo_names = 'a1';
M_.endo_names_tex = 'a1';
M_.endo_names_long = 'a1';
M_.endo_names = char(M_.endo_names, 'c1');
M_.endo_names_tex = char(M_.endo_names_tex, 'c1');
M_.endo_names_long = char(M_.endo_names_long, 'c1');
M_.endo_names = char(M_.endo_names, 'k1');
M_.endo_names_tex = char(M_.endo_names_tex, 'k1');
M_.endo_names_long = char(M_.endo_names_long, 'k1');
M_.endo_names = char(M_.endo_names, 'i1');
M_.endo_names_tex = char(M_.endo_names_tex, 'i1');
M_.endo_names_long = char(M_.endo_names_long, 'i1');
M_.endo_names = char(M_.endo_names, 'a2');
M_.endo_names_tex = char(M_.endo_names_tex, 'a2');
M_.endo_names_long = char(M_.endo_names_long, 'a2');
M_.endo_names = char(M_.endo_names, 'c2');
M_.endo_names_tex = char(M_.endo_names_tex, 'c2');
M_.endo_names_long = char(M_.endo_names_long, 'c2');
M_.endo_names = char(M_.endo_names, 'k2');
M_.endo_names_tex = char(M_.endo_names_tex, 'k2');
M_.endo_names_long = char(M_.endo_names_long, 'k2');
M_.endo_names = char(M_.endo_names, 'i2');
M_.endo_names_tex = char(M_.endo_names_tex, 'i2');
M_.endo_names_long = char(M_.endo_names_long, 'i2');
M_.endo_names = char(M_.endo_names, 'a3');
M_.endo_names_tex = char(M_.endo_names_tex, 'a3');
M_.endo_names_long = char(M_.endo_names_long, 'a3');
M_.endo_names = char(M_.endo_names, 'c3');
M_.endo_names_tex = char(M_.endo_names_tex, 'c3');
M_.endo_names_long = char(M_.endo_names_long, 'c3');
M_.endo_names = char(M_.endo_names, 'k3');
M_.endo_names_tex = char(M_.endo_names_tex, 'k3');
M_.endo_names_long = char(M_.endo_names_long, 'k3');
M_.endo_names = char(M_.endo_names, 'i3');
M_.endo_names_tex = char(M_.endo_names_tex, 'i3');
M_.endo_names_long = char(M_.endo_names_long, 'i3');
M_.endo_names = char(M_.endo_names, 'a4');
M_.endo_names_tex = char(M_.endo_names_tex, 'a4');
M_.endo_names_long = char(M_.endo_names_long, 'a4');
M_.endo_names = char(M_.endo_names, 'c4');
M_.endo_names_tex = char(M_.endo_names_tex, 'c4');
M_.endo_names_long = char(M_.endo_names_long, 'c4');
M_.endo_names = char(M_.endo_names, 'k4');
M_.endo_names_tex = char(M_.endo_names_tex, 'k4');
M_.endo_names_long = char(M_.endo_names_long, 'k4');
M_.endo_names = char(M_.endo_names, 'i4');
M_.endo_names_tex = char(M_.endo_names_tex, 'i4');
M_.endo_names_long = char(M_.endo_names_long, 'i4');
M_.endo_names = char(M_.endo_names, 'a5');
M_.endo_names_tex = char(M_.endo_names_tex, 'a5');
M_.endo_names_long = char(M_.endo_names_long, 'a5');
M_.endo_names = char(M_.endo_names, 'c5');
M_.endo_names_tex = char(M_.endo_names_tex, 'c5');
M_.endo_names_long = char(M_.endo_names_long, 'c5');
M_.endo_names = char(M_.endo_names, 'k5');
M_.endo_names_tex = char(M_.endo_names_tex, 'k5');
M_.endo_names_long = char(M_.endo_names_long, 'k5');
M_.endo_names = char(M_.endo_names, 'i5');
M_.endo_names_tex = char(M_.endo_names_tex, 'i5');
M_.endo_names_long = char(M_.endo_names_long, 'i5');
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
M_.param_names = char(M_.param_names, 'gamma1');
M_.param_names_tex = char(M_.param_names_tex, 'gamma1');
M_.param_names_long = char(M_.param_names_long, 'gamma1');
M_.param_names = char(M_.param_names, 'tau1');
M_.param_names_tex = char(M_.param_names_tex, 'tau1');
M_.param_names_long = char(M_.param_names_long, 'tau1');
M_.param_names = char(M_.param_names, 'gamma2');
M_.param_names_tex = char(M_.param_names_tex, 'gamma2');
M_.param_names_long = char(M_.param_names_long, 'gamma2');
M_.param_names = char(M_.param_names, 'tau2');
M_.param_names_tex = char(M_.param_names_tex, 'tau2');
M_.param_names_long = char(M_.param_names_long, 'tau2');
M_.param_names = char(M_.param_names, 'gamma3');
M_.param_names_tex = char(M_.param_names_tex, 'gamma3');
M_.param_names_long = char(M_.param_names_long, 'gamma3');
M_.param_names = char(M_.param_names, 'tau3');
M_.param_names_tex = char(M_.param_names_tex, 'tau3');
M_.param_names_long = char(M_.param_names_long, 'tau3');
M_.param_names = char(M_.param_names, 'gamma4');
M_.param_names_tex = char(M_.param_names_tex, 'gamma4');
M_.param_names_long = char(M_.param_names_long, 'gamma4');
M_.param_names = char(M_.param_names, 'tau4');
M_.param_names_tex = char(M_.param_names_tex, 'tau4');
M_.param_names_long = char(M_.param_names_long, 'tau4');
M_.param_names = char(M_.param_names, 'gamma5');
M_.param_names_tex = char(M_.param_names_tex, 'gamma5');
M_.param_names_long = char(M_.param_names_long, 'gamma5');
M_.param_names = char(M_.param_names, 'tau5');
M_.param_names_tex = char(M_.param_names_tex, 'tau5');
M_.param_names_long = char(M_.param_names_long, 'tau5');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 6;
M_.endo_nbr = 21;
M_.param_nbr = 17;
M_.orig_endo_nbr = 21;
M_.aux_vars = [];
M_.Sigma_e = zeros(6, 6);
M_.Correlation_matrix = eye(6, 6);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('rbcn_static');
erase_compiled_function('rbcn_dynamic');
M_.orig_eq_nbr = 21;
M_.eq_nbr = 21;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 1 11 32;
 0 12 0;
 2 13 0;
 0 14 33;
 3 15 34;
 0 16 0;
 4 17 0;
 0 18 35;
 5 19 36;
 0 20 0;
 6 21 0;
 0 22 37;
 7 23 38;
 0 24 0;
 8 25 0;
 0 26 39;
 9 27 40;
 0 28 0;
 10 29 0;
 0 30 41;
 0 31 42;]';
M_.nstatic = 5;
M_.nfwrd   = 6;
M_.npred   = 5;
M_.nboth   = 5;
M_.nsfwrd   = 11;
M_.nspred   = 10;
M_.ndynamic   = 16;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:6];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(21, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(6, 1);
M_.params = NaN(17, 1);
M_.NNZDerivatives = [100; -1; -1];
M_.params( 2 ) = 0.99;
beta = M_.params( 2 );
M_.params( 1 ) = 0.36;
alpha = M_.params( 1 );
M_.params( 3 ) = (1-M_.params(2))/(M_.params(2)*M_.params(1));
A = M_.params( 3 );
M_.params( 4 ) = 0.025;
delta = M_.params( 4 );
M_.params( 5 ) = 0.95;
rho = M_.params( 5 );
M_.params( 6 ) = 0.01;
sigma = M_.params( 6 );
M_.params( 7 ) = 0.5;
phi = M_.params( 7 );
M_.params( 8 ) = 0.4;
gamma1 = M_.params( 8 );
M_.params( 9 ) = M_.params(3)^(1/M_.params(8));
tau1 = M_.params( 9 );
M_.params( 10 ) = 0.55;
gamma2 = M_.params( 10 );
M_.params( 11 ) = M_.params(3)^(1/M_.params(10));
tau2 = M_.params( 11 );
M_.params( 12 ) = 0.7;
gamma3 = M_.params( 12 );
M_.params( 13 ) = M_.params(3)^(1/M_.params(12));
tau3 = M_.params( 13 );
M_.params( 14 ) = 0.85;
gamma4 = M_.params( 14 );
M_.params( 15 ) = M_.params(3)^(1/M_.params(14));
tau4 = M_.params( 15 );
M_.params( 16 ) = 1;
gamma5 = M_.params( 16 );
M_.params( 17 ) = M_.params(3)^(1/M_.params(16));
tau5 = M_.params( 17 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 3 ) = 1;
oo_.steady_state( 2 ) = M_.params(3);
oo_.steady_state( 1 ) = 1;
oo_.steady_state( 4 ) = M_.params(4);
oo_.steady_state( 7 ) = 1;
oo_.steady_state( 6 ) = M_.params(3);
oo_.steady_state( 5 ) = 1;
oo_.steady_state( 8 ) = M_.params(4);
oo_.steady_state( 11 ) = 1;
oo_.steady_state( 10 ) = M_.params(3);
oo_.steady_state( 9 ) = 1;
oo_.steady_state( 12 ) = M_.params(4);
oo_.steady_state( 15 ) = 1;
oo_.steady_state( 14 ) = M_.params(3);
oo_.steady_state( 13 ) = 1;
oo_.steady_state( 16 ) = M_.params(4);
oo_.steady_state( 19 ) = 1;
oo_.steady_state( 18 ) = M_.params(3);
oo_.steady_state( 17 ) = 1;
oo_.steady_state( 20 ) = M_.params(4);
oo_.steady_state( 21 ) = 1;
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
M_.Sigma_e(4, 4) = (1)^2;
M_.Sigma_e(5, 5) = (1)^2;
M_.Sigma_e(6, 6) = (1)^2;
steady;
oo_.dr.eigval = check(M_,options_,oo_);
options_.nograph = 1;
options_.order = 1;
var_list_ = char();
info = stoch_simul(var_list_);
save('rbcn_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('rbcn_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('rbcn_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('rbcn_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('rbcn_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('rbcn_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('rbcn_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
