function [residual, g1, g2, g3] = rbc2_static(y, x, params)
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

residual = zeros( 9, 1);

%
% Model equations
%

T36 = y(7)/y(5)-params(6);
T46 = y(5)^(params(1)-1);
T53 = params(9)*(1-params(6)+y(7)/y(5)-T36*0.5);
T80 = y(8)/y(6)-params(6);
T86 = y(6)^(params(1)-1);
T92 = params(9)*(1-params(6)+y(8)/y(6)-0.5*T80);
T104 = y(5)^params(1);
T106 = params(9)/2;
T108 = T36^2;
T111 = y(6)^params(1);
T115 = T80^2;
lhs =y(5);
rhs =y(5)*(1-params(6))+y(7);
residual(1)= lhs-rhs;
lhs =log(y(1));
rhs =log(y(1))*params(7)+params(8)*(x(1)+x(3));
residual(2)= lhs-rhs;
lhs =params(10)*y(3)^((-1)/params(3));
rhs =y(9);
residual(3)= lhs-rhs;
lhs =y(9)*(1+params(9)*T36);
rhs =params(2)*y(9)*(1+y(1)*params(5)*params(1)*T46+T36*T53);
residual(4)= lhs-rhs;
lhs =y(6);
rhs =(1-params(6))*y(6)+y(8);
residual(5)= lhs-rhs;
lhs =log(y(2));
rhs =params(7)*log(y(2))+params(8)*(x(3)+x(2));
residual(6)= lhs-rhs;
lhs =params(11)*y(4)^((-1)/params(4));
rhs =y(9);
residual(7)= lhs-rhs;
lhs =y(9)*(1+params(9)*T80);
rhs =params(2)*y(9)*(1+params(1)*params(5)*y(2)*T86+T80*T92);
residual(8)= lhs-rhs;
lhs =y(8)+y(7)+y(3)+y(4)-params(6)*(y(5)+y(6));
rhs =y(1)*params(5)*T104-y(5)*T106*T108+params(5)*y(2)*T111-y(6)*T106*T115;
residual(9)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(9, 9);

  %
  % Jacobian matrix
  %

T145 = (-y(7))/(y(5)*y(5));
T172 = (-y(8))/(y(6)*y(6));
T196 = 1/y(5);
T212 = 1/y(6);
  g1(1,5)=1-(1-params(6));
  g1(1,7)=(-1);
  g1(2,1)=1/y(1)-params(7)*1/y(1);
  g1(3,3)=params(10)*getPowerDeriv(y(3),(-1)/params(3),1);
  g1(3,9)=(-1);
  g1(4,1)=(-(params(2)*y(9)*T46*params(5)*params(1)));
  g1(4,5)=y(9)*params(9)*T145-params(2)*y(9)*(y(1)*params(5)*params(1)*getPowerDeriv(y(5),params(1)-1,1)+T53*T145+T36*params(9)*(T145-0.5*T145));
  g1(4,7)=y(9)*params(9)*T196-params(2)*y(9)*(T53*T196+T36*params(9)*(T196-0.5*T196));
  g1(4,9)=1+params(9)*T36-params(2)*(1+y(1)*params(5)*params(1)*T46+T36*T53);
  g1(5,6)=1-(1-params(6));
  g1(5,8)=(-1);
  g1(6,2)=1/y(2)-params(7)*1/y(2);
  g1(7,4)=params(11)*getPowerDeriv(y(4),(-1)/params(4),1);
  g1(7,9)=(-1);
  g1(8,2)=(-(params(2)*y(9)*T86*params(5)*params(1)));
  g1(8,6)=y(9)*params(9)*T172-params(2)*y(9)*(params(1)*params(5)*y(2)*getPowerDeriv(y(6),params(1)-1,1)+T92*T172+T80*params(9)*(T172-0.5*T172));
  g1(8,8)=y(9)*params(9)*T212-params(2)*y(9)*(T92*T212+T80*params(9)*(T212-0.5*T212));
  g1(8,9)=1+params(9)*T80-params(2)*(1+params(1)*params(5)*y(2)*T86+T80*T92);
  g1(9,1)=(-(params(5)*T104));
  g1(9,2)=(-(params(5)*T111));
  g1(9,3)=1;
  g1(9,4)=1;
  g1(9,5)=(-params(6))-(y(1)*params(5)*getPowerDeriv(y(5),params(1),1)-(T106*T108+y(5)*T106*T145*2*T36));
  g1(9,6)=(-params(6))-(params(5)*y(2)*getPowerDeriv(y(6),params(1),1)-(T106*T115+y(6)*T106*T172*2*T80));
  g1(9,7)=1-(-(y(5)*T106*2*T36*T196));
  g1(9,8)=1-(-(y(6)*T106*2*T80*T212));
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],9,81);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],9,729);
end
end
end
end
