var y pie r dr;
varexo e_y e_inf;

parameters delta sigma alpha kappa gamma1 gamma2;

delta =  0.44;
kappa =  0.18;
alpha =  0.48;
sigma = -0.06;

model(linear);
y  = delta * y(-1)  + (1-delta)*y(+1)+sigma *(r - pie(+1)) + e_y; 
pie  =   alpha * pie(-1) + (1-alpha) * pie(+1) + kappa*y + e_inf;
r = gamma1*pie+gamma2*y;
dr = r - r(-1);
end;

shocks;
var e_y;
stderr 0.63;
var e_inf;
stderr 0.4;
end;

nres = 1000;
results = zeros(nres,3);

i_y = strmatch('y',M_.endo_names,'exact');
i_inf = strmatch('pie',M_.endo_names,'exact');
i_dr = strmatch('dr',M_.endo_names,'exact');

p = qmc_sequence(2,int64(3),0,nres);  
for ires = 1:nres
  gamma1 = 1+10*p(1,ires);  // 1 < gamma1 < 11
  gamma2 = 2*p(2,ires);     // 0 < gamma2 < 2

  stoch_simul(irf=0,noprint);

  results(ires,[1:2]) = [gamma1 gamma2];
  vv = oo_.var;
  results(ires,3) = vv(i_y,i_y) + vv(i_inf,i_inf) + 0.1*vv(i_dr,i_dr);
end;

disp(flipud(sortrows(results,3)));


 