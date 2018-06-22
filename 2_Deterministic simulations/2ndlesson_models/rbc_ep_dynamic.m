function [residual, g1, g2, g3] = rbc_ep_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(6, 1);
T30 = params(4)*y(1)^params(5)+(1-params(4))*y(5)^params(5);
T32 = T30^(1/params(5));
T55 = y(6)^params(2);
T56 = (1-y(5))^(1-params(2));
T57 = T55*T56;
T60 = T57^(1-params(3));
T64 = y(11)^params(2);
T67 = (1-y(10))^(1-params(2));
T68 = T64*T67;
T70 = params(1)*T68^(1-params(3));
T71 = T70/y(11);
T77 = 1+params(4)*(y(9)/y(3))^(1-params(5))-params(6);
lhs =y(8);
rhs =params(7)*y(2)+x(it_, 1);
residual(1)= lhs-rhs;
lhs =y(7);
rhs =params(8)*exp(y(8));
residual(2)= lhs-rhs;
lhs =y(4);
rhs =y(7)*T32;
residual(3)= lhs-rhs;
lhs =y(3);
rhs =y(4)-y(6)+y(1)*(1-params(6));
residual(4)= lhs-rhs;
residual(5) = y(6)*(1-params(2))/params(2)/(1-y(5))-(1-params(4))*(y(4)/y(5))^(1-params(5));
lhs =T60/y(6);
rhs =T71*T77;
residual(6)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(6, 12);

  %
  % Jacobian matrix
  %

T81 = params(4)*getPowerDeriv(y(1),params(5),1);
T82 = getPowerDeriv(T30,1/params(5),1);
T90 = getPowerDeriv(y(9)/y(3),1-params(5),1);
T92 = params(4)*(-y(9))/(y(3)*y(3))*T90;
T96 = getPowerDeriv(y(4)/y(5),1-params(5),1);
T100 = 1/y(3);
T106 = (1-params(4))*getPowerDeriv(y(5),params(5),1);
T115 = (-y(4))/(y(5)*y(5));
T120 = (-(getPowerDeriv(1-y(5),1-params(2),1)));
T121 = T55*T120;
T122 = getPowerDeriv(T57,1-params(3),1);
T126 = (-(getPowerDeriv(1-y(10),1-params(2),1)));
T127 = T64*T126;
T128 = getPowerDeriv(T68,1-params(3),1);
T131 = params(1)*T127*T128/y(11);
T135 = getPowerDeriv(y(6),params(2),1);
T136 = T56*T135;
T142 = getPowerDeriv(y(11),params(2),1);
T143 = T67*T142;
T149 = (y(11)*params(1)*T128*T143-T70)/(y(11)*y(11));
  g1(1,2)=(-params(7));
  g1(1,8)=1;
  g1(1,12)=(-1);
  g1(2,7)=1;
  g1(2,8)=(-(params(8)*exp(y(8))));
  g1(3,1)=(-(y(7)*T81*T82));
  g1(3,4)=1;
  g1(3,5)=(-(y(7)*T82*T106));
  g1(3,7)=(-T32);
  g1(4,1)=(-(1-params(6)));
  g1(4,3)=1;
  g1(4,4)=(-1);
  g1(4,6)=1;
  g1(5,4)=(-((1-params(4))*1/y(5)*T96));
  g1(5,5)=y(6)*(1-params(2))/params(2)/((1-y(5))*(1-y(5)))-(1-params(4))*T96*T115;
  g1(5,6)=(1-params(2))/params(2)/(1-y(5));
  g1(6,3)=(-(T71*T92));
  g1(6,9)=(-(T71*params(4)*T90*T100));
  g1(6,5)=T121*T122/y(6);
  g1(6,10)=(-(T77*T131));
  g1(6,6)=(y(6)*T122*T136-T60)/(y(6)*y(6));
  g1(6,11)=(-(T77*T149));

if nargout >= 3,
  %
  % Hessian matrix
  %

  v2 = zeros(35,3);
T157 = getPowerDeriv(T30,1/params(5),2);
T158 = T81*T157;
T177 = getPowerDeriv(y(4)/y(5),1-params(5),2);
T178 = 1/y(5)*T177;
T212 = getPowerDeriv(y(9)/y(3),1-params(5),2);
T213 = (-y(9))/(y(3)*y(3))*T212;
T235 = getPowerDeriv(T57,1-params(3),2);
T236 = T121*T235;
T248 = getPowerDeriv(T68,1-params(3),2);
T249 = T127*T248;
  v2(1,1)=2;
  v2(1,2)=92;
  v2(1,3)=(-(params(8)*exp(y(8))));
  v2(2,1)=3;
  v2(2,2)=1;
  v2(2,3)=(-(y(7)*(T82*params(4)*getPowerDeriv(y(1),params(5),2)+T81*T158)));
  v2(3,1)=3;
  v2(3,2)=49;
  v2(3,3)=(-(y(7)*T106*T158));
  v2(4,1)=3;
  v2(4,2)=5;
  v2(4,3)=  v2(3,3);
  v2(5,1)=3;
  v2(5,2)=53;
  v2(5,3)=(-(y(7)*(T106*T106*T157+T82*(1-params(4))*getPowerDeriv(y(5),params(5),2))));
  v2(6,1)=3;
  v2(6,2)=73;
  v2(6,3)=(-(T81*T82));
  v2(7,1)=3;
  v2(7,2)=7;
  v2(7,3)=  v2(6,3);
  v2(8,1)=3;
  v2(8,2)=77;
  v2(8,3)=(-(T82*T106));
  v2(9,1)=3;
  v2(9,2)=55;
  v2(9,3)=  v2(8,3);
  v2(10,1)=5;
  v2(10,2)=40;
  v2(10,3)=(-((1-params(4))*1/y(5)*T178));
  v2(11,1)=5;
  v2(11,2)=52;
  v2(11,3)=(-((1-params(4))*(T115*T178+T96*(-1)/(y(5)*y(5)))));
  v2(12,1)=5;
  v2(12,2)=41;
  v2(12,3)=  v2(11,3);
  v2(13,1)=5;
  v2(13,2)=53;
  v2(13,3)=(-(y(6)*(1-params(2))/params(2)*((-(1-y(5)))-(1-y(5)))))/((1-y(5))*(1-y(5))*(1-y(5))*(1-y(5)))-(1-params(4))*(T115*T115*T177+T96*(-((-y(4))*(y(5)+y(5))))/(y(5)*y(5)*y(5)*y(5)));
  v2(14,1)=5;
  v2(14,2)=65;
  v2(14,3)=(1-params(2))/params(2)/((1-y(5))*(1-y(5)));
  v2(15,1)=5;
  v2(15,2)=54;
  v2(15,3)=  v2(14,3);
  v2(16,1)=6;
  v2(16,2)=27;
  v2(16,3)=(-(T71*params(4)*(T90*(-((-y(9))*(y(3)+y(3))))/(y(3)*y(3)*y(3)*y(3))+(-y(9))/(y(3)*y(3))*T213)));
  v2(17,1)=6;
  v2(17,2)=99;
  v2(17,3)=(-(T71*params(4)*(T100*T213+T90*(-1)/(y(3)*y(3)))));
  v2(18,1)=6;
  v2(18,2)=33;
  v2(18,3)=  v2(17,3);
  v2(19,1)=6;
  v2(19,2)=105;
  v2(19,3)=(-(T71*params(4)*T100*T100*T212));
  v2(20,1)=6;
  v2(20,2)=53;
  v2(20,3)=(T122*T55*getPowerDeriv(1-y(5),1-params(2),2)+T121*T236)/y(6);
  v2(21,1)=6;
  v2(21,2)=111;
  v2(21,3)=(-(T92*T131));
  v2(22,1)=6;
  v2(22,2)=34;
  v2(22,3)=  v2(21,3);
  v2(23,1)=6;
  v2(23,2)=117;
  v2(23,3)=(-(params(4)*T90*T100*T131));
  v2(24,1)=6;
  v2(24,2)=106;
  v2(24,3)=  v2(23,3);
  v2(25,1)=6;
  v2(25,2)=118;
  v2(25,3)=(-(T77*params(1)*(T128*T64*getPowerDeriv(1-y(10),1-params(2),2)+T127*T249)/y(11)));
  v2(26,1)=6;
  v2(26,2)=65;
  v2(26,3)=(y(6)*(T136*T236+T122*T120*T135)-T121*T122)/(y(6)*y(6));
  v2(27,1)=6;
  v2(27,2)=54;
  v2(27,3)=  v2(26,3);
  v2(28,1)=6;
  v2(28,2)=66;
  v2(28,3)=(y(6)*y(6)*(T122*T136+y(6)*(T136*T136*T235+T122*T56*getPowerDeriv(y(6),params(2),2))-T122*T136)-(y(6)*T122*T136-T60)*(y(6)+y(6)))/(y(6)*y(6)*y(6)*y(6));
  v2(29,1)=6;
  v2(29,2)=123;
  v2(29,3)=(-(T92*T149));
  v2(30,1)=6;
  v2(30,2)=35;
  v2(30,3)=  v2(29,3);
  v2(31,1)=6;
  v2(31,2)=129;
  v2(31,3)=(-(params(4)*T90*T100*T149));
  v2(32,1)=6;
  v2(32,2)=107;
  v2(32,3)=  v2(31,3);
  v2(33,1)=6;
  v2(33,2)=130;
  v2(33,3)=(-(T77*(y(11)*params(1)*(T143*T249+T128*T126*T142)-params(1)*T127*T128)/(y(11)*y(11))));
  v2(34,1)=6;
  v2(34,2)=119;
  v2(34,3)=  v2(33,3);
  v2(35,1)=6;
  v2(35,2)=131;
  v2(35,3)=(-(T77*(y(11)*y(11)*(params(1)*T128*T143+y(11)*params(1)*(T143*T143*T248+T128*T67*getPowerDeriv(y(11),params(2),2))-params(1)*T128*T143)-(y(11)*params(1)*T128*T143-T70)*(y(11)+y(11)))/(y(11)*y(11)*y(11)*y(11))));
  g2 = sparse(v2(:,1),v2(:,2),v2(:,3),6,144);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],6,1728);
end
end
end
end
