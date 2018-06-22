var y pie r dr;
varexo e_y e_pie;

parameters delta sigma alpha kappa gamma1 gamma2;

delta =  0.44;
kappa =  0.18;
alpha =  0.48;
sigma = -0.06;

model(linear);
y  = delta * y(-1)  + (1-delta)*y(+1)+sigma *(r - pie(+1)) + e_y; 
pie  =   alpha * pie(-1) + (1-alpha) * pie(+1) + kappa*y + e_pie;
r = gamma1*pie+gamma2*y;
dr = r - r(-1);
end;

shocks;
var e_y;
stderr 0.63;
var e_pie;
stderr 0.4;
end;

optim_weights;
pie 1;
y 1;
dr 0.2;
end;

osr_params gamma1 gamma2;
gamma1 = 1.1;
gamma2 = 0;

osr;
