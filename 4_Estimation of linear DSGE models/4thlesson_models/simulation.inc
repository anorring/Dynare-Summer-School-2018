// © Stéphane Adjemian, 2014-2017

shocks;
  var EfficiencyInnovation = 1;
end;

steady;

check;


stoch_simul(periods=10000,order=1);
datatomfile('rbcdataset');