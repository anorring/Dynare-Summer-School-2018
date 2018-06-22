function [residual, g1, g2, g3] = ls2003_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [nperiods by M_.exo_nbr] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   steady_state  [M_.endo_nbr by 1] double       vector of steady state values
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations.
%                                          Dynare may prepend auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(11, 1);
T27 = params(6)*(2-params(6))*(1-params(5))/params(5);
T41 = exp((-params(7))/400);
T57 = (1-params(5))*(2-params(6))*params(6)*params(8)/(params(5)*(params(5)+params(6)*(2-params(6))*(1-params(5))));
lhs =y(7);
rhs =y(18)-(params(5)+params(6)*(2-params(6))*(1-params(5)))*(y(9)-y(20))-params(6)*(params(5)+params(6)*(2-params(6))*(1-params(5)))*y(21)+T27*(y(8)-y(19))-y(22);
residual(1)= lhs-rhs;
lhs =y(10);
rhs =y(20)*T41+y(21)*params(6)*T41-params(6)*y(11)+y(7)*params(8)/(params(5)+params(6)*(2-params(6))*(1-params(5)))+y(8)*T57;
residual(2)= lhs-rhs;
lhs =y(10);
rhs =y(13)+y(11)*(1-params(6))+y(12);
residual(3)= lhs-rhs;
lhs =y(9);
rhs =params(4)*y(3)+(1-params(4))*(y(10)*params(1)+params(2)*(y(7)+T27*y(8))+y(13)*params(3))+x(it_, 1);
residual(4)= lhs-rhs;
lhs =y(11);
rhs =params(9)*y(4)+x(it_, 2);
residual(5)= lhs-rhs;
lhs =y(8);
rhs =params(11)*y(2)+x(it_, 3);
residual(6)= lhs-rhs;
lhs =y(12);
rhs =params(12)*y(5)+x(it_, 4);
residual(7)= lhs-rhs;
lhs =y(14);
rhs =params(10)*y(6)+x(it_, 5);
residual(8)= lhs-rhs;
lhs =y(15);
rhs =y(14)+y(7)-y(1);
residual(9)= lhs-rhs;
lhs =y(16);
rhs =y(10)*4;
residual(10)= lhs-rhs;
lhs =y(17);
rhs =y(9)*4;
residual(11)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(11, 27);

  %
  % Jacobian matrix
  %

  g1(1,7)=1;
  g1(1,18)=(-1);
  g1(1,8)=(-T27);
  g1(1,19)=T27;
  g1(1,9)=params(5)+params(6)*(2-params(6))*(1-params(5));
  g1(1,20)=(-(params(5)+params(6)*(2-params(6))*(1-params(5))));
  g1(1,21)=params(6)*(params(5)+params(6)*(2-params(6))*(1-params(5)));
  g1(1,22)=1;
  g1(2,7)=(-(params(8)/(params(5)+params(6)*(2-params(6))*(1-params(5)))));
  g1(2,8)=(-T57);
  g1(2,10)=1;
  g1(2,20)=(-T41);
  g1(2,11)=params(6);
  g1(2,21)=(-(params(6)*T41));
  g1(3,10)=1;
  g1(3,11)=(-(1-params(6)));
  g1(3,12)=(-1);
  g1(3,13)=(-1);
  g1(4,7)=(-((1-params(4))*params(2)));
  g1(4,8)=(-((1-params(4))*T27*params(2)));
  g1(4,3)=(-params(4));
  g1(4,9)=1;
  g1(4,10)=(-((1-params(4))*params(1)));
  g1(4,13)=(-((1-params(4))*params(3)));
  g1(4,23)=(-1);
  g1(5,4)=(-params(9));
  g1(5,11)=1;
  g1(5,24)=(-1);
  g1(6,2)=(-params(11));
  g1(6,8)=1;
  g1(6,25)=(-1);
  g1(7,5)=(-params(12));
  g1(7,12)=1;
  g1(7,26)=(-1);
  g1(8,6)=(-params(10));
  g1(8,14)=1;
  g1(8,27)=(-1);
  g1(9,1)=1;
  g1(9,7)=(-1);
  g1(9,14)=(-1);
  g1(9,15)=1;
  g1(10,10)=(-4);
  g1(10,16)=1;
  g1(11,9)=(-4);
  g1(11,17)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],11,729);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],11,19683);
end
end
end
end
