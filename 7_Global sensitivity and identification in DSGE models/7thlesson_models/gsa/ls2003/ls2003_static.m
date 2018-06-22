function [residual, g1, g2, g3] = ls2003_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Inputs : 
%   y         [M_.endo_nbr by 1] double    vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1] double     vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1] double   vector of parameter values in declaration order
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the static model equations 
%                                          in order of declaration of the equations.
%                                          Dynare may prepend or append auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g3        [M_.endo_nbr by (M_.endo_nbr)^3] double   Third derivatives matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 11, 1);

%
% Model equations
%

T35 = exp((-params(7))/400);
T50 = (1-params(5))*(2-params(6))*params(6)*params(8)/(params(5)*(params(5)+params(6)*(2-params(6))*(1-params(5))));
lhs =y(1);
rhs =y(1)-(params(5)+params(6)*(2-params(6))*(1-params(5)))*(y(3)-y(4))-params(6)*(params(5)+params(6)*(2-params(6))*(1-params(5)))*y(5)-y(8);
residual(1)= lhs-rhs;
lhs =y(4);
rhs =y(4)*T35+y(5)*params(6)*T35-params(6)*y(5)+y(1)*params(8)/(params(5)+params(6)*(2-params(6))*(1-params(5)))+y(2)*T50;
residual(2)= lhs-rhs;
lhs =y(4);
rhs =y(7)+y(5)*(1-params(6))+y(6);
residual(3)= lhs-rhs;
lhs =y(3);
rhs =y(3)*params(4)+(1-params(4))*(y(4)*params(1)+params(2)*(y(1)+params(6)*(2-params(6))*(1-params(5))/params(5)*y(2))+y(7)*params(3))+x(1);
residual(4)= lhs-rhs;
lhs =y(5);
rhs =y(5)*params(9)+x(2);
residual(5)= lhs-rhs;
lhs =y(2);
rhs =y(2)*params(11)+x(3);
residual(6)= lhs-rhs;
lhs =y(6);
rhs =y(6)*params(12)+x(4);
residual(7)= lhs-rhs;
lhs =y(8);
rhs =y(8)*params(10)+x(5);
residual(8)= lhs-rhs;
lhs =y(9);
rhs =y(8);
residual(9)= lhs-rhs;
lhs =y(10);
rhs =y(4)*4;
residual(10)= lhs-rhs;
lhs =y(11);
rhs =y(3)*4;
residual(11)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(11, 11);

  %
  % Jacobian matrix
  %

  g1(1,3)=params(5)+params(6)*(2-params(6))*(1-params(5));
  g1(1,4)=(-(params(5)+params(6)*(2-params(6))*(1-params(5))));
  g1(1,5)=params(6)*(params(5)+params(6)*(2-params(6))*(1-params(5)));
  g1(1,8)=1;
  g1(2,1)=(-(params(8)/(params(5)+params(6)*(2-params(6))*(1-params(5)))));
  g1(2,2)=(-T50);
  g1(2,4)=1-T35;
  g1(2,5)=(-(params(6)*T35-params(6)));
  g1(3,4)=1;
  g1(3,5)=(-(1-params(6)));
  g1(3,6)=(-1);
  g1(3,7)=(-1);
  g1(4,1)=(-((1-params(4))*params(2)));
  g1(4,2)=(-((1-params(4))*params(6)*(2-params(6))*(1-params(5))/params(5)*params(2)));
  g1(4,3)=1-params(4);
  g1(4,4)=(-((1-params(4))*params(1)));
  g1(4,7)=(-((1-params(4))*params(3)));
  g1(5,5)=1-params(9);
  g1(6,2)=1-params(11);
  g1(7,6)=1-params(12);
  g1(8,8)=1-params(10);
  g1(9,8)=(-1);
  g1(9,9)=1;
  g1(10,4)=(-4);
  g1(10,10)=1;
  g1(11,3)=(-4);
  g1(11,11)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],11,121);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],11,1331);
end
end
end
end
