var y y_s R pie dq pie_s de A y_obs pie_obs R_obs;
varexo e_R e_q e_ys e_pies e_A;

parameters psi1 psi2 psi3 rho_R tau alpha rr k rho_q rho_A rho_ys rho_pies;

psi1 = 1.54;
psi2 = 0.25;
psi3 = 0.25;
rho_R = 0.5;
alpha = 0.3;
rr = 2.51;
k = 0.5;
tau = 0.5;
rho_q = 0.4;
rho_A = 0.2;
rho_ys = 0.9;
rho_pies = 0.7;


model(linear);
y = y(+1) - (tau +alpha*(2-alpha)*(1-tau))*(R-pie(+1))-alpha*(tau +alpha*(2-alpha)*(1-tau))*dq(+1) + alpha*(2-alpha)*((1-tau)/tau)*(y_s-y_s(+1))-A(+1);
pie = exp(-rr/400)*pie(+1)+alpha*exp(-rr/400)*dq(+1)-alpha*dq+(k/(tau+alpha*(2-alpha)*(1-tau)))*y+k*alpha*(2-alpha)*(1-tau)/(tau*(tau+alpha*(2-alpha)*(1-tau)))*y_s;
pie = de+(1-alpha)*dq+pie_s;
R = rho_R*R(-1)+(1-rho_R)*(psi1*pie+psi2*(y+alpha*(2-alpha)*((1-tau)/tau)*y_s)+psi3*de)+e_R;
dq = rho_q*dq(-1)+e_q;
y_s = rho_ys*y_s(-1)+e_ys;
pie_s = rho_pies*pie_s(-1)+e_pies;
A = rho_A*A(-1)+e_A;
y_obs = y-y(-1)+A;
pie_obs = 4*pie;
R_obs = 4*R;
end;

shocks;
	var e_R = 1.25^2;
	var e_q = 2.5^2;
	var e_A = 1.89;
	var e_ys = 1.89;
	var e_pies = 1.89;
end;

varobs y_obs R_obs pie_obs dq de;

estimated_params;
psi1 , gamma_pdf,1.5,0.5;
psi2 , gamma_pdf,0.25,0.125;
psi3 , gamma_pdf,0.25,0.125;
rho_R ,beta_pdf,0.5,0.2;
alpha ,beta_pdf,0.3,0.1;
rr ,gamma_pdf,2.5,1;
k , gamma_pdf,0.5,0.25;
tau ,gamma_pdf,0.5,0.2;
rho_q ,beta_pdf,0.4,0.2;
rho_A ,beta_pdf,0.5,0.2;
rho_ys ,beta_pdf,0.8,0.1;
rho_pies,beta_pdf,0.7,0.15;
/*
stderr e_R,inv_gamma_pdf,(1.2533),(0.6551);
stderr e_q,inv_gamma_pdf,(2.5066),(1.3103);
stderr e_A,inv_gamma_pdf,(1.2533),(0.6551);
stderr e_ys,inv_gamma_pdf,(1.2533),(0.6551);
stderr e_pies,inv_gamma_pdf,(1.88),(0.9827);
*/
stderr e_R,inv_gamma_pdf,(1.2533/3),(0.6551/10);
stderr e_q,inv_gamma_pdf,(2.5066/3),(1.3103/10);
stderr e_A,inv_gamma_pdf,(1.2533/3),(0.6551/10);
stderr e_ys,inv_gamma_pdf,(1.2533/3),(0.6551/10);
stderr e_pies,inv_gamma_pdf,(1.88/3),(0.9827/10);
end;

// endogenous prior restrictions
options_.relative_irf=1;
irf_calibration;
y(1:4), e_ys, [ -50 50]; //[first year response]
//y(1:4), e_ys, [-inf -50]; //[first year response]
@#for ilag in 21:40
R_obs(@{ilag}), e_ys, [0 6]; //[response after 4th year to 10th year]
@#endfor
end;

/*
irf_calibration;
y(1:4), e_ys, [-inf -0.4]; //[first year response]
@#for ilag in 21:40
R_obs(@{ilag}), e_ys, [0 0.25]; //[response after 4th year to 10th year]
@#endfor
end;
*/

moment_calibration;
//y_obs,y_obs, [0.8 1.1]; //[unconditional variance]
y_obs,y_obs(-(1:4)), +; //[first year acf]
//y_obs,pie_obs(-4:4), -; //[ccf]
@#for ilag in -2:2
y_obs,R_obs(@{ilag}), -; //[ccf]
@#endfor
@#for ilag in -4:4
y_obs,pie_obs(@{ilag}), -; //[ccf]
@#endfor
end;

if isoctave()
  dynare_sensitivity(prior_range=0, nodisplay, graph_format=(eps));
else
  dynare_sensitivity(prior_range=0, nodisplay, graph_format=(eps,fig));
end

/*
estimation(datafile='data_ca1.m',first_obs=8,nobs=79,mh_nblocks=2, mode_file = ls2003a_mode,
  prefilter=1,mh_jscale=0.5,mh_replic=5000, mode_compute=0, mh_drop=0.6, bayesian_irf);
//stoch_simul(irf=40, order=1, relative_irf) y_obs R_obs pie_obs dq de;
stoch_simul(irf=40, order=1) y_obs R_obs pie_obs dq de;
*/
