function [residual, g1, g2, g3] = nk3_dynamic(y, x, params, steady_state, it_)
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
lhs =params(5)*y(7)/y(11)*y(12)*T18;
rhs =y(9)*T22;
residual(1)= lhs-rhs;
lhs =log(y(6)/(steady_state(2)));
rhs =params(9)*log(y(11)/(steady_state(2)))+params(8)*log(y(5)/(steady_state(1)))-log(y(8));
residual(2)= lhs-rhs;
lhs =log(y(7));
rhs =params(2)*log(y(2))+(1-params(2))*(log((steady_state(2))/params(5))+params(3)*log(y(1)/(steady_state(2)))+log(y(5)/(steady_state(1)))*params(4))+x(it_, 1);
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

T84 = 1/(steady_state(1))/(y(5)/(steady_state(1)));
  g1(1,5)=(-(y(9)*getPowerDeriv(y(5),(-params(1)),1)));
  g1(1,10)=params(5)*y(7)/y(11)*y(12)*getPowerDeriv(y(10),(-params(1)),1);
  g1(1,11)=T18*y(12)*(-(params(5)*y(7)))/(y(11)*y(11));
  g1(1,7)=T18*y(12)*params(5)/y(11);
  g1(1,9)=(-T22);
  g1(1,12)=params(5)*y(7)/y(11)*T18;
  g1(2,5)=(-(params(8)*T84));
  g1(2,6)=1/(steady_state(2))/(y(6)/(steady_state(2)));
  g1(2,11)=(-(params(9)*1/(steady_state(2))/(y(11)/(steady_state(2)))));
  g1(2,8)=1/y(8);
  g1(3,5)=(-((1-params(2))*params(4)*T84));
  g1(3,1)=(-((1-params(2))*params(3)*1/(steady_state(2))/(y(1)/(steady_state(2)))));
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

  g2 = sparse([],[],[],5,225);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],5,3375);
end
end
end
end
