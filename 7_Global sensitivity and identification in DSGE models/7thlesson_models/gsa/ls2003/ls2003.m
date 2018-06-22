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
M_.fname = 'ls2003';
M_.dynare_version = '4.5.5';
oo_.dynare_version = '4.5.5';
options_.dynare_version = '4.5.5';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('ls2003.log');
M_.exo_names = 'e_R';
M_.exo_names_tex = 'e\_R';
M_.exo_names_long = 'e_R';
M_.exo_names = char(M_.exo_names, 'e_q');
M_.exo_names_tex = char(M_.exo_names_tex, 'e\_q');
M_.exo_names_long = char(M_.exo_names_long, 'e_q');
M_.exo_names = char(M_.exo_names, 'e_ys');
M_.exo_names_tex = char(M_.exo_names_tex, 'e\_ys');
M_.exo_names_long = char(M_.exo_names_long, 'e_ys');
M_.exo_names = char(M_.exo_names, 'e_pies');
M_.exo_names_tex = char(M_.exo_names_tex, 'e\_pies');
M_.exo_names_long = char(M_.exo_names_long, 'e_pies');
M_.exo_names = char(M_.exo_names, 'e_A');
M_.exo_names_tex = char(M_.exo_names_tex, 'e\_A');
M_.exo_names_long = char(M_.exo_names_long, 'e_A');
M_.endo_names = 'y';
M_.endo_names_tex = 'y';
M_.endo_names_long = 'y';
M_.endo_names = char(M_.endo_names, 'y_s');
M_.endo_names_tex = char(M_.endo_names_tex, 'y\_s');
M_.endo_names_long = char(M_.endo_names_long, 'y_s');
M_.endo_names = char(M_.endo_names, 'R');
M_.endo_names_tex = char(M_.endo_names_tex, 'R');
M_.endo_names_long = char(M_.endo_names_long, 'R');
M_.endo_names = char(M_.endo_names, 'pie');
M_.endo_names_tex = char(M_.endo_names_tex, 'pie');
M_.endo_names_long = char(M_.endo_names_long, 'pie');
M_.endo_names = char(M_.endo_names, 'dq');
M_.endo_names_tex = char(M_.endo_names_tex, 'dq');
M_.endo_names_long = char(M_.endo_names_long, 'dq');
M_.endo_names = char(M_.endo_names, 'pie_s');
M_.endo_names_tex = char(M_.endo_names_tex, 'pie\_s');
M_.endo_names_long = char(M_.endo_names_long, 'pie_s');
M_.endo_names = char(M_.endo_names, 'de');
M_.endo_names_tex = char(M_.endo_names_tex, 'de');
M_.endo_names_long = char(M_.endo_names_long, 'de');
M_.endo_names = char(M_.endo_names, 'A');
M_.endo_names_tex = char(M_.endo_names_tex, 'A');
M_.endo_names_long = char(M_.endo_names_long, 'A');
M_.endo_names = char(M_.endo_names, 'y_obs');
M_.endo_names_tex = char(M_.endo_names_tex, 'y\_obs');
M_.endo_names_long = char(M_.endo_names_long, 'y_obs');
M_.endo_names = char(M_.endo_names, 'pie_obs');
M_.endo_names_tex = char(M_.endo_names_tex, 'pie\_obs');
M_.endo_names_long = char(M_.endo_names_long, 'pie_obs');
M_.endo_names = char(M_.endo_names, 'R_obs');
M_.endo_names_tex = char(M_.endo_names_tex, 'R\_obs');
M_.endo_names_long = char(M_.endo_names_long, 'R_obs');
M_.endo_partitions = struct();
M_.param_names = 'psi1';
M_.param_names_tex = 'psi1';
M_.param_names_long = 'psi1';
M_.param_names = char(M_.param_names, 'psi2');
M_.param_names_tex = char(M_.param_names_tex, 'psi2');
M_.param_names_long = char(M_.param_names_long, 'psi2');
M_.param_names = char(M_.param_names, 'psi3');
M_.param_names_tex = char(M_.param_names_tex, 'psi3');
M_.param_names_long = char(M_.param_names_long, 'psi3');
M_.param_names = char(M_.param_names, 'rho_R');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_R');
M_.param_names_long = char(M_.param_names_long, 'rho_R');
M_.param_names = char(M_.param_names, 'tau');
M_.param_names_tex = char(M_.param_names_tex, 'tau');
M_.param_names_long = char(M_.param_names_long, 'tau');
M_.param_names = char(M_.param_names, 'alpha');
M_.param_names_tex = char(M_.param_names_tex, 'alpha');
M_.param_names_long = char(M_.param_names_long, 'alpha');
M_.param_names = char(M_.param_names, 'rr');
M_.param_names_tex = char(M_.param_names_tex, 'rr');
M_.param_names_long = char(M_.param_names_long, 'rr');
M_.param_names = char(M_.param_names, 'k');
M_.param_names_tex = char(M_.param_names_tex, 'k');
M_.param_names_long = char(M_.param_names_long, 'k');
M_.param_names = char(M_.param_names, 'rho_q');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_q');
M_.param_names_long = char(M_.param_names_long, 'rho_q');
M_.param_names = char(M_.param_names, 'rho_A');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_A');
M_.param_names_long = char(M_.param_names_long, 'rho_A');
M_.param_names = char(M_.param_names, 'rho_ys');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_ys');
M_.param_names_long = char(M_.param_names_long, 'rho_ys');
M_.param_names = char(M_.param_names, 'rho_pies');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_pies');
M_.param_names_long = char(M_.param_names_long, 'rho_pies');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 5;
M_.endo_nbr = 11;
M_.param_nbr = 12;
M_.orig_endo_nbr = 11;
M_.aux_vars = [];
options_.varobs = cell(1);
options_.varobs(1)  = {'y_obs'};
options_.varobs(2)  = {'R_obs'};
options_.varobs(3)  = {'pie_obs'};
options_.varobs(4)  = {'dq'};
options_.varobs(5)  = {'de'};
options_.varobs_id = [ 9 11 10 5 7  ];
M_.Sigma_e = zeros(5, 5);
M_.Correlation_matrix = eye(5, 5);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.linear = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('ls2003_static');
erase_compiled_function('ls2003_dynamic');
M_.orig_eq_nbr = 11;
M_.eq_nbr = 11;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 1 7 18;
 2 8 19;
 3 9 0;
 0 10 20;
 4 11 21;
 5 12 0;
 0 13 0;
 6 14 22;
 0 15 0;
 0 16 0;
 0 17 0;]';
M_.nstatic = 4;
M_.nfwrd   = 1;
M_.npred   = 2;
M_.nboth   = 4;
M_.nsfwrd   = 5;
M_.nspred   = 6;
M_.ndynamic   = 7;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:5];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(11, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(5, 1);
M_.params = NaN(12, 1);
M_.NNZDerivatives = [45; 0; -1];
M_.params( 1 ) = 1.54;
psi1 = M_.params( 1 );
M_.params( 2 ) = 0.25;
psi2 = M_.params( 2 );
M_.params( 3 ) = 0.25;
psi3 = M_.params( 3 );
M_.params( 4 ) = 0.5;
rho_R = M_.params( 4 );
M_.params( 6 ) = 0.3;
alpha = M_.params( 6 );
M_.params( 7 ) = 2.51;
rr = M_.params( 7 );
M_.params( 8 ) = 0.5;
k = M_.params( 8 );
M_.params( 5 ) = 0.5;
tau = M_.params( 5 );
M_.params( 9 ) = 0.4;
rho_q = M_.params( 9 );
M_.params( 10 ) = 0.2;
rho_A = M_.params( 10 );
M_.params( 11 ) = 0.9;
rho_ys = M_.params( 11 );
M_.params( 12 ) = 0.7;
rho_pies = M_.params( 12 );
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = 1.5625;
M_.Sigma_e(2, 2) = 6.25;
M_.Sigma_e(3, 3) = 1.89;
M_.Sigma_e(4, 4) = 1.89;
M_.Sigma_e(5, 5) = 1.89;
estim_params_.var_exo = [];
estim_params_.var_endo = [];
estim_params_.corrx = [];
estim_params_.corrn = [];
estim_params_.param_vals = [];
estim_params_.param_vals = [estim_params_.param_vals; 1, NaN, (-Inf), Inf, 2, 1.5, 0.5, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 2, NaN, (-Inf), Inf, 2, 0.25, 0.125, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 3, NaN, (-Inf), Inf, 2, 0.25, 0.125, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 4, NaN, (-Inf), Inf, 1, 0.5, 0.2, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 6, NaN, (-Inf), Inf, 1, 0.3, 0.1, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 7, NaN, (-Inf), Inf, 2, 2.5, 1, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 8, NaN, (-Inf), Inf, 2, 0.5, 0.25, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 5, NaN, (-Inf), Inf, 2, 0.5, 0.2, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 9, NaN, (-Inf), Inf, 1, 0.4, 0.2, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 10, NaN, (-Inf), Inf, 1, 0.5, 0.2, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 11, NaN, (-Inf), Inf, 1, 0.8, 0.1, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 12, NaN, (-Inf), Inf, 1, 0.7, 0.15, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 1, NaN, (-Inf), Inf, 4, 1.2533, 0.6551, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 2, NaN, (-Inf), Inf, 4, 2.5066, 1.3103, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 5, NaN, (-Inf), Inf, 4, 1.2533, 0.6551, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 3, NaN, (-Inf), Inf, 4, 1.2533, 0.6551, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 4, NaN, (-Inf), Inf, 4, 1.88, 0.9827, NaN, NaN, NaN ];
disp(' ');
disp('NOW I DO STABILITY MAPPING and prepare sample for Reduced form Mapping');
disp(' ');
disp('Press ENTER to continue'); pause(5);
options_gsa = struct();
options_gsa.nodisplay = 1;
options_gsa.redform = 1;
options_.nodisplay = 1;
dynare_sensitivity(options_gsa);
disp(' ');
disp('ANALYSIS OF REDUCED FORM COEFFICIENTS');
disp(' ');
disp('Press ENTER to continue'); pause(5);
options_gsa = struct();
options_gsa.load_stab = 1;
options_gsa.nodisplay = 1;
options_gsa.redform = 1;
options_gsa.stab = 0;
options_gsa.threshold_redform = [-Inf Inf];
options_gsa.namendo = char('pie','R');
options_gsa.namexo = char('e_R');
options_gsa.namlagendo = char('R');
options_.nodisplay = 1;
dynare_sensitivity(options_gsa);
disp(' ');
disp('THE PREVIOUS TWO CALLS COULD BE DONE TOGETHER');
disp('BY USING THE COMBINED CALL');
disp(' ');
disp('dynare_sensitivity(redform=1,')
disp('threshold_redform=[-inf inf], namendo=(pie,R), namexo=(e_R), namlagendo=(R));')
disp(' ');
disp('Press ENTER to continue'); pause(5);
disp(' ');
disp('MC FILTERING(rmse=1), TO MAP THE FIT FROM PRIORS');
disp('Press ENTER to continue'); pause(5);
options_gsa = struct();
options_gsa.first_obs = 8;
options_gsa.istart_rmse = 2;
options_gsa.load_stab = 1;
options_gsa.nodisplay = 1;
options_gsa.prefilter = 1;
options_gsa.rmse = 1;
options_gsa.stab = 0;
options_gsa.datafile = 'data_ca1.m';
options_gsa.nobs = 79;
options_.nodisplay = 1;
dynare_sensitivity(options_gsa);
disp(' ');
disp('THE PREVIOUS THREE CALLS COULD BE DONE TOGETHER');
disp('BY USING THE COMBINED CALL');
disp(' ');
disp('dynare_sensitivity(redform=1,')
disp('logtrans_redform=1, namendo=(pie,R), namexo=(e_R), namlagendo=(R),')   
disp('datafile=data_ca1.m,first_obs=8,nobs=79,prefilter=1,')
disp('istart_rmse=2, rmse=1);')
disp(' ');
disp('Press ENTER to continue'); pause(5);
disp(' ');
disp('I ESTIMATE THE MODEL');
disp(' ');
disp('Press ENTER to continue'); pause(5);
options_.bayesian_irf = 1;
options_.filtered_vars = 1;
options_.mh_drop = 0.6;
options_.mh_jscale = 0.5;
options_.mh_nblck = 2;
options_.mh_replic = 5000;
options_.mode_compute = 4;
options_.nodisplay = 1;
options_.prefilter = 1;
options_.smoother = 1;
options_.datafile = 'data_ca1.m';
options_.first_obs = 8;
options_.nobs = 79;
options_.order = 1;
var_list_ = char('y_obs','R_obs','pie_obs','dq','de');
oo_recursive_=dynare_estimation(var_list_);
disp(' ');
disp('WE DO STABILITY MAPPING AGAIN, EXPLORING AROUND THE MODE BY A WIDTH +- 0.2 times the mode');
disp('THEN WE DO RMSE analysis in this neighborhood');
disp('Typical for ML estimation, also feasible for posterior mode');
disp(' ');
disp('Press ENTER to continue'); pause(5);
options_gsa = struct();
options_gsa.Nsam = 2048;
options_gsa.first_obs = 8;
options_gsa.neighborhood_width = 0.2;
options_gsa.nodisplay = 1;
options_gsa.pprior = 0;
options_gsa.prefilter = 1;
options_gsa.rmse = 1;
options_gsa.datafile = 'data_ca1.m';
options_gsa.mode_file = 'ls2003_mode';
options_gsa.nobs = 79;
options_.nodisplay = 1;
dynare_sensitivity(options_gsa);
disp(' ');
disp('WE DO STABILITY MAPPING AGAIN, BUT FOR MULTIVARIATE SAMPLE AT THE POSTERIOR MODE (or ML) and Hessian (pprior=0 & ppost=0)');
disp('Typical for ML estimation, also feasible for posterior mode');
disp(' ');
disp('Press ENTER to continue'); pause(5);
options_gsa = struct();
options_gsa.Nsam = 2048;
options_gsa.nodisplay = 1;
options_gsa.pprior = 0;
options_gsa.mode_file = 'ls2003_mode';
options_.nodisplay = 1;
dynare_sensitivity(options_gsa);
disp(' ');
disp('RMSE ANALYSIS FOR MULTIVARIATE SAMPLE AT THE POSTERIOR MODE');
disp(' ');
disp('Press ENTER to continue'); pause(5);
options_gsa = struct();
options_gsa.alpha2_rmse = 0;
options_gsa.alpha_rmse = 0;
options_gsa.first_obs = 8;
options_gsa.nodisplay = 1;
options_gsa.pprior = 0;
options_gsa.prefilter = 1;
options_gsa.rmse = 1;
options_gsa.stab = 0;
options_gsa.datafile = 'data_ca1.m';
options_gsa.mode_file = 'ls2003_mode';
options_gsa.nobs = 79;
options_.nodisplay = 1;
dynare_sensitivity(options_gsa);
disp(' ');
disp('THE LAST TWO CALLS COULD BE DONE TOGETHER');
disp('BY USING THE COMBINED CALL');
disp(' ');
disp('dynare_sensitivity(pprior=0,Nsam=2048,alpha2_stab=0.4,mode_file=ls2003_mode,')
disp('datafile=data_ca1.m,first_obs=8,nobs=79,prefilter=1,')
disp('rmse=1, alpha2_rmse=0, alpha_rmse=0);')
disp(' ');
disp('Press ENTER to continue'); pause(5);
disp(' ');
disp('RMSE ANALYSIS FOR POSTERIOR MCMC sample (ppost=1)');
disp('Needs a call to dynare_estimation to load all MH environment');
disp('Press ENTER to continue'); pause(5);
options_gsa = struct();
options_gsa.first_obs = 8;
options_gsa.nodisplay = 1;
options_gsa.ppost = 1;
options_gsa.prefilter = 1;
options_gsa.rmse = 1;
options_gsa.stab = 0;
options_gsa.datafile = 'data_ca1.m';
options_gsa.nobs = 79;
options_.nodisplay = 1;
dynare_sensitivity(options_gsa);
save('ls2003_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('ls2003_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('ls2003_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('ls2003_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('ls2003_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('ls2003_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('ls2003_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
