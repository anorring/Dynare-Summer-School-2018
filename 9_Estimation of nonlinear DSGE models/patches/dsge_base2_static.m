function [residual, g1, g2, g3] = dsge_base2_static(y, x, params)
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

T19 = (1-params(1))*params(3)/(1-params(3))*y(2)*(1-y(4));
T22 = (y(1)/y(4))^params(1);
T26 = y(1)^params(1);
T28 = y(4)^(1-params(1));
T29 = y(2)*T26*T28;
T45 = y(3)^params(3);
T46 = (1-y(4))^(1-params(3));
T47 = T45*T46;
T50 = T47^(1-params(4));
T51 = T50/y(3);
T56 = 1-params(5)+params(1)*T29/y(1);
lhs =y(3);
rhs =T19*T22;
residual(1)= lhs-rhs;
lhs =y(6);
rhs =T29;
residual(2)= lhs-rhs;
lhs =y(5);
rhs =y(6)-y(3);
residual(3)= lhs-rhs;
lhs =y(1);
rhs =y(5)+y(1)*(1-params(5));
residual(4)= lhs-rhs;
lhs =log(y(2));
rhs =log(y(2))*params(6)+x(1);
residual(5)= lhs-rhs;
residual(6) = T51-T51*params(2)*T56;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(6, 6);

  %
  % Jacobian matrix
  %

T61 = getPowerDeriv(y(1)/y(4),params(1),1);
T67 = T28*y(2)*getPowerDeriv(y(1),params(1),1);
T91 = getPowerDeriv(T47,1-params(4),1);
T96 = (y(3)*T46*getPowerDeriv(y(3),params(3),1)*T91-T50)/(y(3)*y(3));
T110 = y(2)*T26*getPowerDeriv(y(4),1-params(1),1);
T116 = T91*T45*(-(getPowerDeriv(1-y(4),1-params(3),1)))/y(3);
  g1(1,1)=(-(T19*1/y(4)*T61));
  g1(1,2)=(-(T22*(1-params(1))*params(3)/(1-params(3))*(1-y(4))));
  g1(1,3)=1;
  g1(1,4)=(-(T22*(-((1-params(1))*params(3)/(1-params(3))*y(2)))+T19*T61*(-y(1))/(y(4)*y(4))));
  g1(2,1)=(-T67);
  g1(2,2)=(-(T26*T28));
  g1(2,4)=(-T110);
  g1(2,6)=1;
  g1(3,3)=1;
  g1(3,5)=1;
  g1(3,6)=(-1);
  g1(4,1)=1-(1-params(5));
  g1(4,5)=(-1);
  g1(5,2)=1/y(2)-params(6)*1/y(2);
  g1(6,1)=(-(T51*params(2)*(y(1)*params(1)*T67-params(1)*T29)/(y(1)*y(1))));
  g1(6,2)=(-(T51*params(2)*params(1)*T26*T28/y(1)));
  g1(6,3)=T96-T56*params(2)*T96;
  g1(6,4)=T116-(T56*params(2)*T116+T51*params(2)*params(1)*T110/y(1));
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
