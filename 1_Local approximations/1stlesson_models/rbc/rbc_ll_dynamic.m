function [residual, g1, g2, g3] = rbc_ll_dynamic(y, x, params, steady_state, it_)
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
T20 = 1/(1+params(1))*1/(exp(y(9))*(1+params(6)));
T60 = exp(y(1))/(1+params(6));
T65 = exp(y(8))*T60^params(4);
T67 = exp(y(5))^(1-params(4));
lhs =1/exp(y(3));
rhs =T20*(1+exp(y(10))-params(2));
residual(1)= lhs-rhs;
lhs =params(3)*y(5);
rhs =y(6)-y(3);
residual(2)= lhs-rhs;
lhs =y(7);
rhs =log(params(4))+y(8)+(params(4)-1)*(y(1)-log(1+params(6)))+y(5)*(1-params(4));
residual(3)= lhs-rhs;
lhs =y(6);
rhs =y(8)+log(1-params(4))+params(4)*(y(1)-log(1+params(6)))-y(5)*params(4);
residual(4)= lhs-rhs;
lhs =exp(y(3))+exp(y(4));
rhs =T60*(1-params(2))+T65*T67;
residual(5)= lhs-rhs;
lhs =y(8);
rhs =params(5)*y(2)+x(it_, 1);
residual(6)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(6, 11);

  %
  % Jacobian matrix
  %

  g1(1,3)=(-exp(y(3)))/(exp(y(3))*exp(y(3)));
  g1(1,9)=(-((1+exp(y(10))-params(2))*1/(1+params(1))*(-(exp(y(9))*(1+params(6))))/(exp(y(9))*(1+params(6))*exp(y(9))*(1+params(6)))));
  g1(1,10)=(-(T20*exp(y(10))));
  g1(2,3)=1;
  g1(2,5)=params(3);
  g1(2,6)=(-1);
  g1(3,1)=(-(params(4)-1));
  g1(3,5)=(-(1-params(4)));
  g1(3,7)=1;
  g1(3,8)=(-1);
  g1(4,1)=(-params(4));
  g1(4,5)=params(4);
  g1(4,6)=1;
  g1(4,8)=(-1);
  g1(5,3)=exp(y(3));
  g1(5,1)=(-(T60*(1-params(2))+T67*exp(y(8))*T60*getPowerDeriv(T60,params(4),1)));
  g1(5,4)=exp(y(4));
  g1(5,5)=(-(T65*exp(y(5))*getPowerDeriv(exp(y(5)),1-params(4),1)));
  g1(5,8)=(-(T65*T67));
  g1(6,2)=(-params(5));
  g1(6,8)=1;
  g1(6,11)=(-1);

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],6,121);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],6,1331);
end
end
end
end
