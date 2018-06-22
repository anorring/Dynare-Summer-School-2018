function [residual, g1, g2, g3] = rbcn_static(y, x, params)
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

residual = zeros( 21, 1);

%
% Model equations
%

T36 = y(4)/y(3)-params(4);
T46 = y(3)^(params(1)-1);
T53 = params(7)*(1-params(4)+y(4)/y(3)-T36*0.5);
T80 = y(8)/y(7)-params(4);
T86 = y(7)^(params(1)-1);
T92 = params(7)*(1-params(4)+y(8)/y(7)-0.5*T80);
T119 = y(12)/y(11)-params(4);
T125 = y(11)^(params(1)-1);
T131 = params(7)*(1-params(4)+y(12)/y(11)-0.5*T119);
T158 = y(16)/y(15)-params(4);
T164 = y(15)^(params(1)-1);
T170 = params(7)*(1-params(4)+y(16)/y(15)-0.5*T158);
T197 = y(20)/y(19)-params(4);
T203 = y(19)^(params(1)-1);
T209 = params(7)*(1-params(4)+y(20)/y(19)-0.5*T197);
T234 = y(3)^params(1);
T236 = params(7)/2;
T238 = T36^2;
T241 = y(7)^params(1);
T245 = T80^2;
T248 = y(11)^params(1);
T252 = T119^2;
T255 = y(15)^params(1);
T259 = T158^2;
T262 = y(19)^params(1);
T266 = T197^2;
lhs =log(y(1));
rhs =log(y(1))*params(5)+params(6)*(x(1)+x(6));
residual(1)= lhs-rhs;
lhs =y(3);
rhs =y(3)*(1-params(4))+y(4);
residual(2)= lhs-rhs;
lhs =params(9)*y(2)^((-1)/params(8));
rhs =y(21);
residual(3)= lhs-rhs;
lhs =y(21)*(1+params(7)*T36);
rhs =params(2)*y(21)*(1+y(1)*params(3)*params(1)*T46+T36*T53);
residual(4)= lhs-rhs;
lhs =log(y(5));
rhs =params(5)*log(y(5))+params(6)*(x(6)+x(2));
residual(5)= lhs-rhs;
lhs =y(7);
rhs =(1-params(4))*y(7)+y(8);
residual(6)= lhs-rhs;
lhs =params(11)*y(6)^((-1)/params(10));
rhs =y(21);
residual(7)= lhs-rhs;
lhs =y(21)*(1+params(7)*T80);
rhs =params(2)*y(21)*(1+params(1)*params(3)*y(5)*T86+T80*T92);
residual(8)= lhs-rhs;
lhs =log(y(9));
rhs =params(5)*log(y(9))+params(6)*(x(6)+x(3));
residual(9)= lhs-rhs;
lhs =y(11);
rhs =(1-params(4))*y(11)+y(12);
residual(10)= lhs-rhs;
lhs =params(13)*y(10)^((-1)/params(12));
rhs =y(21);
residual(11)= lhs-rhs;
lhs =y(21)*(1+params(7)*T119);
rhs =params(2)*y(21)*(1+params(1)*params(3)*y(9)*T125+T119*T131);
residual(12)= lhs-rhs;
lhs =log(y(13));
rhs =params(5)*log(y(13))+params(6)*(x(6)+x(4));
residual(13)= lhs-rhs;
lhs =y(15);
rhs =(1-params(4))*y(15)+y(16);
residual(14)= lhs-rhs;
lhs =params(15)*y(14)^((-1)/params(14));
rhs =y(21);
residual(15)= lhs-rhs;
lhs =y(21)*(1+params(7)*T158);
rhs =params(2)*y(21)*(1+params(1)*params(3)*y(13)*T164+T158*T170);
residual(16)= lhs-rhs;
lhs =log(y(17));
rhs =params(5)*log(y(17))+params(6)*(x(6)+x(5));
residual(17)= lhs-rhs;
lhs =y(19);
rhs =(1-params(4))*y(19)+y(20);
residual(18)= lhs-rhs;
lhs =params(17)*y(18)^((-1)/params(16));
rhs =y(21);
residual(19)= lhs-rhs;
lhs =y(21)*(1+params(7)*T197);
rhs =params(2)*y(21)*(1+params(1)*params(3)*y(17)*T203+T197*T209);
residual(20)= lhs-rhs;
lhs =y(20)+y(18)+y(16)+y(14)+y(12)+y(10)+y(8)+y(6)+y(4)+y(2)-y(3)*params(4)-params(4)*y(7)-params(4)*y(11)-params(4)*y(15)-params(4)*y(19);
rhs =y(1)*params(3)*T234-y(3)*T236*T238+params(3)*y(5)*T241-y(7)*T236*T245+params(3)*y(9)*T248-y(11)*T236*T252+params(3)*y(13)*T255-y(15)*T236*T259+params(3)*y(17)*T262-y(19)*T236*T266;
residual(21)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(21, 21);

  %
  % Jacobian matrix
  %

T285 = (-y(4))/(y(3)*y(3));
T310 = 1/y(3);
T339 = (-y(8))/(y(7)*y(7));
T363 = 1/y(7);
T392 = (-y(12))/(y(11)*y(11));
T416 = 1/y(11);
T445 = (-y(16))/(y(15)*y(15));
T469 = 1/y(15);
T498 = (-y(20))/(y(19)*y(19));
T522 = 1/y(19);
  g1(1,1)=1/y(1)-params(5)*1/y(1);
  g1(2,3)=1-(1-params(4));
  g1(2,4)=(-1);
  g1(3,2)=params(9)*getPowerDeriv(y(2),(-1)/params(8),1);
  g1(3,21)=(-1);
  g1(4,1)=(-(params(2)*y(21)*T46*params(3)*params(1)));
  g1(4,3)=y(21)*params(7)*T285-params(2)*y(21)*(y(1)*params(3)*params(1)*getPowerDeriv(y(3),params(1)-1,1)+T53*T285+T36*params(7)*(T285-0.5*T285));
  g1(4,4)=y(21)*params(7)*T310-params(2)*y(21)*(T53*T310+T36*params(7)*(T310-0.5*T310));
  g1(4,21)=1+params(7)*T36-params(2)*(1+y(1)*params(3)*params(1)*T46+T36*T53);
  g1(5,5)=1/y(5)-params(5)*1/y(5);
  g1(6,7)=1-(1-params(4));
  g1(6,8)=(-1);
  g1(7,6)=params(11)*getPowerDeriv(y(6),(-1)/params(10),1);
  g1(7,21)=(-1);
  g1(8,5)=(-(params(2)*y(21)*T86*params(3)*params(1)));
  g1(8,7)=y(21)*params(7)*T339-params(2)*y(21)*(params(1)*params(3)*y(5)*getPowerDeriv(y(7),params(1)-1,1)+T92*T339+T80*params(7)*(T339-0.5*T339));
  g1(8,8)=y(21)*params(7)*T363-params(2)*y(21)*(T92*T363+T80*params(7)*(T363-0.5*T363));
  g1(8,21)=1+params(7)*T80-params(2)*(1+params(1)*params(3)*y(5)*T86+T80*T92);
  g1(9,9)=1/y(9)-params(5)*1/y(9);
  g1(10,11)=1-(1-params(4));
  g1(10,12)=(-1);
  g1(11,10)=params(13)*getPowerDeriv(y(10),(-1)/params(12),1);
  g1(11,21)=(-1);
  g1(12,9)=(-(params(2)*y(21)*T125*params(3)*params(1)));
  g1(12,11)=y(21)*params(7)*T392-params(2)*y(21)*(params(1)*params(3)*y(9)*getPowerDeriv(y(11),params(1)-1,1)+T131*T392+T119*params(7)*(T392-0.5*T392));
  g1(12,12)=y(21)*params(7)*T416-params(2)*y(21)*(T131*T416+T119*params(7)*(T416-0.5*T416));
  g1(12,21)=1+params(7)*T119-params(2)*(1+params(1)*params(3)*y(9)*T125+T119*T131);
  g1(13,13)=1/y(13)-params(5)*1/y(13);
  g1(14,15)=1-(1-params(4));
  g1(14,16)=(-1);
  g1(15,14)=params(15)*getPowerDeriv(y(14),(-1)/params(14),1);
  g1(15,21)=(-1);
  g1(16,13)=(-(params(2)*y(21)*T164*params(3)*params(1)));
  g1(16,15)=y(21)*params(7)*T445-params(2)*y(21)*(params(1)*params(3)*y(13)*getPowerDeriv(y(15),params(1)-1,1)+T170*T445+T158*params(7)*(T445-0.5*T445));
  g1(16,16)=y(21)*params(7)*T469-params(2)*y(21)*(T170*T469+T158*params(7)*(T469-0.5*T469));
  g1(16,21)=1+params(7)*T158-params(2)*(1+params(1)*params(3)*y(13)*T164+T158*T170);
  g1(17,17)=1/y(17)-params(5)*1/y(17);
  g1(18,19)=1-(1-params(4));
  g1(18,20)=(-1);
  g1(19,18)=params(17)*getPowerDeriv(y(18),(-1)/params(16),1);
  g1(19,21)=(-1);
  g1(20,17)=(-(params(2)*y(21)*T203*params(3)*params(1)));
  g1(20,19)=y(21)*params(7)*T498-params(2)*y(21)*(params(1)*params(3)*y(17)*getPowerDeriv(y(19),params(1)-1,1)+T209*T498+T197*params(7)*(T498-0.5*T498));
  g1(20,20)=y(21)*params(7)*T522-params(2)*y(21)*(T209*T522+T197*params(7)*(T522-0.5*T522));
  g1(20,21)=1+params(7)*T197-params(2)*(1+params(1)*params(3)*y(17)*T203+T197*T209);
  g1(21,1)=(-(params(3)*T234));
  g1(21,2)=1;
  g1(21,3)=(-params(4))-(y(1)*params(3)*getPowerDeriv(y(3),params(1),1)-(T236*T238+y(3)*T236*T285*2*T36));
  g1(21,4)=1-(-(y(3)*T236*2*T36*T310));
  g1(21,5)=(-(params(3)*T241));
  g1(21,6)=1;
  g1(21,7)=(-params(4))-(params(3)*y(5)*getPowerDeriv(y(7),params(1),1)-(T236*T245+y(7)*T236*T339*2*T80));
  g1(21,8)=1-(-(y(7)*T236*2*T80*T363));
  g1(21,9)=(-(params(3)*T248));
  g1(21,10)=1;
  g1(21,11)=(-params(4))-(params(3)*y(9)*getPowerDeriv(y(11),params(1),1)-(T236*T252+y(11)*T236*T392*2*T119));
  g1(21,12)=1-(-(y(11)*T236*2*T119*T416));
  g1(21,13)=(-(params(3)*T255));
  g1(21,14)=1;
  g1(21,15)=(-params(4))-(params(3)*y(13)*getPowerDeriv(y(15),params(1),1)-(T236*T259+y(15)*T236*T445*2*T158));
  g1(21,16)=1-(-(y(15)*T236*2*T158*T469));
  g1(21,17)=(-(params(3)*T262));
  g1(21,18)=1;
  g1(21,19)=(-params(4))-(params(3)*y(17)*getPowerDeriv(y(19),params(1),1)-(T236*T266+y(19)*T236*T498*2*T197));
  g1(21,20)=1-(-(y(19)*T236*2*T197*T522));
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],21,441);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],21,9261);
end
end
end
end
