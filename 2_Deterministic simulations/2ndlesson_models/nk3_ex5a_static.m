function [residual, g1, g2, g3] = nk3_ex5a_static(y, x, params)
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

residual = zeros( 5, 1);

%
% Model equations
%

T18 = y(1)^(-params(1));
T24 = log(y(2)/(y(2)));
T52 = log(y(3))*params(2)+(1-params(2))*(log((y(2))/params(5))+T24*params(3)+log(y(1)/(y(1)))*params(4))+x(1);
lhs =params(5)*y(3)/y(2)*y(5)*T18;
rhs =y(5)*T18;
residual(1)= lhs-rhs;
lhs =T24;
rhs =T24*params(9)+params(8)*log(y(1)/(y(1)))-log(y(4));
residual(2)= lhs-rhs;
lhs =log(y(3));
rhs =max(0,T52);
residual(3)= lhs-rhs;
lhs =log(y(4));
rhs =log(y(4))*params(6)+x(2);
residual(4)= lhs-rhs;
lhs =log(y(5));
rhs =log(y(5))*params(7)+x(3);
residual(5)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(5, 5);

  %
  % Jacobian matrix
  %

T66 = getPowerDeriv(y(1),(-params(1)),1);
T73 = ((y(1))-y(1))/((y(1))*(y(1)))/(y(1)/(y(1)));
T90 = ((y(2))-y(2))/((y(2))*(y(2)))/(y(2)/(y(2)));
  g1(1,1)=params(5)*y(3)/y(2)*y(5)*T66-y(5)*T66;
  g1(1,2)=T18*y(5)*(-(params(5)*y(3)))/(y(2)*y(2));
  g1(1,3)=T18*y(5)*params(5)/y(2);
  g1(1,5)=params(5)*y(3)/y(2)*T18-T18;
  g1(2,1)=(-(params(8)*T73));
  g1(2,2)=T90-params(9)*T90;
  g1(2,4)=1/y(4);
  g1(3,1)=(-((1-params(2))*params(4)*T73*(1-(0>T52))));
  g1(3,2)=(-((1-(0>T52))*(1-params(2))*(1/params(5)/((y(2))/params(5))+params(3)*T90)));
  g1(3,3)=1/y(3)-(1-(0>T52))*params(2)*1/y(3);
  g1(4,4)=1/y(4)-params(6)*1/y(4);
  g1(5,5)=1/y(5)-params(7)*1/y(5);
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],5,25);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],5,125);
end
end
end
end
