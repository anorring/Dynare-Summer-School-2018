function [residual, g1, g2, g3] = rbcii_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(8, 1);
T24 = y(6)^params(2);
T28 = (1-y(5))^(1-params(2));
T29 = T24*T28;
T32 = T29^(1-params(3));
T38 = y(13)^params(2);
T41 = (1-y(12))^(1-params(2));
T42 = T38*T41;
T43 = T42^(1-params(3));
T44 = T43/y(13);
T55 = 1+params(4)*(y(11)/y(3))^(1-params(5))-params(6);
T78 = params(4)*y(1)^params(5)+(1-params(4))*y(5)^params(5);
T80 = T78^(1/params(5));
lhs =y(9);
rhs =params(7)*y(2)+params(9)*x(it_, 1);
residual(1)= lhs-rhs;
lhs =y(8);
rhs =params(8)*exp(y(9));
residual(2)= lhs-rhs;
lhs =T32/y(6)-y(10);
rhs =params(1)*(T44*T55-y(14)*(1-params(6)));
residual(3)= lhs-rhs;
residual(4) = (1-params(2))/params(2)*y(6)/(1-y(5))-(1-params(4))*(y(4)/y(5))^(1-params(5));
lhs =y(4);
rhs =y(8)*T80;
residual(5)= lhs-rhs;
lhs =y(3);
rhs =y(4)-y(6)+(1-params(6))*y(1);
residual(6)= lhs-rhs;
lhs =y(7);
rhs =y(3)-(1-params(6))*y(1);
residual(7)= lhs-rhs;
residual(8) = y(10);
if nargout >= 2,
  g1 = zeros(8, 15);

  %
  % Jacobian matrix
  %

T93 = getPowerDeriv(T78,1/params(5),1);
T101 = getPowerDeriv(y(11)/y(3),1-params(5),1);
T108 = getPowerDeriv(y(4)/y(5),1-params(5),1);
T121 = getPowerDeriv(T29,1-params(3),1);
T142 = getPowerDeriv(T42,1-params(3),1);
  g1(1,2)=(-params(7));
  g1(1,9)=1;
  g1(1,15)=(-params(9));
  g1(2,8)=1;
  g1(2,9)=(-(params(8)*exp(y(9))));
  g1(3,3)=(-(params(1)*T44*params(4)*(-y(11))/(y(3)*y(3))*T101));
  g1(3,11)=(-(params(1)*T44*params(4)*T101*1/y(3)));
  g1(3,5)=T24*(-(getPowerDeriv(1-y(5),1-params(2),1)))*T121/y(6);
  g1(3,12)=(-(params(1)*T55*T38*(-(getPowerDeriv(1-y(12),1-params(2),1)))*T142/y(13)));
  g1(3,6)=(y(6)*T121*T28*getPowerDeriv(y(6),params(2),1)-T32)/(y(6)*y(6));
  g1(3,13)=(-(params(1)*T55*(y(13)*T142*T41*getPowerDeriv(y(13),params(2),1)-T43)/(y(13)*y(13))));
  g1(3,10)=(-1);
  g1(3,14)=(-(params(1)*(-(1-params(6)))));
  g1(4,4)=(-((1-params(4))*1/y(5)*T108));
  g1(4,5)=(1-params(2))/params(2)*y(6)/((1-y(5))*(1-y(5)))-(1-params(4))*T108*(-y(4))/(y(5)*y(5));
  g1(4,6)=(1-params(2))/params(2)*1/(1-y(5));
  g1(5,1)=(-(y(8)*params(4)*getPowerDeriv(y(1),params(5),1)*T93));
  g1(5,4)=1;
  g1(5,5)=(-(y(8)*T93*(1-params(4))*getPowerDeriv(y(5),params(5),1)));
  g1(5,8)=(-T80);
  g1(6,1)=(-(1-params(6)));
  g1(6,3)=1;
  g1(6,4)=(-1);
  g1(6,6)=1;
  g1(7,1)=1-params(6);
  g1(7,3)=(-1);
  g1(7,7)=1;
  g1(8,10)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],8,225);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],8,3375);
end
end
end
end
