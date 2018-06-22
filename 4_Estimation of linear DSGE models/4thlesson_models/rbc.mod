// © Stéphane Adjemian, 2014-2017

var Capital, Output, Labour, Consumption, Efficiency, efficiency ;

varexo EfficiencyInnovation;

parameters beta, theta, tau, alpha, psi, delta, rho, effstar, sigma;

beta    =  0.9900;
theta   =  0.3570;
tau     = 30.0000;
alpha   =  0.4500;
psi     = -0.5000; // The elasticity of substitution between inputs is 1/(1-psi)
delta   =  0.0200;
rho     =  0.9500;
effstar =  1.0000;
sigma   =  0.0100;

model;

  // Eq. n°1:
  efficiency = rho*efficiency(-1) + sigma*EfficiencyInnovation;

  // Eq. n°2:
  Efficiency = effstar*exp(efficiency);

  // Eq. n°3:
  Output = Efficiency*(alpha*(Capital(-1)^psi)+(1-alpha)*(Labour^psi))^(1/psi);

  // Eq. n°4:
  Consumption + Capital - Output - (1-delta)*Capital(-1);

  // Eq. n°5:
  ((1-theta)/theta)*(Consumption/(1-Labour)) - (1-alpha)*(Output/Labour)^(1-psi);

  // Eq. n°6:
  (((Consumption^theta)*((1-Labour)^(1-theta)))^(1-tau))/Consumption
  - beta*((Consumption(1)^theta)*((1-Labour(1))^(1-theta)))^(1-tau)/Consumption(1)*(alpha*((Output(1)/Capital)^(1-psi))+1-delta) ;

end;


steady_state_model;

  efficiency = 0;
  Efficiency = effstar;

  // Compute some steady state ratios.
  Output_per_unit_of_Capital=((1/beta-1+delta)/alpha)^(1/(1-psi));
  Consumption_per_unit_of_Capital=Output_per_unit_of_Capital-delta;
  Labour_per_unit_of_Capital=(((Output_per_unit_of_Capital/Efficiency)^(psi)-alpha)/(1-alpha))^(1/psi);
  Output_per_unit_of_Labour=Output_per_unit_of_Capital/Labour_per_unit_of_Capital;
  Consumption_per_unit_of_Labour=Consumption_per_unit_of_Capital/Labour_per_unit_of_Capital;

  // Compute steady state share of capital.
  ShareOfCapital=alpha/(alpha+(1-alpha)*Labour_per_unit_of_Capital^(psi));

  // Compute steady state of the endogenous variables.
  Labour=1/(1+Consumption_per_unit_of_Labour/((1-alpha)*theta/(1-theta)*Output_per_unit_of_Labour^(1-psi)));
  Consumption = Consumption_per_unit_of_Labour*Labour;
  Capital = Labour/Labour_per_unit_of_Capital;
  Output = Output_per_unit_of_Capital*Capital;

end;

steady;

// Uncomment the following line to trigger the simulation of an artificial sample. This is mandatory
// only the first time you run rbc.mod (as long as you do not delete the generated m file named rbcdataset.m). 

@#include "simulation.inc"

// Uncomment the following line to trigger the estimation.

@#include "estimation.inc"