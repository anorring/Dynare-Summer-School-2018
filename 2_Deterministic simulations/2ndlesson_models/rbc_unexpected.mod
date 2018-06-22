var k, y, L, c, A, a;

varexo epsilon;

parameters beta, theta, tau, alpha, psi, delta, rho, Astar;

beta    =   0.9900;
theta   =   0.3570;
tau     =   2.0000;
alpha   =   0.4500;
psi     =  -0.1000;
delta   =   0.0200;
rho     =   0.8000;
Astar   =   1.0000;

model;
 a = rho*a(-1) + epsilon;
 A = Astar*exp(a);
 y = A*(alpha*k(-1)^psi+(1-alpha)*L^psi)^(1/psi);
 k = y-c + (1-delta)*k(-1);
 (1-theta)/theta*c/(1-L) - (1-alpha)*(y/L)^(1-psi);
 (c^theta*(1-L)^(1-theta))^(1-tau)/c = beta*(c(+1)^theta*(1-L(+1))^(1-theta))^(1-tau)/c(+1)*(alpha*(y(+1)/k)^(1-psi)+1-delta);
end;

steady_state_model;
 a = epsilon/(1-rho);
 A = Astar*exp(a);
 Output_per_unit_of_Capital=((1/beta-1+delta)/alpha)^(1/(1-psi));
 Consumption_per_unit_of_Capital=Output_per_unit_of_Capital-delta;
 Labour_per_unit_of_Capital=(((Output_per_unit_of_Capital/A)^psi-alpha)/(1-alpha))^(1/psi);
 Output_per_unit_of_Labour=Output_per_unit_of_Capital/Labour_per_unit_of_Capital;
 Consumption_per_unit_of_Labour=Consumption_per_unit_of_Capital/Labour_per_unit_of_Capital;

 % Compute steady state of the endogenous variables.
 L=1/(1+Consumption_per_unit_of_Labour/((1-alpha)*theta/(1-theta)*Output_per_unit_of_Labour^(1-psi)));
 c=Consumption_per_unit_of_Labour*L;
 k=L/Labour_per_unit_of_Capital;
 y=Output_per_unit_of_Capital*k;
end;

steady;

// Declare pre-announced shocks
shocks;
 var epsilon;
 periods 5, 15;
 values -0.1, -0.1;
end;

perfect_foresight_setup(periods=300);
perfect_foresight_solver;

// Declare unexpected shock (after first simulation!)
oo_.exo_simul(11, 1) = 0.1; // Period 10 has index 11!

saved_endo = oo_.endo_simul(:, 1:9); // Save periods 0 to 8
saved_exo = oo_.exo_simul(1:9, :);
oo_.endo_simul = oo_.endo_simul(:, 10:end); // Keep periods 9 to 301
oo_.exo_simul = oo_.exo_simul(10:end, :);

periods 291;
perfect_foresight_solver;

// Combine the two simulations
oo_.endo_simul = [ saved_endo oo_.endo_simul ];
oo_.exo_simul = [ saved_exo; oo_.exo_simul ];

rplot epsilon;
rplot c;
