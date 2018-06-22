function [ys,check1]=as2007_steadystate(junk, ys)

global M_ options_

for j=1:size(M_.param_names,1)
  eval([deblank(M_.param_names(j,:)),' = M_.params(j);'])
  assignin('base',deblank(M_.param_names(j,:)),M_.params(j));
end
for j=1:size(M_.endo_names,1)
  eval([deblank(M_.endo_names(j,:)),' = NaN;'])
end

check1=0;

pie=0;
y=0;
R=0;
g=0;
z=0;
YGR=gam_steady;
INFL = pi_steady;
INT = pi_steady+rr_steady+4*gam_steady;

ys=[
pie 
y 
R 
g 
z 
YGR 
INFL
INT];