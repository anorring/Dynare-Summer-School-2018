var a1 a2 c1 c2 k1 k2 i1 i2 lambda;

varexo e1 e2 e;

parameters alpha beta gamma1 gamma2 A delta rho sigma phi tau1 tau2;

beta = 0.99;
alpha = 0.36;
A = (1-beta)/(alpha*beta);
delta = 0.025;
rho = 0.95;
sigma = 0.01;
phi = 0.5;

gamma1 = (1+0.25)/2;
gamma2 = 1;

tau1 = A^(1/gamma1);
tau2 = A^(1/gamma2);

model;

//
// Country 1
//
// (1) Law of motion of capital
k1 = (1-delta)*k1(-1) + i1;

// (2) Law of motion of productivity
log(a1) = rho*log(a1(-1)) + sigma*(e1 + e);

// (4) FOC 1
tau1*c1^(-1/gamma1) = lambda;

// (5) FOC 2
lambda*(1+phi*(i1/k1(-1)-delta)) = beta*(lambda(+1)*(1+a1(+1)*A*alpha*k1^(alpha-1)+phi*(1-delta + i1(+1)/k1 - 0.5*(i1(+1)/k1-delta))*(i1(+1)/k1-delta)));


//
// Country 2
//
// (1) Law of motion of capital
k2 = (1-delta)*k2(-1) + i2;

// (2) Law of motion of productivity
log(a2) = rho*log(a2(-1)) + sigma*(e2 + e);

// (4) FOC 1
tau2*c2^(-1/gamma2) = lambda;

// (5) FOC 2
lambda*(1+phi*(i2/k2(-1)-delta)) = beta*(lambda(+1)*(1+a2(+1)*A*alpha*k2^(alpha-1)+phi*(1-delta + i2(+1)/k2 - 0.5*(i2(+1)/k2-delta))*(i2(+1)/k2-delta)));


//
// World
//
// (3) Budget constraint
c1+c2+i1+i2-delta*(k1(-1)+k2(-1)) = a1*A*k1(-1)^alpha - phi/2*k1(-1)*(i1/k1(-1)-delta)^2 + a2*A*k2(-1)^alpha - phi/2*k2(-1)*(i2/k2(-1)-delta)^2;

end;

initval;
k1 = 1;
k2 = 1;
c1 = A;
c2 = A;
a1 = 1;
a2 = 1;
i1 = delta;
i2 = delta;
lambda = 1;
end;

shocks;
var e; stderr 1;
var e1; stderr 1;
var e2; stderr 1;
end;

steady;

check;

stoch_simul(order=1);