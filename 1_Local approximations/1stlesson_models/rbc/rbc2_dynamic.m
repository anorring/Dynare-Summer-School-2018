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

residual = zeros(6, 1);
T18 = 1/(1+params(1))*1/(y(9)*(1+params(6)));
T36 = y(1)/(1+params(6));
T39 = T36^(params(7)-1);
T40 = params(4)*y(8)*T39;
T46 = params(4)*T36^params(7)+(1-params(4))*y(5)^params(7);
T49 = T46^((1-params(7))/params(7));
T53 = y(5)^(params(7)-1);
T54 = y(8)*(1-params(4))*T53;
T62 = T46^(1/params(7));
lhs =1/y(3);
rhs =T18*(1+y(10)-params(2));
residual(1)= lhs-rhs;
lhs =y(5)^params(3);
rhs =y(6)/y(3);
residual(2)= lhs-rhs;
lhs =y(7);
rhs =T40*T49;
residual(3)= lhs-rhs;
lhs =y(6);
rhs =T49*T54;
residual(4)= lhs-rhs;
lhs =y(3)+y(4);
rhs =T36*(1-params(2))+y(8)*T62;
residual(5)= lhs-rhs;
lhs =log(y(8));
rhs =params(5)*log(y(2))+x(it_, 1);
residual(6)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(6, 11);

  %
  % Jacobian matrix
  %

T91 = params(4)*1/(1+params(6))*getPowerDeriv(T36,params(7),1);
T92 = getPowerDeriv(T46,(1-params(7))/params(7),1);
T93 = T91*T92;
T101 = getPowerDeriv(T46,1/params(7),1);
T108 = (1-params(4))*getPowerDeriv(y(5),params(7),1);
T109 = T92*T108;
  g1(1,3)=(-1)/(y(3)*y(3));
  g1(1,9)=(-((1+y(10)-params(2))*1/(1+params(1))*(-(1+params(6)))/(y(9)*(1+params(6))*y(9)*(1+params(6)))));
  g1(1,10)=(-T18);
  g1(2,3)=(-((-y(6))/(y(3)*y(3))));
  g1(2,5)=getPowerDeriv(y(5),params(3),1);
  g1(2,6)=(-(1/y(3)));
  g1(3,1)=(-(T49*params(4)*y(8)*1/(1+params(6))*getPowerDeriv(T36,params(7)-1,1)+T40*T93));
  g1(3,5)=(-(T40*T109));
  g1(3,7)=1;
  g1(3,8)=(-(T49*params(4)*T39));
  g1(4,1)=(-(T54*T93));
  g1(4,5)=(-(T54*T109+T49*y(8)*(1-params(4))*getPowerDeriv(y(5),params(7)-1,1)));
  g1(4,6)=1;
  g1(4,8)=(-(T49*(1-params(4))*T53));
  g1(5,3)=1;
  g1(5,1)=(-((1-params(2))*1/(1+params(6))+y(8)*T91*T101));
  g1(5,4)=1;
  g1(5,5)=(-(y(8)*T101*T108));
  g1(5,8)=(-T62);
  g1(6,2)=(-(params(5)*1/y(2)));
  g1(6,8)=1/y(8);
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
