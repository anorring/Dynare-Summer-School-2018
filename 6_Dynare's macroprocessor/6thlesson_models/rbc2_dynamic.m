function [residual, g1, g2, g3] = rbc2_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(9, 1);
T51 = y(9)^(params(1)-1);
T58 = y(16)/y(9)-params(6);
T61 = params(9)*(1-params(6)+y(16)/y(9)-0.5*T58);
T98 = y(10)^(params(1)-1);
T104 = y(17)/y(10)-params(6);
T107 = params(9)*(1-params(6)+y(17)/y(10)-0.5*T104);
T120 = y(3)^params(1);
T122 = params(9)/2;
T124 = (y(11)/y(3)-params(6))^2;
T128 = y(4)^params(1);
T132 = (y(12)/y(4)-params(6))^2;
lhs =y(9);
rhs =(1-params(6))*y(3)+y(11);
residual(1)= lhs-rhs;
lhs =log(y(5));
rhs =params(7)*log(y(1))+params(8)*(x(it_, 1)+x(it_, 3));
residual(2)= lhs-rhs;
lhs =params(10)*y(7)^((-1)/params(3));
rhs =y(13);
residual(3)= lhs-rhs;
lhs =y(13)*(1+params(9)*(y(11)/y(3)-params(6)));
rhs =params(2)*y(18)*(1+y(14)*params(5)*params(1)*T51+T58*T61);
residual(4)= lhs-rhs;
lhs =y(10);
rhs =(1-params(6))*y(4)+y(12);
residual(5)= lhs-rhs;
lhs =log(y(6));
rhs =params(7)*log(y(2))+params(8)*(x(it_, 3)+x(it_, 2));
residual(6)= lhs-rhs;
lhs =params(11)*y(8)^((-1)/params(4));
rhs =y(13);
residual(7)= lhs-rhs;
lhs =y(13)*(1+params(9)*(y(12)/y(4)-params(6)));
rhs =params(2)*y(18)*(1+params(1)*params(5)*y(15)*T98+T104*T107);
residual(8)= lhs-rhs;
lhs =y(12)+y(11)+y(7)+y(8)-params(6)*(y(3)+y(4));
rhs =y(5)*params(5)*T120-y(3)*T122*T124+params(5)*y(6)*T128-y(4)*T122*T132;
residual(9)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(9, 21);

  %
  % Jacobian matrix
  %

  g1(1,3)=(-(1-params(6)));
  g1(1,9)=1;
  g1(1,11)=(-1);
  g1(2,1)=(-(params(7)*1/y(1)));
  g1(2,5)=1/y(5);
  g1(2,19)=(-params(8));
  g1(2,21)=(-params(8));
  g1(3,7)=params(10)*getPowerDeriv(y(7),(-1)/params(3),1);
  g1(3,13)=(-1);
  g1(4,14)=(-(params(2)*y(18)*T51*params(5)*params(1)));
  g1(4,3)=y(13)*params(9)*(-y(11))/(y(3)*y(3));
  g1(4,9)=(-(params(2)*y(18)*(y(14)*params(5)*params(1)*getPowerDeriv(y(9),params(1)-1,1)+T61*(-y(16))/(y(9)*y(9))+T58*params(9)*((-y(16))/(y(9)*y(9))-0.5*(-y(16))/(y(9)*y(9))))));
  g1(4,11)=y(13)*params(9)*1/y(3);
  g1(4,16)=(-(params(2)*y(18)*(T61*1/y(9)+T58*params(9)*(1/y(9)-0.5*1/y(9)))));
  g1(4,13)=1+params(9)*(y(11)/y(3)-params(6));
  g1(4,18)=(-(params(2)*(1+y(14)*params(5)*params(1)*T51+T58*T61)));
  g1(5,4)=(-(1-params(6)));
  g1(5,10)=1;
  g1(5,12)=(-1);
  g1(6,2)=(-(params(7)*1/y(2)));
  g1(6,6)=1/y(6);
  g1(6,20)=(-params(8));
  g1(6,21)=(-params(8));
  g1(7,8)=params(11)*getPowerDeriv(y(8),(-1)/params(4),1);
  g1(7,13)=(-1);
  g1(8,15)=(-(params(2)*y(18)*T98*params(5)*params(1)));
  g1(8,4)=y(13)*params(9)*(-y(12))/(y(4)*y(4));
  g1(8,10)=(-(params(2)*y(18)*(params(1)*params(5)*y(15)*getPowerDeriv(y(10),params(1)-1,1)+T107*(-y(17))/(y(10)*y(10))+T104*params(9)*((-y(17))/(y(10)*y(10))-0.5*(-y(17))/(y(10)*y(10))))));
  g1(8,12)=y(13)*params(9)*1/y(4);
  g1(8,17)=(-(params(2)*y(18)*(T107*1/y(10)+T104*params(9)*(1/y(10)-0.5*1/y(10)))));
  g1(8,13)=1+params(9)*(y(12)/y(4)-params(6));
  g1(8,18)=(-(params(2)*(1+params(1)*params(5)*y(15)*T98+T104*T107)));
  g1(9,5)=(-(params(5)*T120));
  g1(9,6)=(-(params(5)*T128));
  g1(9,7)=1;
  g1(9,8)=1;
  g1(9,3)=(-params(6))-(y(5)*params(5)*getPowerDeriv(y(3),params(1),1)-(T122*T124+y(3)*T122*(-y(11))/(y(3)*y(3))*2*(y(11)/y(3)-params(6))));
  g1(9,4)=(-params(6))-(params(5)*y(6)*getPowerDeriv(y(4),params(1),1)-(T122*T132+y(4)*T122*(-y(12))/(y(4)*y(4))*2*(y(12)/y(4)-params(6))));
  g1(9,11)=1-(-(y(3)*T122*2*(y(11)/y(3)-params(6))*1/y(3)));
  g1(9,12)=1-(-(y(4)*T122*2*(y(12)/y(4)-params(6))*1/y(4)));

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],9,441);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],9,9261);
end
end
end
end
