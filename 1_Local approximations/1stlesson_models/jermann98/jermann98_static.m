function [residual, g1, g2, g3] = jermann98_static(y, x, params)
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

residual = zeros( 12, 1);

%
% Model equations
%

T18 = params(8)/(1-1/params(3));
T21 = params(6)*y(4)/y(5);
T23 = T18*T21^(1-1/params(3));
T41 = params(6)^(-params(1));
T42 = y(10)*T41;
T43 = y(5)^params(1);
T67 = y(11)*params(10)/params(6);
T70 = params(8)*T21^((-1)/params(3));
T73 = params(6)^(1-params(1));
T74 = params(1)*y(10)*T73;
T76 = y(5)^(params(1)-1);
T82 = T74*T76+(params(9)+1-params(4)+T23)/T70-T21;
T101 = T67/y(11);
lhs =params(6)*y(5);
rhs =y(5)*(1-params(4))+y(5)*(T23+params(9));
residual(1)= lhs-rhs;
lhs =y(2);
rhs =y(9)-y(8)-y(4);
residual(2)= lhs-rhs;
lhs =y(8);
rhs =y(9)*(1-params(1));
residual(3)= lhs-rhs;
lhs =y(9);
rhs =T42*T43;
residual(4)= lhs-rhs;
lhs =y(1);
rhs =y(2)+y(8);
residual(5)= lhs-rhs;
lhs =y(11);
rhs =(y(1)-y(1)*params(2)/params(6))^(-params(5))-params(2)*params(11)*(params(6)*y(1)-y(1)*params(2))^(-params(5));
residual(6)= lhs-rhs;
lhs =y(11);
rhs =T67*T70*T82;
residual(7)= lhs-rhs;
lhs =log(y(10));
rhs =log(y(10))*params(7)+x(1);
residual(8)= lhs-rhs;
lhs =y(7);
rhs =1/T101;
residual(9)= lhs-rhs;
lhs =y(6);
rhs =T70*T82;
residual(10)= lhs-rhs;
lhs =y(3);
rhs =y(6)-y(7);
residual(11)= lhs-rhs;
lhs =y(12);
rhs =T101;
residual(12)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(12, 12);

  %
  % Jacobian matrix
  %

T118 = getPowerDeriv(T21,1-1/params(3),1);
T123 = getPowerDeriv(T21,(-1)/params(3),1);
T125 = params(8)*params(6)/y(5)*T123;
T132 = (T70*T18*params(6)/y(5)*T118-(params(9)+1-params(4)+T23)*T125)/(T70*T70)-params(6)/y(5);
T143 = (-(params(6)*y(4)))/(y(5)*y(5));
T163 = T74*getPowerDeriv(y(5),params(1)-1,1)+(T70*T18*T118*T143-(params(9)+1-params(4)+T23)*params(8)*T123*T143)/(T70*T70)-T143;
  g1(1,4)=(-(y(5)*T18*params(6)/y(5)*T118));
  g1(1,5)=params(6)-(1-params(4)+T23+params(9)+y(5)*T18*T118*T143);
  g1(2,2)=1;
  g1(2,4)=1;
  g1(2,8)=1;
  g1(2,9)=(-1);
  g1(3,8)=1;
  g1(3,9)=(-(1-params(1)));
  g1(4,5)=(-(T42*getPowerDeriv(y(5),params(1),1)));
  g1(4,9)=1;
  g1(4,10)=(-(T41*T43));
  g1(5,1)=1;
  g1(5,2)=(-1);
  g1(5,8)=(-1);
  g1(6,1)=(-((1-params(2)/params(6))*getPowerDeriv(y(1)-y(1)*params(2)/params(6),(-params(5)),1)-params(2)*params(11)*(params(6)-params(2))*getPowerDeriv(params(6)*y(1)-y(1)*params(2),(-params(5)),1)));
  g1(6,11)=1;
  g1(7,4)=(-(T82*T67*T125+T67*T70*T132));
  g1(7,5)=(-(T82*T67*params(8)*T123*T143+T67*T70*T163));
  g1(7,10)=(-(T67*T70*T76*params(1)*T73));
  g1(7,11)=1-T82*params(10)/params(6)*T70;
  g1(8,10)=1/y(10)-params(7)*1/y(10);
  g1(9,7)=1;
  g1(10,4)=(-(T82*T125+T70*T132));
  g1(10,5)=(-(T82*params(8)*T123*T143+T70*T163));
  g1(10,6)=1;
  g1(10,10)=(-(T70*T76*params(1)*T73));
  g1(11,3)=1;
  g1(11,6)=(-1);
  g1(11,7)=1;
  g1(12,12)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],12,144);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],12,1728);
end
end
end
end
