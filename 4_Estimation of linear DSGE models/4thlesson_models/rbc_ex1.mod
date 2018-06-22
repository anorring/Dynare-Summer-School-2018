// An RBC model considered in 3rd exercises

// Endogenous variables
var C K L w r A;

// Exogenous variables
varexo e;

// Parameters and calibration

parameters rho delta gamma alpha lambda g psi;

 alpha = 0.33;
 delta = 0.1;
 rho = 0.03;
 lambda = 0.97;
 gamma = 0;
 g = 0.015;
 psi = 0.0001;

// Equilibrium conditions

model;
 1/C = 1/(1+rho)*(1/(C(+1)*(1+g)))*(r(+1)+1-delta);
 L^gamma = w/C;
 r = alpha*A*(K(-1)/(1+g))^(psi-1)*(alpha*(K(-1)/(1+g))^psi+(1-alpha)*L^psi)^((1-psi)/psi);
 w = (1-alpha)*A*L^(psi-1)*(alpha*(K(-1)/(1+g))^psi+(1-alpha)*L^psi)^((1-psi)/psi);
 K+C = (K(-1)/(1+g))*(1-delta)+A*(alpha*(K(-1)/(1+g))^psi+(1-alpha)*L^psi)^(1/psi);
 log(A) = lambda*log(A(-1))+e;
 end;

// Steady state (analytically solved)
initval;
A = 1;
r = (1+g)*(1+rho)+delta-1;
L = ((1-alpha)/(r/alpha-delta-g))*r/alpha;
K = (1+g)*(r/alpha)^(1/(alpha-1))*L;
C = (1-delta)*K/(1+g)+A*(alpha*(K/(1+g))^psi+(1-alpha)*L^psi)^(1/psi)-K;
w = C;
end;

// Check that this is indeed the steady state
steady;

// Declare the shocks:
shocks;
var e; stderr 0.01;
end;

// Check system stability (computes and displays the eigenvalues of the system)
check;


