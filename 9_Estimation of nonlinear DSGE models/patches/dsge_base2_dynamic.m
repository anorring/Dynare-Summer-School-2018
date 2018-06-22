function [residual, g1, g2, g3] = dsge_base2_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(6, 1);
T19 = (1-params(1))*params(3)/(1-params(3))*y(4)*(1-y(6));
T22 = (y(1)/y(6))^params(1);
T26 = y(1)^params(1);
T28 = y(6)^(1-params(1));
T48 = y(5)^params(3);
T49 = (1-y(6))^(1-params(3));
T50 = T48*T49;
T53 = T50^(1-params(4));
T57 = y(10)^params(3);
T60 = (1-y(11))^(1-params(3));
T61 = T57*T60;
T62 = T61^(1-params(4));
T64 = params(2)*T62/y(10);
T66 = y(3)^params(1);
T68 = y(11)^(1-params(1));
T70 = params(1)*y(9)*T66*T68;
lhs =y(5);
rhs =T19*T22;
residual(1)= lhs-rhs;
lhs =y(8);
rhs =y(4)*T26*T28;
residual(2)= lhs-rhs;
lhs =y(7);
rhs =y(8)-y(5);
residual(3)= lhs-rhs;
lhs =y(3);
rhs =y(7)+y(1)*(1-params(5));
residual(4)= lhs-rhs;
lhs =log(y(4));
rhs =params(6)*log(y(2))+x(it_, 1);
residual(5)= lhs-rhs;
residual(6) = T53/y(5)-T64*(1-params(5)+T70/y(3));
if nargout >= 2,
  g1 = zeros(6, 12);

  %
  % Jacobian matrix
  %

T77 = getPowerDeriv(y(1)/y(6),params(1),1);
T112 = getPowerDeriv(T50,1-params(4),1);
T120 = getPowerDeriv(T61,1-params(4),1);
  g1(1,1)=(-(T19*1/y(6)*T77));
  g1(1,4)=(-(T22*(1-params(1))*params(3)/(1-params(3))*(1-y(6))));
  g1(1,5)=1;
  g1(1,6)=(-(T22*(-((1-params(1))*params(3)/(1-params(3))*y(4)))+T19*T77*(-y(1))/(y(6)*y(6))));
  g1(2,1)=(-(T28*y(4)*getPowerDeriv(y(1),params(1),1)));
  g1(2,4)=(-(T26*T28));
  g1(2,6)=(-(y(4)*T26*getPowerDeriv(y(6),1-params(1),1)));
  g1(2,8)=1;
  g1(3,5)=1;
  g1(3,7)=1;
  g1(3,8)=(-1);
  g1(4,1)=(-(1-params(5)));
  g1(4,3)=1;
  g1(4,7)=(-1);
  g1(5,2)=(-(params(6)*1/y(2)));
  g1(5,4)=1/y(4);
  g1(5,12)=(-1);
  g1(6,3)=(-(T64*(y(3)*params(1)*T68*y(9)*getPowerDeriv(y(3),params(1),1)-T70)/(y(3)*y(3))));
  g1(6,9)=(-(T64*params(1)*T66*T68/y(3)));
  g1(6,5)=(y(5)*T49*getPowerDeriv(y(5),params(3),1)*T112-T53)/(y(5)*y(5));
  g1(6,10)=(-((1-params(5)+T70/y(3))*params(2)*(y(10)*T60*getPowerDeriv(y(10),params(3),1)*T120-T62)/(y(10)*y(10))));
  g1(6,6)=T112*T48*(-(getPowerDeriv(1-y(6),1-params(3),1)))/y(5);
  g1(6,11)=(-((1-params(5)+T70/y(3))*params(2)*T120*T57*(-(getPowerDeriv(1-y(11),1-params(3),1)))/y(10)+T64*params(1)*y(9)*T66*getPowerDeriv(y(11),1-params(1),1)/y(3)));

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],6,144);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],6,1728);
end
end
end
end
