//MODEL:
//test on Dynare to find the lagrangean multipliers.
//We consider a standard NK model. We use the FOCS of the competitive economy and we aim at calculating the Ramsey optimal problem.

//------------------------------------------------------------------------------------------------------------------------
//1. Variable declaration
//------------------------------------------------------------------------------------------------------------------------

var pie, c, n, r, a;

//4 variables + 1 shock

varexo u;




//------------------------------------------------------------------------------------------------------------------------
// 2. Parameter declaration and calibration
//-------------------------------------------------------------------------------------------------------------------------

parameters bet, rho, epsilon, omega, phi, gamma;

bet=0.99;
gamma=3;       //Frish elasticity
omega=17;        //price stickyness
epsilon=8;      //elasticity for each variety of consumption
phi=1;           //coefficient associated to labor effort disutility

rho=0.95;  //coefficient associated to productivity shock


//-----------------------------------------------------------------------------------------------------------------------
// 3. The model
//-----------------------------------------------------------------------------------------------------------------------


model;
a=rho*a(-1)+u;

1/c=bet*(1/c(+1))*(r/pie(+1));               //euler

omega*pie*(pie-1)=bet*omega*(c/c(+1))*pie(+1)*(pie(+1)-1)+epsilon*exp(a)*n*(c/exp(a)*phi*n^gamma-(epsilon-1)/epsilon);  //NK pc

exp(a)*n=c+(omega/2)*(pie-1)^2;
end;

//--------------------------------------------------------------------------------------------------------------------------
// 4. Steady state
//---------------------------------------------------------------------------------------------------------------------------

steady_state_model;
    a = 0;
    r = pie/bet;
    c = f_c(1,pie,omega,bet,epsilon,phi,gamma);
    n=c+(omega/2)*(pie-1)^2;
end;

initval;
pie=1.1;
end;



//---------------------------------------------------------------------------------------------------------------------------
// 5. shocks
//---------------------------------------------------------------------------------------------------------------------------

shocks;
var u; stderr 0.008;
end;

//--------------------------------------------------------------------------------------------------------------------------
// 6. Ramsey problem
//--------------------------------------------------------------------------------------------------------------------------

planner_objective(ln(c)-phi*((n^(1+gamma))/(1+gamma)));

ramsey_policy(planner_discount=0.99,order=1,instruments=(pie));



