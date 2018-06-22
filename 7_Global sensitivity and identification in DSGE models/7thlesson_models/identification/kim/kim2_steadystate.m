function [ys,check1]=kim_steadystate(junk, ys)

global M_ options_

for j=1:size(M_.param_names,1)
  eval([deblank(M_.param_names(j,:)),' = M_.params(j);'])
  assignin('base',deblank(M_.param_names(j,:)),M_.params(j));
end
for j=1:size(M_.endo_names,1)
  eval([deblank(M_.endo_names(j,:)),' = NaN;'])
end

check1=0;

s=betae*delta*alph/(1-betae+delta*betae);
a=as; %as^((1-alph)/(1+theta))*(delta^((phi+theta+1)/(theta+1))/s)^alph;
k=(delta/s/a)^(1/(alph-1));
i=delta*k;
c=(((a*k^alph)^(1+theta)-s*(i/s)^(1+theta))/(1-s))^(1/(1+theta))*(1-s);
lam = (1-s)^theta/c^(1+theta)/(1+theta);

ys=[
  c
  k
  i
  a
  lam
  ];