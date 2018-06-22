function [residual, g1, g2, g3] = kim2_static(y, x, params)
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

T20 = params(2)*params(3)*params(1)/(params(2)*params(3)+1-params(2));
T21 = y(3)/T20;
T22 = T21^params(6);
T26 = y(3)/y(2)/params(3);
T28 = T26^params(7);
T34 = (1+params(6))*params(1)*y(4)^(1+params(6));
T36 = y(2)^((1+params(6))*params(1)-1);
T51 = params(3)*(y(3)/params(3))^(1-params(7))+(1-params(3))*y(2)^(1-params(7));
T62 = (1-T20)*(y(1)/(1-T20))^(1+params(6))+T20*T21^(1+params(6));
T65 = y(2)^params(1);
T72 = (1-T20)^params(6);
T73 = y(1)^(1+params(6));
lhs =y(5)*(1+params(6))*T22*T28;
rhs =y(5)*params(2)*(T34*T36+T22*(1+params(6))*T28*(1-params(3)));
residual(1)= lhs-rhs;
lhs =y(2);
rhs =T51^(1/(1-params(7)));
residual(2)= lhs-rhs;
lhs =T62^(1/(1+params(6)));
rhs =y(4)*T65;
residual(3)= lhs-rhs;
lhs =y(4);
rhs =params(4)+x(1);
residual(4)= lhs-rhs;
lhs =y(5);
rhs =T72/T73/(1+params(6))*exp(x(2));
residual(5)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(5, 5);

  %
  % Jacobian matrix
  %

T83 = (1-T20)*1/(1-T20)*getPowerDeriv(y(1)/(1-T20),1+params(6),1);
T84 = getPowerDeriv(T62,1/(1+params(6)),1);
T86 = getPowerDeriv(y(1),1+params(6),1);
T88 = (-(T72*T86));
T97 = (-y(3))/(y(2)*y(2))/params(3);
T98 = getPowerDeriv(T26,params(7),1);
T99 = T97*T98;
T101 = getPowerDeriv(y(2),(1+params(6))*params(1)-1,1);
T110 = (1-params(3))*getPowerDeriv(y(2),1-params(7),1);
T111 = getPowerDeriv(T51,1/(1-params(7)),1);
T114 = getPowerDeriv(y(2),params(1),1);
T117 = 1/T20;
T119 = T117*getPowerDeriv(T21,params(6),1);
T122 = 1/y(2)/params(3);
T123 = T98*T122;
T137 = params(3)*1/params(3)*getPowerDeriv(y(3)/params(3),1-params(7),1);
T142 = T20*T117*getPowerDeriv(T21,1+params(6),1);
T145 = (1+params(6))*params(1)*getPowerDeriv(y(4),1+params(6),1);
  g1(1,2)=y(5)*(1+params(6))*T22*T99-y(5)*params(2)*(T34*T101+T22*(1+params(6))*(1-params(3))*T99);
  g1(1,3)=T28*y(5)*(1+params(6))*T119+y(5)*(1+params(6))*T22*T123-y(5)*params(2)*((1+params(6))*T28*(1-params(3))*T119+T22*(1+params(6))*(1-params(3))*T123);
  g1(1,4)=(-(y(5)*params(2)*T36*T145));
  g1(1,5)=T28*(1+params(6))*T22-params(2)*(T34*T36+T22*(1+params(6))*T28*(1-params(3)));
  g1(2,2)=1-T110*T111;
  g1(2,3)=(-(T111*T137));
  g1(3,1)=T83*T84;
  g1(3,2)=(-(y(4)*T114));
  g1(3,3)=T84*T142;
  g1(3,4)=(-T65);
  g1(4,4)=1;
  g1(5,1)=(-(exp(x(2))*T88/(T73*T73)/(1+params(6))));
  g1(5,5)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  v2 = zeros(25,3);
T160 = getPowerDeriv(T26,params(7),2);
T161 = T97*T160;
T164 = T98*(-((-y(3))*(y(2)+y(2))))/(y(2)*y(2)*y(2)*y(2))/params(3)+T97*T161;
T179 = T122*T161+T98*(-1)/(y(2)*y(2))/params(3);
T191 = T117*T117*getPowerDeriv(T21,params(6),2);
T232 = getPowerDeriv(T51,1/(1-params(7)),2);
T233 = T110*T232;
T253 = getPowerDeriv(T62,1/(1+params(6)),2);
T254 = T83*T253;
  v2(1,1)=1;
  v2(1,2)=7;
  v2(1,3)=y(5)*(1+params(6))*T22*T164-y(5)*params(2)*(T34*getPowerDeriv(y(2),(1+params(6))*params(1)-1,2)+T22*(1+params(6))*(1-params(3))*T164);
  v2(2,1)=1;
  v2(2,2)=12;
  v2(2,3)=T99*y(5)*(1+params(6))*T119+y(5)*(1+params(6))*T22*T179-y(5)*params(2)*((1+params(6))*(1-params(3))*T99*T119+T22*(1+params(6))*(1-params(3))*T179);
  v2(3,1)=1;
  v2(3,2)=8;
  v2(3,3)=  v2(2,3);
  v2(4,1)=1;
  v2(4,2)=13;
  v2(4,3)=y(5)*(1+params(6))*T119*T123+T28*y(5)*(1+params(6))*T191+y(5)*(1+params(6))*T119*T123+y(5)*(1+params(6))*T22*T122*T122*T160-y(5)*params(2)*(T119*(1+params(6))*(1-params(3))*T123+(1+params(6))*T28*(1-params(3))*T191+T119*(1+params(6))*(1-params(3))*T123+T22*(1+params(6))*(1-params(3))*T122*T122*T160);
  v2(5,1)=1;
  v2(5,2)=17;
  v2(5,3)=(-(y(5)*params(2)*T101*T145));
  v2(6,1)=1;
  v2(6,2)=9;
  v2(6,3)=  v2(5,3);
  v2(7,1)=1;
  v2(7,2)=19;
  v2(7,3)=(-(y(5)*params(2)*T36*(1+params(6))*params(1)*getPowerDeriv(y(4),1+params(6),2)));
  v2(8,1)=1;
  v2(8,2)=22;
  v2(8,3)=T99*(1+params(6))*T22-params(2)*(T34*T101+T22*(1+params(6))*(1-params(3))*T99);
  v2(9,1)=1;
  v2(9,2)=10;
  v2(9,3)=  v2(8,3);
  v2(10,1)=1;
  v2(10,2)=23;
  v2(10,3)=T123*(1+params(6))*T22+T28*(1+params(6))*T119-params(2)*((1+params(6))*T28*(1-params(3))*T119+T22*(1+params(6))*(1-params(3))*T123);
  v2(11,1)=1;
  v2(11,2)=15;
  v2(11,3)=  v2(10,3);
  v2(12,1)=1;
  v2(12,2)=24;
  v2(12,3)=(-(params(2)*T36*T145));
  v2(13,1)=1;
  v2(13,2)=20;
  v2(13,3)=  v2(12,3);
  v2(14,1)=2;
  v2(14,2)=7;
  v2(14,3)=(-(T111*(1-params(3))*getPowerDeriv(y(2),1-params(7),2)+T110*T233));
  v2(15,1)=2;
  v2(15,2)=12;
  v2(15,3)=(-(T137*T233));
  v2(16,1)=2;
  v2(16,2)=8;
  v2(16,3)=  v2(15,3);
  v2(17,1)=2;
  v2(17,2)=13;
  v2(17,3)=(-(T137*T137*T232+T111*params(3)*1/params(3)*1/params(3)*getPowerDeriv(y(3)/params(3),1-params(7),2)));
  v2(18,1)=3;
  v2(18,2)=1;
  v2(18,3)=T84*(1-T20)*1/(1-T20)*1/(1-T20)*getPowerDeriv(y(1)/(1-T20),1+params(6),2)+T83*T254;
  v2(19,1)=3;
  v2(19,2)=7;
  v2(19,3)=(-(y(4)*getPowerDeriv(y(2),params(1),2)));
  v2(20,1)=3;
  v2(20,2)=11;
  v2(20,3)=T142*T254;
  v2(21,1)=3;
  v2(21,2)=3;
  v2(21,3)=  v2(20,3);
  v2(22,1)=3;
  v2(22,2)=13;
  v2(22,3)=T142*T142*T253+T84*T20*T117*T117*getPowerDeriv(T21,1+params(6),2);
  v2(23,1)=3;
  v2(23,2)=17;
  v2(23,3)=(-T114);
  v2(24,1)=3;
  v2(24,2)=9;
  v2(24,3)=  v2(23,3);
  v2(25,1)=5;
  v2(25,2)=1;
  v2(25,3)=(-(exp(x(2))*(T73*T73*(-(T72*getPowerDeriv(y(1),1+params(6),2)))-T88*(T73*T86+T73*T86))/(T73*T73*T73*T73)/(1+params(6))));
  g2 = sparse(v2(:,1),v2(:,2),v2(:,3),5,25);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],5,125);
end
end
end
end
