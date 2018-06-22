 var lC lK lL lw lr lA;
 varexo e;

 parameters rho delta gamma alpha lambda g;

 alpha = 0.33;
 delta = 0.1;
 rho = 0.03;
 lambda = 0.97;
 gamma = 0;
 g = 0.015;
 
 model;
 1/exp(lC) = 1/(1+rho)*(1/(exp(lC(+1))*(1+g)))*(exp(lr(+1))+1-delta);
 gamma*lL = lw - lC;
 lr = log(alpha) + lA + (alpha-1)*(lK(-1) - log(1+g)) + (1-alpha)*lL;
 lw = log(1-alpha) + lA + alpha*(lK(-1) - log(1+g)) - alpha*lL;
 exp(lK)+exp(lC) = (exp(lK(-1))/(1+g))*(1-delta)+exp(lA)*(exp(lK(-1))/(1+g))^alpha*exp(lL)^(1-alpha);
 lA = lambda*lA(-1)+e;
 end;

 steady_state_model;
 lA = 0;
 lr = log((1+g)*(1+rho)+delta-1);
 lL = log(((1-alpha)/(exp(lr)/alpha-delta-g))*exp(lr)/alpha);
 lK = log((1+g)*(exp(lr)/alpha)^(1/(alpha-1))*exp(lL));
 lC = log((1-delta)*exp(lK)/(1+g)+(exp(lK)/(1+g))^alpha*exp(lL)^(1-alpha)-exp(lK));
 lw = lC;
 end;

 steady;

 shocks;
 var e; stderr 0.01;
 end;

 check;

 stoch_simul(order=1);