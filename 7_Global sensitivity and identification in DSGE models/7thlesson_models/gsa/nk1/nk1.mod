var c phi;
varexo ac api;
parameters a omega tau tauy pie;

a=0.5;
tau=20;
omega=0.7;
tauy=0.1;
pie=pi;

model;
c=2*a*cos(2*pie/tau)*c(-1)-a^2*c(-2)+ac;
phi = omega*phi(-1)+(1-omega)*phi(+1)+tauy*c+api;
end;

steady;
check;

estimated_params;
a, uniform_pdf,,, 0, 1;
omega, uniform_pdf,,, 0, 1;
tau, uniform_pdf,,, 0, 100;
end;

varobs phi;

dynare_sensitivity(lik_init=3);
