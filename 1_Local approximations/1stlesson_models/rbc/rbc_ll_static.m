function [residual, g1, g2, g3] = rbc_ll_static(y, x, params)
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

T18 = 1/(1+params(1))*1/(exp(y(1))*(1+params(6)));
T55 = exp(y(2))/(1+params(6));
T60 = exp(y(6))*T55^params(4);
T62 = exp(y(3))^(1-params(4));
lhs =1/exp(y(1));
rhs =T18*(1+exp(y(5))-params(2));
residual(1)= lhs-rhs;
lhs =params(3)*y(3);
rhs =y(4)-y(1);
residual(2)= lhs-rhs;
lhs =y(5);
rhs =log(params(4))+y(6)+(params(4)-1)*(y(2)-log(1+params(6)))+y(3)*(1-params(4));
residual(3)= lhs-rhs;
lhs =y(4);
rhs =y(6)+log(1-params(4))+params(4)*(y(2)-log(1+params(6)))-y(3)*params(4);
residual(4)= lhs-rhs;
lhs =exp(y(1))+exp(y(2));
rhs =T55*(1-params(2))+T60*T62;
residual(5)= lhs-rhs;
lhs =y(6);
rhs =y(6)*params(5)+x(1);
residual(6)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(6, 6);

  %
  % Jacobian matrix
  %

  g1(1,1)=(-exp(y(1)))/(exp(y(1))*exp(y(1)))-(1+exp(y(5))-params(2))*1/(1+params(1))*(-(exp(y(1))*(1+params(6))))/(exp(y(1))*(1+params(6))*exp(y(1))*(1+params(6)));
  g1(1,5)=(-(T18*exp(y(5))));
  g1(2,1)=1;
  g1(2,3)=params(3);
  g1(2,4)=(-1);
  g1(3,2)=(-(params(4)-1));
  g1(3,3)=(-(1-params(4)));
  g1(3,5)=1;
  g1(3,6)=(-1);
  g1(4,2)=(-params(4));
  g1(4,3)=params(4);
  g1(4,4)=1;
  g1(4,6)=(-1);
  g1(5,1)=exp(y(1));
  g1(5,2)=exp(y(2))-(T55*(1-params(2))+T62*exp(y(6))*T55*getPowerDeriv(T55,params(4),1));
  g1(5,3)=(-(T60*exp(y(3))*getPowerDeriv(exp(y(3)),1-params(4),1)));
  g1(5,6)=(-(T60*T62));
  g1(6,6)=1-params(5);
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
