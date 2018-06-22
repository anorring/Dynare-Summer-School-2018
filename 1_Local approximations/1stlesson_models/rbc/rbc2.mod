 var C K L w r A;
 varexo e;

 parameters rho delta gamma alpha lambda g psi;

 alpha = 0.33;
 delta = 0.1;
 rho = 0.03;
 lambda = 0.97;
 gamma = 0;
 g = 0.015;
 psi = 0.0001;
 
 model;
 1/C = 1/(1+rho)*(1/(C(+1)*(1+g)))*(r(+1)+1-delta);
 L^gamma = w/C;
 r = alpha*A*(K(-1)/(1+g))^(psi-1)*(alpha*(K(-1)/(1+g))^psi+(1-alpha)*L^psi)^((1-psi)/psi);
 w = (1-alpha)*A*L^(psi-1)*(alpha*(K(-1)/(1+g))^psi+(1-alpha)*L^psi)^((1-psi)/psi);
 K+C = (K(-1)/(1+g))*(1-delta)+A*(alpha*(K(-1)/(1+g))^psi+(1-alpha)*L^psi)^(1/psi);
 log(A) = lambda*log(A(-1))+e;
 end;

 initval;
 A = 1;
 r = (1+g)*(1+rho)+delta-1;
 L = ((1-alpha)/(r/alpha-delta-g))*r/alpha;
 K = (1+g)*(r/alpha)^(1/(alpha-1))*L;
 C = (1-delta)*K/(1+g)+A*(alpha*(K/(1+g))^psi+(1-alpha)*L^psi)^(1/psi)-K;
 w = C;
 end;

 steady;

 shocks;
 var e; stderr 0.01;
 end;

 check;

 stoch_simul(order=1);