function [residual, g1, g2, g3] = rbcn_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(21, 1);
T51 = y(13)^(params(1)-1);
T58 = y(33)/y(13)-params(4);
T61 = params(7)*(1-params(4)+y(33)/y(13)-0.5*T58);
T98 = y(17)^(params(1)-1);
T104 = y(35)/y(17)-params(4);
T107 = params(7)*(1-params(4)+y(35)/y(17)-0.5*T104);
T144 = y(21)^(params(1)-1);
T150 = y(37)/y(21)-params(4);
T153 = params(7)*(1-params(4)+y(37)/y(21)-0.5*T150);
T190 = y(25)^(params(1)-1);
T196 = y(39)/y(25)-params(4);
T199 = params(7)*(1-params(4)+y(39)/y(25)-0.5*T196);
T236 = y(29)^(params(1)-1);
T242 = y(41)/y(29)-params(4);
T245 = params(7)*(1-params(4)+y(41)/y(29)-0.5*T242);
T271 = y(2)^params(1);
T273 = params(7)/2;
T275 = (y(14)/y(2)-params(4))^2;
T279 = y(4)^params(1);
T283 = (y(18)/y(4)-params(4))^2;
T287 = y(6)^params(1);
T291 = (y(22)/y(6)-params(4))^2;
T295 = y(8)^params(1);
T299 = (y(26)/y(8)-params(4))^2;
T303 = y(10)^params(1);
T307 = (y(30)/y(10)-params(4))^2;
lhs =log(y(11));
rhs =params(5)*log(y(1))+params(6)*(x(it_, 1)+x(it_, 6));
residual(1)= lhs-rhs;
lhs =y(13);
rhs =(1-params(4))*y(2)+y(14);
residual(2)= lhs-rhs;
lhs =params(9)*y(12)^((-1)/params(8));
rhs =y(31);
residual(3)= lhs-rhs;
lhs =y(31)*(1+params(7)*(y(14)/y(2)-params(4)));
rhs =params(2)*y(42)*(1+y(32)*params(3)*params(1)*T51+T58*T61);
residual(4)= lhs-rhs;
lhs =log(y(15));
rhs =params(5)*log(y(3))+params(6)*(x(it_, 6)+x(it_, 2));
residual(5)= lhs-rhs;
lhs =y(17);
rhs =(1-params(4))*y(4)+y(18);
residual(6)= lhs-rhs;
lhs =params(11)*y(16)^((-1)/params(10));
rhs =y(31);
residual(7)= lhs-rhs;
lhs =y(31)*(1+params(7)*(y(18)/y(4)-params(4)));
rhs =params(2)*y(42)*(1+params(1)*params(3)*y(34)*T98+T104*T107);
residual(8)= lhs-rhs;
lhs =log(y(19));
rhs =params(5)*log(y(5))+params(6)*(x(it_, 6)+x(it_, 3));
residual(9)= lhs-rhs;
lhs =y(21);
rhs =(1-params(4))*y(6)+y(22);
residual(10)= lhs-rhs;
lhs =params(13)*y(20)^((-1)/params(12));
rhs =y(31);
residual(11)= lhs-rhs;
lhs =y(31)*(1+params(7)*(y(22)/y(6)-params(4)));
rhs =params(2)*y(42)*(1+params(1)*params(3)*y(36)*T144+T150*T153);
residual(12)= lhs-rhs;
lhs =log(y(23));
rhs =params(5)*log(y(7))+params(6)*(x(it_, 6)+x(it_, 4));
residual(13)= lhs-rhs;
lhs =y(25);
rhs =(1-params(4))*y(8)+y(26);
residual(14)= lhs-rhs;
lhs =params(15)*y(24)^((-1)/params(14));
rhs =y(31);
residual(15)= lhs-rhs;
lhs =y(31)*(1+params(7)*(y(26)/y(8)-params(4)));
rhs =params(2)*y(42)*(1+params(1)*params(3)*y(38)*T190+T196*T199);
residual(16)= lhs-rhs;
lhs =log(y(27));
rhs =params(5)*log(y(9))+params(6)*(x(it_, 6)+x(it_, 5));
residual(17)= lhs-rhs;
lhs =y(29);
rhs =(1-params(4))*y(10)+y(30);
residual(18)= lhs-rhs;
lhs =params(17)*y(28)^((-1)/params(16));
rhs =y(31);
residual(19)= lhs-rhs;
lhs =y(31)*(1+params(7)*(y(30)/y(10)-params(4)));
rhs =params(2)*y(42)*(1+params(1)*params(3)*y(40)*T236+T242*T245);
residual(20)= lhs-rhs;
lhs =y(30)+y(28)+y(26)+y(24)+y(22)+y(20)+y(18)+y(16)+y(14)+y(12)-params(4)*y(2)-params(4)*y(4)-params(4)*y(6)-params(4)*y(8)-params(4)*y(10);
rhs =y(11)*params(3)*T271-y(2)*T273*T275+params(3)*y(15)*T279-y(4)*T273*T283+params(3)*y(19)*T287-y(6)*T273*T291+params(3)*y(23)*T295-y(8)*T273*T299+params(3)*y(27)*T303-y(10)*T273*T307;
residual(21)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(21, 48);

  %
  % Jacobian matrix
  %

  g1(1,1)=(-(params(5)*1/y(1)));
  g1(1,11)=1/y(11);
  g1(1,43)=(-params(6));
  g1(1,48)=(-params(6));
  g1(2,2)=(-(1-params(4)));
  g1(2,13)=1;
  g1(2,14)=(-1);
  g1(3,12)=params(9)*getPowerDeriv(y(12),(-1)/params(8),1);
  g1(3,31)=(-1);
  g1(4,32)=(-(params(2)*y(42)*T51*params(3)*params(1)));
  g1(4,2)=y(31)*params(7)*(-y(14))/(y(2)*y(2));
  g1(4,13)=(-(params(2)*y(42)*(y(32)*params(3)*params(1)*getPowerDeriv(y(13),params(1)-1,1)+T61*(-y(33))/(y(13)*y(13))+T58*params(7)*((-y(33))/(y(13)*y(13))-0.5*(-y(33))/(y(13)*y(13))))));
  g1(4,14)=y(31)*params(7)*1/y(2);
  g1(4,33)=(-(params(2)*y(42)*(T61*1/y(13)+T58*params(7)*(1/y(13)-0.5*1/y(13)))));
  g1(4,31)=1+params(7)*(y(14)/y(2)-params(4));
  g1(4,42)=(-(params(2)*(1+y(32)*params(3)*params(1)*T51+T58*T61)));
  g1(5,3)=(-(params(5)*1/y(3)));
  g1(5,15)=1/y(15);
  g1(5,44)=(-params(6));
  g1(5,48)=(-params(6));
  g1(6,4)=(-(1-params(4)));
  g1(6,17)=1;
  g1(6,18)=(-1);
  g1(7,16)=params(11)*getPowerDeriv(y(16),(-1)/params(10),1);
  g1(7,31)=(-1);
  g1(8,34)=(-(params(2)*y(42)*T98*params(3)*params(1)));
  g1(8,4)=y(31)*params(7)*(-y(18))/(y(4)*y(4));
  g1(8,17)=(-(params(2)*y(42)*(params(1)*params(3)*y(34)*getPowerDeriv(y(17),params(1)-1,1)+T107*(-y(35))/(y(17)*y(17))+T104*params(7)*((-y(35))/(y(17)*y(17))-0.5*(-y(35))/(y(17)*y(17))))));
  g1(8,18)=y(31)*params(7)*1/y(4);
  g1(8,35)=(-(params(2)*y(42)*(T107*1/y(17)+T104*params(7)*(1/y(17)-0.5*1/y(17)))));
  g1(8,31)=1+params(7)*(y(18)/y(4)-params(4));
  g1(8,42)=(-(params(2)*(1+params(1)*params(3)*y(34)*T98+T104*T107)));
  g1(9,5)=(-(params(5)*1/y(5)));
  g1(9,19)=1/y(19);
  g1(9,45)=(-params(6));
  g1(9,48)=(-params(6));
  g1(10,6)=(-(1-params(4)));
  g1(10,21)=1;
  g1(10,22)=(-1);
  g1(11,20)=params(13)*getPowerDeriv(y(20),(-1)/params(12),1);
  g1(11,31)=(-1);
  g1(12,36)=(-(params(2)*y(42)*T144*params(3)*params(1)));
  g1(12,6)=y(31)*params(7)*(-y(22))/(y(6)*y(6));
  g1(12,21)=(-(params(2)*y(42)*(params(1)*params(3)*y(36)*getPowerDeriv(y(21),params(1)-1,1)+T153*(-y(37))/(y(21)*y(21))+T150*params(7)*((-y(37))/(y(21)*y(21))-0.5*(-y(37))/(y(21)*y(21))))));
  g1(12,22)=y(31)*params(7)*1/y(6);
  g1(12,37)=(-(params(2)*y(42)*(T153*1/y(21)+T150*params(7)*(1/y(21)-0.5*1/y(21)))));
  g1(12,31)=1+params(7)*(y(22)/y(6)-params(4));
  g1(12,42)=(-(params(2)*(1+params(1)*params(3)*y(36)*T144+T150*T153)));
  g1(13,7)=(-(params(5)*1/y(7)));
  g1(13,23)=1/y(23);
  g1(13,46)=(-params(6));
  g1(13,48)=(-params(6));
  g1(14,8)=(-(1-params(4)));
  g1(14,25)=1;
  g1(14,26)=(-1);
  g1(15,24)=params(15)*getPowerDeriv(y(24),(-1)/params(14),1);
  g1(15,31)=(-1);
  g1(16,38)=(-(params(2)*y(42)*T190*params(3)*params(1)));
  g1(16,8)=y(31)*params(7)*(-y(26))/(y(8)*y(8));
  g1(16,25)=(-(params(2)*y(42)*(params(1)*params(3)*y(38)*getPowerDeriv(y(25),params(1)-1,1)+T199*(-y(39))/(y(25)*y(25))+T196*params(7)*((-y(39))/(y(25)*y(25))-0.5*(-y(39))/(y(25)*y(25))))));
  g1(16,26)=y(31)*params(7)*1/y(8);
  g1(16,39)=(-(params(2)*y(42)*(T199*1/y(25)+T196*params(7)*(1/y(25)-0.5*1/y(25)))));
  g1(16,31)=1+params(7)*(y(26)/y(8)-params(4));
  g1(16,42)=(-(params(2)*(1+params(1)*params(3)*y(38)*T190+T196*T199)));
  g1(17,9)=(-(params(5)*1/y(9)));
  g1(17,27)=1/y(27);
  g1(17,47)=(-params(6));
  g1(17,48)=(-params(6));
  g1(18,10)=(-(1-params(4)));
  g1(18,29)=1;
  g1(18,30)=(-1);
  g1(19,28)=params(17)*getPowerDeriv(y(28),(-1)/params(16),1);
  g1(19,31)=(-1);
  g1(20,40)=(-(params(2)*y(42)*T236*params(3)*params(1)));
  g1(20,10)=y(31)*params(7)*(-y(30))/(y(10)*y(10));
  g1(20,29)=(-(params(2)*y(42)*(params(1)*params(3)*y(40)*getPowerDeriv(y(29),params(1)-1,1)+T245*(-y(41))/(y(29)*y(29))+T242*params(7)*((-y(41))/(y(29)*y(29))-0.5*(-y(41))/(y(29)*y(29))))));
  g1(20,30)=y(31)*params(7)*1/y(10);
  g1(20,41)=(-(params(2)*y(42)*(T245*1/y(29)+T242*params(7)*(1/y(29)-0.5*1/y(29)))));
  g1(20,31)=1+params(7)*(y(30)/y(10)-params(4));
  g1(20,42)=(-(params(2)*(1+params(1)*params(3)*y(40)*T236+T242*T245)));
  g1(21,11)=(-(params(3)*T271));
  g1(21,12)=1;
  g1(21,2)=(-params(4))-(y(11)*params(3)*getPowerDeriv(y(2),params(1),1)-(T273*T275+y(2)*T273*(-y(14))/(y(2)*y(2))*2*(y(14)/y(2)-params(4))));
  g1(21,14)=1-(-(y(2)*T273*2*(y(14)/y(2)-params(4))*1/y(2)));
  g1(21,15)=(-(params(3)*T279));
  g1(21,16)=1;
  g1(21,4)=(-params(4))-(params(3)*y(15)*getPowerDeriv(y(4),params(1),1)-(T273*T283+y(4)*T273*(-y(18))/(y(4)*y(4))*2*(y(18)/y(4)-params(4))));
  g1(21,18)=1-(-(y(4)*T273*2*(y(18)/y(4)-params(4))*1/y(4)));
  g1(21,19)=(-(params(3)*T287));
  g1(21,20)=1;
  g1(21,6)=(-params(4))-(params(3)*y(19)*getPowerDeriv(y(6),params(1),1)-(T273*T291+y(6)*T273*(-y(22))/(y(6)*y(6))*2*(y(22)/y(6)-params(4))));
  g1(21,22)=1-(-(y(6)*T273*2*(y(22)/y(6)-params(4))*1/y(6)));
  g1(21,23)=(-(params(3)*T295));
  g1(21,24)=1;
  g1(21,8)=(-params(4))-(params(3)*y(23)*getPowerDeriv(y(8),params(1),1)-(T273*T299+y(8)*T273*(-y(26))/(y(8)*y(8))*2*(y(26)/y(8)-params(4))));
  g1(21,26)=1-(-(y(8)*T273*2*(y(26)/y(8)-params(4))*1/y(8)));
  g1(21,27)=(-(params(3)*T303));
  g1(21,28)=1;
  g1(21,10)=(-params(4))-(params(3)*y(27)*getPowerDeriv(y(10),params(1),1)-(T273*T307+y(10)*T273*(-y(30))/(y(10)*y(10))*2*(y(30)/y(10)-params(4))));
  g1(21,30)=1-(-(y(10)*T273*2*(y(30)/y(10)-params(4))*1/y(10)));

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],21,2304);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],21,110592);
end
end
end
end
