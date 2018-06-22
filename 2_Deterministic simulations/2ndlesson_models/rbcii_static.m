function [residual, g1, g2, g3] = rbcii_static(y, x, params)
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

residual = zeros( 8, 1);

%
% Model equations
%

T23 = y(4)^params(2);
T27 = (1-y(3))^(1-params(2));
T28 = T23*T27;
T31 = T28^(1-params(3));
T32 = T31/y(4);
T46 = 1+params(4)*(y(2)/y(1))^(1-params(5))-params(6);
T66 = params(4)*y(1)^params(5)+(1-params(4))*y(3)^params(5);
T68 = T66^(1/params(5));
lhs =y(7);
rhs =y(7)*params(7)+params(9)*x(1);
residual(1)= lhs-rhs;
lhs =y(6);
rhs =params(8)*exp(y(7));
residual(2)= lhs-rhs;
lhs =T32-y(8);
rhs =params(1)*(T32*T46-y(8)*(1-params(6)));
residual(3)= lhs-rhs;
residual(4) = (1-params(2))/params(2)*y(4)/(1-y(3))-(1-params(4))*(y(2)/y(3))^(1-params(5));
lhs =y(2);
rhs =y(6)*T68;
residual(5)= lhs-rhs;
lhs =y(1);
rhs =y(2)-y(4)+y(1)*(1-params(6));
residual(6)= lhs-rhs;
lhs =y(5);
rhs =y(1)-y(1)*(1-params(6));
residual(7)= lhs-rhs;
residual(8) = y(8);
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(8, 8);

  %
  % Jacobian matrix
  %

T82 = getPowerDeriv(y(2)/y(1),1-params(5),1);
T90 = getPowerDeriv(T66,1/params(5),1);
T103 = getPowerDeriv(y(2)/y(3),1-params(5),1);
T110 = getPowerDeriv(T28,1-params(3),1);
T112 = T23*(-(getPowerDeriv(1-y(3),1-params(2),1)))*T110/y(4);
T136 = (y(4)*T110*T27*getPowerDeriv(y(4),params(2),1)-T31)/(y(4)*y(4));
  g1(1,7)=1-params(7);
  g1(2,6)=1;
  g1(2,7)=(-(params(8)*exp(y(7))));
  g1(3,1)=(-(params(1)*T32*params(4)*(-y(2))/(y(1)*y(1))*T82));
  g1(3,2)=(-(params(1)*T32*params(4)*T82*1/y(1)));
  g1(3,3)=T112-params(1)*T46*T112;
  g1(3,4)=T136-params(1)*T46*T136;
  g1(3,8)=(-1)-params(1)*(-(1-params(6)));
  g1(4,2)=(-((1-params(4))*1/y(3)*T103));
  g1(4,3)=(1-params(2))/params(2)*y(4)/((1-y(3))*(1-y(3)))-(1-params(4))*T103*(-y(2))/(y(3)*y(3));
  g1(4,4)=(1-params(2))/params(2)*1/(1-y(3));
  g1(5,1)=(-(y(6)*params(4)*getPowerDeriv(y(1),params(5),1)*T90));
  g1(5,2)=1;
  g1(5,3)=(-(y(6)*T90*(1-params(4))*getPowerDeriv(y(3),params(5),1)));
  g1(5,6)=(-T68);
  g1(6,1)=1-(1-params(6));
  g1(6,2)=(-1);
  g1(6,4)=1;
  g1(7,1)=(-(1-(1-params(6))));
  g1(7,5)=1;
  g1(8,8)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],8,64);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],8,512);
end
end
end
end
