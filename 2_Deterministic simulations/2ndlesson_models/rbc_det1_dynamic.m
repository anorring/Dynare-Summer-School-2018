function [residual, g1, g2, g3] = rbc_det1_dynamic(y, x, params, steady_state, it_)
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
T30 = params(4)*y(1)^params(5)+(1-params(4))*y(5)^params(5);
T32 = T30^(1/params(5));
T55 = y(6)^params(2);
T56 = (1-y(5))^(1-params(2));
T57 = T55*T56;
T60 = T57^(1-params(3));
T64 = y(11)^params(2);
T67 = (1-y(10))^(1-params(2));
T68 = T64*T67;
T70 = params(1)*T68^(1-params(3));
T71 = T70/y(11);
T77 = 1+params(4)*(y(9)/y(3))^(1-params(5))-params(6);
lhs =y(8);
rhs =params(7)*y(2)+x(it_, 1);
residual(1)= lhs-rhs;
lhs =y(7);
rhs =params(8)*exp(y(8));
residual(2)= lhs-rhs;
lhs =y(4);
rhs =y(7)*T32;
residual(3)= lhs-rhs;
lhs =y(3);
rhs =y(4)-y(6)+y(1)*(1-params(6));
residual(4)= lhs-rhs;
residual(5) = y(6)*(1-params(2))/params(2)/(1-y(5))-(1-params(4))*(y(4)/y(5))^(1-params(5));
lhs =T60/y(6);
rhs =T71*T77;
residual(6)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(6, 12);

  %
  % Jacobian matrix
  %

T82 = getPowerDeriv(T30,1/params(5),1);
T90 = getPowerDeriv(y(9)/y(3),1-params(5),1);
T96 = getPowerDeriv(y(4)/y(5),1-params(5),1);
T122 = getPowerDeriv(T57,1-params(3),1);
T128 = getPowerDeriv(T68,1-params(3),1);
  g1(1,2)=(-params(7));
  g1(1,8)=1;
  g1(1,12)=(-1);
  g1(2,7)=1;
  g1(2,8)=(-(params(8)*exp(y(8))));
  g1(3,1)=(-(y(7)*params(4)*getPowerDeriv(y(1),params(5),1)*T82));
  g1(3,4)=1;
  g1(3,5)=(-(y(7)*T82*(1-params(4))*getPowerDeriv(y(5),params(5),1)));
  g1(3,7)=(-T32);
  g1(4,1)=(-(1-params(6)));
  g1(4,3)=1;
  g1(4,4)=(-1);
  g1(4,6)=1;
  g1(5,4)=(-((1-params(4))*1/y(5)*T96));
  g1(5,5)=y(6)*(1-params(2))/params(2)/((1-y(5))*(1-y(5)))-(1-params(4))*T96*(-y(4))/(y(5)*y(5));
  g1(5,6)=(1-params(2))/params(2)/(1-y(5));
  g1(6,3)=(-(T71*params(4)*(-y(9))/(y(3)*y(3))*T90));
  g1(6,9)=(-(T71*params(4)*T90*1/y(3)));
  g1(6,5)=T55*(-(getPowerDeriv(1-y(5),1-params(2),1)))*T122/y(6);
  g1(6,10)=(-(T77*params(1)*T64*(-(getPowerDeriv(1-y(10),1-params(2),1)))*T128/y(11)));
  g1(6,6)=(y(6)*T122*T56*getPowerDeriv(y(6),params(2),1)-T60)/(y(6)*y(6));
  g1(6,11)=(-(T77*(y(11)*params(1)*T128*T67*getPowerDeriv(y(11),params(2),1)-T70)/(y(11)*y(11))));

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
