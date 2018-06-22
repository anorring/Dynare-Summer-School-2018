var c k i a lam;
varexo ea ec;

parameters
alph
betae
delta
as
s
theta
phi
dumpy
;


alph=0.6;
betae=0.99;
delta=0.0125;
as=0.1;
phi=2;
s=betae*delta*alph/(1-betae+delta*betae);
theta=1;

model;
//(1-(betae*delta*alph/(1-betae+delta*betae)))^theta/c^(1+theta)/(1+theta)*(1+theta)*(i/(betae*delta*alph/(1-betae+delta*betae)))^theta*(i/k/delta)^phi=betae*(1-(betae*delta*alph/(1-betae+delta*betae)))^theta/c(+1)^(1+theta)/(1+theta)*(alph*(1+theta)*a(+1)^(1+theta)*k^(alph*(1+theta)-1)+(1-delta)*(i(+1)/k/delta)^phi*(1+theta)*(i(+1)/(betae*delta*alph/(1-betae+delta*betae)))^theta);
lam*(1+theta)*(i/(betae*delta*alph/(1-betae+delta*betae)))^theta*(i/k/delta)^phi=betae*lam(+1)*(alph*(1+theta)*a(+1)^(1+theta)*k^(alph*(1+theta)-1)+(1-delta)*(i(+1)/k/delta)^phi*(1+theta)*(i(+1)/(betae*delta*alph/(1-betae+delta*betae)))^theta);
k=(delta*(i/delta)^(1-phi)+(1-delta)*k(-1)^(1-phi))^(1/(1-phi));
((1-(betae*delta*alph/(1-betae+delta*betae)))*(c/(1-(betae*delta*alph/(1-betae+delta*betae))))^(1+theta) + 
(betae*delta*alph/(1-betae+delta*betae))*(i/(betae*delta*alph/(1-betae+delta*betae)))^(1+theta))^(1/(1+theta))=
(a*k(-1)^alph);
a = as+ea;
lam = (1-(betae*delta*alph/(1-betae+delta*betae)))^theta/c^(1+theta)/(1+theta)*exp(ec);
//cobs = c+ec;
end;

steady;
check;

shocks;
var ea = 1;
var ec = 0;
end;

estimated_params;
alph ,uniform_pdf,0.6,0.04,0.5,0.7;
//betae ,uniform_pdf,0.99,0.004,0.98,1;
//delta ,uniform_pdf,0.0125,0.001,0.01,0.015;
phi ,uniform_pdf,0.5,0.2,0,10;
theta ,uniform_pdf,0.3,0.1,0,10;
dumpy ,uniform_pdf,0.5,0.2,0,10;
end;

varobs c i lam;
//identification;
dynare_sensitivity(identification=1, morris_nliv=4, morris_ntra=10);
identification(advanced=1,max_dim_cova_group=3);
//varobs c i lam; //to check if observing lam identifies phi and theta
//identification(ar=1,advanced=1,max_dim_cova_group=3,prior_mc=250);
//identification(prior_mc=100);
