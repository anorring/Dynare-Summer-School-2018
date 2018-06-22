function [residual, g1, g2, g3] = nk3_ex6_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(5, 1);
T18 = y(10)^(-params(1));
T22 = y(5)^(-params(1));
T27 = y(6)/(steady_state(2));
T30 = y(11)/(steady_state(2));
T35 = y(5)/(steady_state(1));
T53 = y(1)/(steady_state(2));
lhs =params(5)*y(7)/y(11)*y(12)*T18;
rhs =y(9)*T22;
residual(1)= lhs-rhs;
lhs =log(T27);
rhs =params(9)*log(T30)+params(8)*log(T35)-log(y(8));
residual(2)= lhs-rhs;
lhs =log(y(7));
rhs =params(2)*log(y(2))+(1-params(2))*(log((steady_state(2))/params(5))+params(3)*log(T53)+log(T35)*params(4))+x(it_, 1);
residual(3)= lhs-rhs;
lhs =log(y(8));
rhs =params(6)*log(y(3))+x(it_, 2);
residual(4)= lhs-rhs;
lhs =log(y(9));
rhs =params(7)*log(y(4))+x(it_, 3);
residual(5)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(5, 15);

  %
  % Jacobian matrix
  %

T80 = getPowerDeriv(y(5),(-params(1)),1);
T84 = 1/(steady_state(1))/T35;
T90 = getPowerDeriv(y(10),(-params(1)),1);
T92 = 1/(steady_state(2));
  g1(1,5)=(-(y(9)*T80));
  g1(1,10)=params(5)*y(7)/y(11)*y(12)*T90;
  g1(1,11)=T18*y(12)*(-(params(5)*y(7)))/(y(11)*y(11));
  g1(1,7)=T18*y(12)*params(5)/y(11);
  g1(1,9)=(-T22);
  g1(1,12)=params(5)*y(7)/y(11)*T18;
  g1(2,5)=(-(params(8)*T84));
  g1(2,6)=T92/T27;
  g1(2,11)=(-(params(9)*T92/T30));
  g1(2,8)=1/y(8);
  g1(3,5)=(-((1-params(2))*params(4)*T84));
  g1(3,1)=(-((1-params(2))*params(3)*T92/T53));
  g1(3,2)=(-(params(2)*1/y(2)));
  g1(3,7)=1/y(7);
  g1(3,13)=(-1);
  g1(4,3)=(-(params(6)*1/y(3)));
  g1(4,8)=1/y(8);
  g1(4,14)=(-1);
  g1(5,4)=(-(params(7)*1/y(4)));
  g1(5,9)=1/y(9);
  g1(5,15)=(-1);

if nargout >= 3,
  %
  % Hessian matrix
  %

  v2 = zeros(29,3);
T149 = (-(1/(steady_state(1))*1/(steady_state(1))))/(T35*T35);
  v2(1,1)=1;
  v2(1,2)=65;
  v2(1,3)=(-(y(9)*getPowerDeriv(y(5),(-params(1)),2)));
  v2(2,1)=1;
  v2(2,2)=145;
  v2(2,3)=params(5)*y(7)/y(11)*y(12)*getPowerDeriv(y(10),(-params(1)),2);
  v2(3,1)=1;
  v2(3,2)=160;
  v2(3,3)=T90*y(12)*(-(params(5)*y(7)))/(y(11)*y(11));
  v2(4,1)=1;
  v2(4,2)=146;
  v2(4,3)=  v2(3,3);
  v2(5,1)=1;
  v2(5,2)=161;
  v2(5,3)=T18*y(12)*(-((-(params(5)*y(7)))*(y(11)+y(11))))/(y(11)*y(11)*y(11)*y(11));
  v2(6,1)=1;
  v2(6,2)=100;
  v2(6,3)=T90*y(12)*params(5)/y(11);
  v2(7,1)=1;
  v2(7,2)=142;
  v2(7,3)=  v2(6,3);
  v2(8,1)=1;
  v2(8,2)=101;
  v2(8,3)=T18*y(12)*(-params(5))/(y(11)*y(11));
  v2(9,1)=1;
  v2(9,2)=157;
  v2(9,3)=  v2(8,3);
  v2(10,1)=1;
  v2(10,2)=125;
  v2(10,3)=(-T80);
  v2(11,1)=1;
  v2(11,2)=69;
  v2(11,3)=  v2(10,3);
  v2(12,1)=1;
  v2(12,2)=175;
  v2(12,3)=params(5)*y(7)/y(11)*T90;
  v2(13,1)=1;
  v2(13,2)=147;
  v2(13,3)=  v2(12,3);
  v2(14,1)=1;
  v2(14,2)=176;
  v2(14,3)=T18*(-(params(5)*y(7)))/(y(11)*y(11));
  v2(15,1)=1;
  v2(15,2)=162;
  v2(15,3)=  v2(14,3);
  v2(16,1)=1;
  v2(16,2)=172;
  v2(16,3)=T18*params(5)/y(11);
  v2(17,1)=1;
  v2(17,2)=102;
  v2(17,3)=  v2(16,3);
  v2(18,1)=2;
  v2(18,2)=65;
  v2(18,3)=(-(params(8)*T149));
  v2(19,1)=2;
  v2(19,2)=81;
  v2(19,3)=(-(T92*T92))/(T27*T27);
  v2(20,1)=2;
  v2(20,2)=161;
  v2(20,3)=(-(params(9)*(-(T92*T92))/(T30*T30)));
  v2(21,1)=2;
  v2(21,2)=113;
  v2(21,3)=(-1)/(y(8)*y(8));
  v2(22,1)=3;
  v2(22,2)=65;
  v2(22,3)=(-((1-params(2))*params(4)*T149));
  v2(23,1)=3;
  v2(23,2)=1;
  v2(23,3)=(-((1-params(2))*params(3)*(-(T92*T92))/(T53*T53)));
  v2(24,1)=3;
  v2(24,2)=17;
  v2(24,3)=(-(params(2)*(-1)/(y(2)*y(2))));
  v2(25,1)=3;
  v2(25,2)=97;
  v2(25,3)=(-1)/(y(7)*y(7));
  v2(26,1)=4;
  v2(26,2)=33;
  v2(26,3)=(-(params(6)*(-1)/(y(3)*y(3))));
  v2(27,1)=4;
  v2(27,2)=113;
  v2(27,3)=(-1)/(y(8)*y(8));
  v2(28,1)=5;
  v2(28,2)=49;
  v2(28,3)=(-(params(7)*(-1)/(y(4)*y(4))));
  v2(29,1)=5;
  v2(29,2)=129;
  v2(29,3)=(-1)/(y(9)*y(9));
  g2 = sparse(v2(:,1),v2(:,2),v2(:,3),5,225);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],5,3375);
end
end
end
end
