var c phi;
varexo ac api;
parameters a omegab omegaf tau tauy pie;

a=0.5;
tau=20;
omegab=0.7;
omegaf=0.2;
tauy=0.1;
pie=pi;

model;
c=2*a*cos(2*pie/tau)*c(-1)-a^2*c(-2)+ac;
phi = omegab*phi(-1)+omegaf*phi(+1)+tauy*c+api;
end;

steady;
check;

estimated_params;
a, uniform_pdf,,, 0, 1;
omegab, uniform_pdf,,, 0, 1;
omegaf, uniform_pdf,,, 0, 1;
tau, uniform_pdf,,, 0, 100;
end;

varobs phi;

dynare_sensitivity(lik_init=3);
