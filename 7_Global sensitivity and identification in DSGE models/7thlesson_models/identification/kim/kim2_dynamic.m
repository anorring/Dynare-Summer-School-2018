function [residual, g1, g2, g3] = kim2_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [nperiods by M_.exo_nbr] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   steady_state  [M_.endo_nbr by 1] double       vector of steady state values
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations.
%                                          Dynare may prepend auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(5, 1);
T20 = params(2)*params(3)*params(1)/(params(2)*params(3)+1-params(2));
T21 = y(4)/T20;
T22 = T21^params(6);
T23 = y(6)*(1+params(6))*T22;
T26 = y(4)/y(3)/params(3);
T28 = T26^params(7);
T35 = (1+params(6))*params(1)*y(8)^(1+params(6));
T37 = y(3)^((1+params(6))*params(1)-1);
T42 = y(7)/y(3)/params(3);
T45 = (1+params(6))*(1-params(3))*T42^params(7);
T47 = (y(7)/T20)^params(6);
T59 = params(3)*(y(4)/params(3))^(1-params(7))+(1-params(3))*y(1)^(1-params(7));
T70 = (1-T20)*(y(2)/(1-T20))^(1+params(6))+T20*T21^(1+params(6));
T74 = y(1)^params(1);
T81 = (1-T20)^params(6);
T82 = y(2)^(1+params(6));
T87 = T81/T82/(1+params(6))*exp(x(it_, 2));
lhs =T23*T28;
rhs =params(2)*y(9)*(T35*T37+T45*T47);
residual(1)= lhs-rhs;
lhs =y(3);
rhs =T59^(1/(1-params(7)));
residual(2)= lhs-rhs;
lhs =T70^(1/(1+params(6)));
rhs =y(5)*T74;
residual(3)= lhs-rhs;
lhs =y(5);
rhs =params(4)+x(it_, 1);
residual(4)= lhs-rhs;
lhs =y(6);
rhs =T87;
residual(5)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(5, 11);

  %
  % Jacobian matrix
  %

T92 = (1-T20)*1/(1-T20)*getPowerDeriv(y(2)/(1-T20),1+params(6),1);
T93 = getPowerDeriv(T70,1/(1+params(6)),1);
T95 = getPowerDeriv(y(2),1+params(6),1);
T97 = (-(T81*T95));
T102 = (-(exp(x(it_, 2))*T97/(T82*T82)/(1+params(6))));
T104 = (1-params(3))*getPowerDeriv(y(1),1-params(7),1);
T105 = getPowerDeriv(T59,1/(1-params(7)),1);
T108 = getPowerDeriv(y(1),params(1),1);
T114 = (-y(4))/(y(3)*y(3))/params(3);
T115 = getPowerDeriv(T26,params(7),1);
T118 = getPowerDeriv(y(3),(1+params(6))*params(1)-1,1);
T122 = (-y(7))/(y(3)*y(3))/params(3);
T123 = getPowerDeriv(T42,params(7),1);
T131 = 1/T20;
T133 = T131*getPowerDeriv(T21,params(6),1);
T134 = y(6)*(1+params(6))*T133;
T136 = 1/y(3)/params(3);
T144 = params(3)*1/params(3)*getPowerDeriv(y(4)/params(3),1-params(7),1);
T149 = T20*T131*getPowerDeriv(T21,1+params(6),1);
T155 = T131*getPowerDeriv(y(7)/T20,params(6),1);
T163 = (1+params(6))*params(1)*getPowerDeriv(y(8),1+params(6),1);
  g1(1,3)=T23*T114*T115-params(2)*y(9)*(T35*T118+T47*(1+params(6))*(1-params(3))*T122*T123);
  g1(1,4)=T28*T134+T23*T115*T136;
  g1(1,7)=(-(params(2)*y(9)*(T47*(1+params(6))*(1-params(3))*T123*T136+T45*T155)));
  g1(1,8)=(-(params(2)*y(9)*T37*T163));
  g1(1,6)=T28*(1+params(6))*T22;
  g1(1,9)=(-(params(2)*(T35*T37+T45*T47)));
  g1(2,1)=(-(T104*T105));
  g1(2,3)=1;
  g1(2,4)=(-(T105*T144));
  g1(3,2)=T92*T93;
  g1(3,1)=(-(y(5)*T108));
  g1(3,4)=T93*T149;
  g1(3,5)=(-T74);
  g1(4,5)=1;
  g1(4,10)=(-1);
  g1(5,2)=T102;
  g1(5,6)=1;
  g1(5,11)=(-T87);

if nargout >= 3,
  %
  % Hessian matrix
  %

  v2 = zeros(35,3);
T178 = getPowerDeriv(T26,params(7),2);
T179 = T114*T178;
T190 = getPowerDeriv(T42,params(7),2);
T191 = T122*T190;
T203 = (-1)/(y(3)*y(3))/params(3);
T267 = getPowerDeriv(T59,1/(1-params(7)),2);
T268 = T104*T267;
T288 = getPowerDeriv(T70,1/(1+params(6)),2);
T289 = T92*T288;
  v2(1,1)=1;
  v2(1,2)=25;
  v2(1,3)=T23*(T115*(-((-y(4))*(y(3)+y(3))))/(y(3)*y(3)*y(3)*y(3))/params(3)+T114*T179)-params(2)*y(9)*(T35*getPowerDeriv(y(3),(1+params(6))*params(1)-1,2)+T47*(1+params(6))*(1-params(3))*(T123*(-((-y(7))*(y(3)+y(3))))/(y(3)*y(3)*y(3)*y(3))/params(3)+T122*T191));
  v2(2,1)=1;
  v2(2,2)=36;
  v2(2,3)=T114*T115*T134+T23*(T136*T179+T115*T203);
  v2(3,1)=1;
  v2(3,2)=26;
  v2(3,3)=  v2(2,3);
  v2(4,1)=1;
  v2(4,2)=37;
  v2(4,3)=T134*T115*T136+T28*y(6)*(1+params(6))*T131*T131*getPowerDeriv(T21,params(6),2)+T134*T115*T136+T23*T136*T136*T178;
  v2(5,1)=1;
  v2(5,2)=69;
  v2(5,3)=(-(params(2)*y(9)*(T47*(1+params(6))*(1-params(3))*(T136*T191+T123*T203)+(1+params(6))*(1-params(3))*T122*T123*T155)));
  v2(6,1)=1;
  v2(6,2)=29;
  v2(6,3)=  v2(5,3);
  v2(7,1)=1;
  v2(7,2)=73;
  v2(7,3)=(-(params(2)*y(9)*((1+params(6))*(1-params(3))*T123*T136*T155+T47*(1+params(6))*(1-params(3))*T136*T136*T190+(1+params(6))*(1-params(3))*T123*T136*T155+T45*T131*T131*getPowerDeriv(y(7)/T20,params(6),2))));
  v2(8,1)=1;
  v2(8,2)=80;
  v2(8,3)=(-(params(2)*y(9)*T118*T163));
  v2(9,1)=1;
  v2(9,2)=30;
  v2(9,3)=  v2(8,3);
  v2(10,1)=1;
  v2(10,2)=85;
  v2(10,3)=(-(params(2)*y(9)*T37*(1+params(6))*params(1)*getPowerDeriv(y(8),1+params(6),2)));
  v2(11,1)=1;
  v2(11,2)=58;
  v2(11,3)=T114*T115*(1+params(6))*T22;
  v2(12,1)=1;
  v2(12,2)=28;
  v2(12,3)=  v2(11,3);
  v2(13,1)=1;
  v2(13,2)=59;
  v2(13,3)=T115*T136*(1+params(6))*T22+T28*(1+params(6))*T133;
  v2(14,1)=1;
  v2(14,2)=39;
  v2(14,3)=  v2(13,3);
  v2(15,1)=1;
  v2(15,2)=91;
  v2(15,3)=(-(params(2)*(T35*T118+T47*(1+params(6))*(1-params(3))*T122*T123)));
  v2(16,1)=1;
  v2(16,2)=31;
  v2(16,3)=  v2(15,3);
  v2(17,1)=1;
  v2(17,2)=95;
  v2(17,3)=(-(params(2)*(T47*(1+params(6))*(1-params(3))*T123*T136+T45*T155)));
  v2(18,1)=1;
  v2(18,2)=75;
  v2(18,3)=  v2(17,3);
  v2(19,1)=1;
  v2(19,2)=96;
  v2(19,3)=(-(params(2)*T37*T163));
  v2(20,1)=1;
  v2(20,2)=86;
  v2(20,3)=  v2(19,3);
  v2(21,1)=2;
  v2(21,2)=1;
  v2(21,3)=(-(T105*(1-params(3))*getPowerDeriv(y(1),1-params(7),2)+T104*T268));
  v2(22,1)=2;
  v2(22,2)=34;
  v2(22,3)=(-(T144*T268));
  v2(23,1)=2;
  v2(23,2)=4;
  v2(23,3)=  v2(22,3);
  v2(24,1)=2;
  v2(24,2)=37;
  v2(24,3)=(-(T144*T144*T267+T105*params(3)*1/params(3)*1/params(3)*getPowerDeriv(y(4)/params(3),1-params(7),2)));
  v2(25,1)=3;
  v2(25,2)=13;
  v2(25,3)=T93*(1-T20)*1/(1-T20)*1/(1-T20)*getPowerDeriv(y(2)/(1-T20),1+params(6),2)+T92*T289;
  v2(26,1)=3;
  v2(26,2)=1;
  v2(26,3)=(-(y(5)*getPowerDeriv(y(1),params(1),2)));
  v2(27,1)=3;
  v2(27,2)=35;
  v2(27,3)=T149*T289;
  v2(28,1)=3;
  v2(28,2)=15;
  v2(28,3)=  v2(27,3);
  v2(29,1)=3;
  v2(29,2)=37;
  v2(29,3)=T149*T149*T288+T93*T20*T131*T131*getPowerDeriv(T21,1+params(6),2);
  v2(30,1)=3;
  v2(30,2)=45;
  v2(30,3)=(-T108);
  v2(31,1)=3;
  v2(31,2)=5;
  v2(31,3)=  v2(30,3);
  v2(32,1)=5;
  v2(32,2)=13;
  v2(32,3)=(-(exp(x(it_, 2))*(T82*T82*(-(T81*getPowerDeriv(y(2),1+params(6),2)))-T97*(T82*T95+T82*T95))/(T82*T82*T82*T82)/(1+params(6))));
  v2(33,1)=5;
  v2(33,2)=112;
  v2(33,3)=T102;
  v2(34,1)=5;
  v2(34,2)=22;
  v2(34,3)=  v2(33,3);
  v2(35,1)=5;
  v2(35,2)=121;
  v2(35,3)=(-T87);
  g2 = sparse(v2(:,1),v2(:,2),v2(:,3),5,121);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],5,1331);
end
end
end
end
