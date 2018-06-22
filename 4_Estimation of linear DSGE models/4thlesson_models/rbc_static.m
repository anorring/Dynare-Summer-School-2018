function [residual, g1, g2, g3] = rbc_static(y, x, params)
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

residual = zeros( 6, 1);

%
% Model equations
%

T31 = params(4)*y(1)^params(5)+(1-params(4))*y(3)^params(5);
T33 = T31^(1/params(5));
T56 = y(4)^params(2);
T57 = (1-y(3))^(1-params(2));
T58 = T56*T57;
T61 = T58^(1-params(3));
T70 = 1+params(4)*(y(2)/y(1))^(1-params(5))-params(6);
lhs =y(6);
rhs =y(6)*params(7)+params(9)*x(1);
residual(1)= lhs-rhs;
lhs =y(5);
rhs =params(8)*exp(y(6));
residual(2)= lhs-rhs;
lhs =y(2);
rhs =y(5)*T33;
residual(3)= lhs-rhs;
residual(4) = y(1)+y(4)-y(2)-y(1)*(1-params(6));
residual(5) = (1-params(2))/params(2)*y(4)/(1-y(3))-(1-params(4))*(y(2)/y(3))^(1-params(5));
residual(6) = T61/y(4)-T61*params(1)/y(4)*T70;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(6, 6);

  %
  % Jacobian matrix
  %

T76 = getPowerDeriv(T31,1/params(5),1);
T84 = getPowerDeriv(y(2)/y(1),1-params(5),1);
T90 = getPowerDeriv(y(2)/y(3),1-params(5),1);
T116 = getPowerDeriv(T58,1-params(3),1);
T117 = T56*(-(getPowerDeriv(1-y(3),1-params(2),1)))*T116;
T127 = T116*T57*getPowerDeriv(y(4),params(2),1);
  g1(1,6)=1-params(7);
  g1(2,5)=1;
  g1(2,6)=(-(params(8)*exp(y(6))));
  g1(3,1)=(-(y(5)*params(4)*getPowerDeriv(y(1),params(5),1)*T76));
  g1(3,2)=1;
  g1(3,3)=(-(y(5)*T76*(1-params(4))*getPowerDeriv(y(3),params(5),1)));
  g1(3,5)=(-T33);
  g1(4,1)=1-(1-params(6));
  g1(4,2)=(-1);
  g1(4,4)=1;
  g1(5,2)=(-((1-params(4))*1/y(3)*T90));
  g1(5,3)=(1-params(2))/params(2)*y(4)/((1-y(3))*(1-y(3)))-(1-params(4))*T90*(-y(2))/(y(3)*y(3));
  g1(5,4)=(1-params(2))/params(2)*1/(1-y(3));
  g1(6,1)=(-(T61*params(1)/y(4)*params(4)*(-y(2))/(y(1)*y(1))*T84));
  g1(6,2)=(-(T61*params(1)/y(4)*params(4)*T84*1/y(1)));
  g1(6,3)=T117/y(4)-T70*params(1)*T117/y(4);
  g1(6,4)=(y(4)*T127-T61)/(y(4)*y(4))-T70*(y(4)*params(1)*T127-T61*params(1))/(y(4)*y(4));
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],6,36);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],6,216);
end
end
end
end
