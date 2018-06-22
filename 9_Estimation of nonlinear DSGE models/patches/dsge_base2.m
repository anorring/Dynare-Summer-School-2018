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
M_.fname = 'dsge_base2';
M_.dynare_version = '4.5.5';
oo_.dynare_version = '4.5.5';
options_.dynare_version = '4.5.5';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('dsge_base2.log');
M_.exo_names = 'e_a';
M_.exo_names_tex = 'e\_a';
M_.exo_names_long = 'e_a';
M_.endo_names = 'k';
M_.endo_names_tex = 'k';
M_.endo_names_long = 'k';
M_.endo_names = char(M_.endo_names, 'A');
M_.endo_names_tex = char(M_.endo_names_tex, 'A');
M_.endo_names_long = char(M_.endo_names_long, 'A');
M_.endo_names = char(M_.endo_names, 'c');
M_.endo_names_tex = char(M_.endo_names_tex, 'c');
M_.endo_names_long = char(M_.endo_names_long, 'c');
M_.endo_names = char(M_.endo_names, 'l');
M_.endo_names_tex = char(M_.endo_names_tex, 'l');
M_.endo_names_long = char(M_.endo_names_long, 'l');
M_.endo_names = char(M_.endo_names, 'i');
M_.endo_names_tex = char(M_.endo_names_tex, 'i');
M_.endo_names_long = char(M_.endo_names_long, 'i');
M_.endo_names = char(M_.endo_names, 'y');
M_.endo_names_tex = char(M_.endo_names_tex, 'y');
M_.endo_names_long = char(M_.endo_names_long, 'y');
M_.endo_partitions = struct();
M_.param_names = 'alp';
M_.param_names_tex = 'alp';
M_.param_names_long = 'alp';
M_.param_names = char(M_.param_names, 'bet');
M_.param_names_tex = char(M_.param_names_tex, 'bet');
M_.param_names_long = char(M_.param_names_long, 'bet');
M_.param_names = char(M_.param_names, 'tet');
M_.param_names_tex = char(M_.param_names_tex, 'tet');
M_.param_names_long = char(M_.param_names_long, 'tet');
M_.param_names = char(M_.param_names, 'tau');
M_.param_names_tex = char(M_.param_names_tex, 'tau');
M_.param_names_long = char(M_.param_names_long, 'tau');
M_.param_names = char(M_.param_names, 'delt');
M_.param_names_tex = char(M_.param_names_tex, 'delt');
M_.param_names_long = char(M_.param_names_long, 'delt');
M_.param_names = char(M_.param_names, 'rho');
M_.param_names_tex = char(M_.param_names_tex, 'rho');
M_.param_names_long = char(M_.param_names_long, 'rho');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 6;
M_.param_nbr = 6;
M_.orig_endo_nbr = 6;
M_.aux_vars = [];
options_.varobs = cell(1);
options_.varobs(1)  = {'y'};
options_.varobs(2)  = {'l'};
options_.varobs(3)  = {'i'};
options_.varobs_id = [ 6 4 5  ];
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
erase_compiled_function('dsge_base2_static');
erase_compiled_function('dsge_base2_dynamic');
M_.orig_eq_nbr = 6;
M_.eq_nbr = 6;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 1 3 0;
 2 4 9;
 0 5 10;
 0 6 11;
 0 7 0;
 0 8 0;]';
M_.nstatic = 2;
M_.nfwrd   = 2;
M_.npred   = 1;
M_.nboth   = 1;
M_.nsfwrd   = 3;
M_.nspred   = 2;
M_.ndynamic   = 4;
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
M_.params = NaN(6, 1);
M_.NNZDerivatives = [23; -1; -1];
M_.params( 1 ) = 0.4;
alp = M_.params( 1 );
M_.params( 2 ) = 0.99;
bet = M_.params( 2 );
M_.params( 3 ) = 0.357;
tet = M_.params( 3 );
M_.params( 4 ) = 50;
tau = M_.params( 4 );
M_.params( 5 ) = 0.02;
delt = M_.params( 5 );
M_.params( 6 ) = 0.95;
rho = M_.params( 6 );
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (0.035)^2;
steady;
estim_params_.var_exo = [];
estim_params_.var_endo = [];
estim_params_.corrx = [];
estim_params_.corrn = [];
estim_params_.param_vals = [];
estim_params_.param_vals = [estim_params_.param_vals; 1, NaN, (-Inf), Inf, 5, NaN, NaN, 0.0001, 0.99, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 2, NaN, (-Inf), Inf, 5, NaN, NaN, 0.0001, 0.99999, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 3, NaN, (-Inf), Inf, 5, NaN, NaN, 0.0001, .999, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 4, NaN, (-Inf), Inf, 5, NaN, NaN, 0.0001, 100, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 5, NaN, (-Inf), Inf, 5, NaN, NaN, 0.0001, 0.05, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 6, NaN, (-Inf), Inf, 5, NaN, NaN, 0.0001, 0.9999, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 1, NaN, (-Inf), Inf, 5, NaN, NaN, 0.00001, 0.1, NaN ];
estim_params_.var_endo = [estim_params_.var_endo; 6, NaN, (-Inf), Inf, 5, NaN, NaN, 0.00001, 0.1, NaN ];
estim_params_.var_endo = [estim_params_.var_endo; 4, NaN, (-Inf), Inf, 5, NaN, NaN, 0.00001, 0.1, NaN ];
estim_params_.var_endo = [estim_params_.var_endo; 5, NaN, (-Inf), Inf, 5, NaN, NaN, 0.00001, 0.1, NaN ];
tmp1 = find(estim_params_.param_vals(:,1)==1);
estim_params_.param_vals(tmp1,2) = 0.4;
tmp1 = find(estim_params_.param_vals(:,1)==2);
estim_params_.param_vals(tmp1,2) = 0.99;
tmp1 = find(estim_params_.param_vals(:,1)==3);
estim_params_.param_vals(tmp1,2) = 0.357;
tmp1 = find(estim_params_.param_vals(:,1)==4);
estim_params_.param_vals(tmp1,2) = 50;
tmp1 = find(estim_params_.param_vals(:,1)==5);
estim_params_.param_vals(tmp1,2) = 0.02;
tmp1 = find(estim_params_.param_vals(:,1)==6);
estim_params_.param_vals(tmp1,2) = 0.95;
tmp1 = find(estim_params_.var_exo(:,1)==1);
estim_params_.var_exo(tmp1,2) = .035;
tmp1 = find(estim_params_.var_endo(:,1)==6);
estim_params_.var_endo(tmp1,2) = .0175;
tmp1 = find(estim_params_.var_endo(:,1)==4);
estim_params_.var_endo(tmp1,2) = .00312;
tmp1 = find(estim_params_.var_endo(:,1)==5);
estim_params_.var_endo(tmp1,2) = .00465;
options_.mode_check.neighbourhood_size = .1 ;
options_.mode_check.number_of_points = 250;
options_.threads.local_state_space_iteration_2 = 4;
if ~isfield(options_,'dataset')
    options_.dataset = struct();
end
options_.dataset.file = './risky.m';
options_.mh_replic = 0;
options_.mode_check.status = 1;
options_.mode_compute = 8;
options_.nograph = 1;
options_.order = 1;
var_list_ = char();
oo_recursive_=dynare_estimation(var_list_);
save('dsge_base2_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('dsge_base2_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('dsge_base2_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('dsge_base2_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('dsge_base2_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('dsge_base2_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('dsge_base2_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
