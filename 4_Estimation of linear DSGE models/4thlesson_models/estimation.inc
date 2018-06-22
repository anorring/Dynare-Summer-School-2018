// © Stéphane Adjemian, 2014-2017

varobs Output;

estimated_params;
  stderr EfficiencyInnovation, uniform_pdf, , , 0, 1;
  rho, beta_pdf, .9, .05;
  alpha, beta_pdf, .4, .1;
  psi, beta_pdf, -.5, .05, -1, .5;
end;


// Estimation of the posterior mode with Chris Sims' optimization routine (mode_compute=4 is the default).
// Use mode_check option to plot views of the likelihood and the posterior kernel.
//
// Uncomment the following line to trigger the estimation of the posterior mode.

 estimation(datafile='rbcdataset', first_obs=1001, nobs=200, mode_check, mh_replic=0);

// Run three Metropolis Hastings (starting from the mod found in the first step).
// mh_jscale is the scale factor of the jumping distribution. The default value
// of mh_jscale is .8, here it needs to be increased otherwise the average acceptance
// ratio is too big.

// Uncomment the following estimation command to trigger the MCMC.

   estimation(datafile='rbcdataset', first_obs=1001, nobs=200,
				  mode_compute=0, mode_file=rbc_mode,
				  mh_replic=5000, mh_nblocks=3,
				  mh_jscale=1.2);


// If the Metropolis-Hastings did not converge to the ergodic distribution, restart the MCMC from the last
// state of the previous one.

/*
   estimation(datafile='rbcdataset', first_obs=1001, nobs=200,
				  mode_compute=0, mode_file=rbc_mode,
				  mh_replic=5000, mh_nblocks=3, load_mh_file,
				  mh_jscale=1.2);
*/
