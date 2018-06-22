function [rp, gp, rpp, gpp, hp] = as2007_params_derivs(y, x, params, steady_state, it_, ss_param_deriv, ss_param_2nd_deriv)
%
% Compute the derivatives of the dynamic model with respect to the parameters
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [nperiods by M_.exo_nbr] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   steady_state  [M_.endo_nbr by 1] double       vector of steady state values
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%   ss_param_deriv     [M_.eq_nbr by #params]     Jacobian matrix of the steady states values with respect to the parameters
%   ss_param_2nd_deriv [M_.eq_nbr by #params by #params] Hessian matrix of the steady states values with respect to the parameters
%
% Outputs:
%   rp        [M_.eq_nbr by #params] double    Jacobian matrix of dynamic model equations with respect to parameters 
%                                              Dynare may prepend or append auxiliary equations, see M_.aux_vars
%   gp        [M_.endo_nbr by #dynamic variables by #params] double    Derivative of the Jacobian matrix of the dynamic model equations with respect to the parameters
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence
%   rpp       [#second_order_residual_terms by 4] double   Hessian matrix of second derivatives of residuals with respect to parameters;
%                                                              rows: respective derivative term
%                                                              1st column: equation number of the term appearing
%                                                              2nd column: number of the first parameter in derivative
%                                                              3rd column: number of the second parameter in derivative
%                                                              4th column: value of the Hessian term
%   gpp      [#second_order_Jacobian_terms by 5] double   Hessian matrix of second derivatives of the Jacobian with respect to the parameters;
%                                                              rows: respective derivative term
%                                                              1st column: equation number of the term appearing
%                                                              2nd column: column number of variable in Jacobian of the dynamic model
%                                                              3rd column: number of the first parameter in derivative
%                                                              4th column: number of the second parameter in derivative
%                                                              5th column: value of the Hessian term
%   hp      [#first_order_Hessian_terms by 5] double   Jacobian matrix of derivatives of the dynamic Hessian with respect to the parameters;
%                                                              rows: respective derivative term
%                                                              1st column: equation number of the term appearing
%                                                              2nd column: column number of first variable in Hessian of the dynamic model
%                                                              3rd column: column number of second variable in Hessian of the dynamic model
%                                                              4th column: number of the parameter in derivative
%                                                              5th column: value of the Hessian term
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

T112 = (params(1)+params(1))/(params(1)*params(1)*params(1)*params(1));
T134 = (1+params(8)/400)*(1+params(8)/400);
T135 = (-0.0025)/T134;
T143 = (-((-0.0025)*((1+params(8)/400)*0.0025+(1+params(8)/400)*0.0025)))/(T134*T134);
rp = zeros(8, 13);
rp(1, 1) = (y(7)-y(13)-y(16))*(-1)/(params(1)*params(1));
rp(2, 2) = (-(y(6)-y(8)));
rp(2, 8) = (-(y(13)*T135));
rp(3, 3) = (-(y(5)*(1-params(5))));
rp(3, 4) = (-((y(6)-y(8))*(1-params(5))));
rp(3, 5) = (-(y(2)+y(5)*(-params(3))+(y(6)-y(8))*(-params(4))));
rp(3, 11) = (-x(it_, 1));
rp(4, 6) = (-y(3));
rp(4, 12) = (-x(it_, 2));
rp(5, 7) = (-y(4));
rp(5, 13) = (-x(it_, 3));
rp(6, 10) = (-1);
rp(7, 9) = (-1);
rp(8, 8) = (-1);
rp(8, 9) = (-1);
rp(8, 10) = (-4);
gp = zeros(8, 19, 13);
gp(1, 13, 1) = (-((-1)/(params(1)*params(1))));
gp(1, 7, 1) = (-1)/(params(1)*params(1));
gp(1, 16, 1) = (-((-1)/(params(1)*params(1))));
gp(2, 13, 8) = (-T135);
gp(2, 6, 2) = (-1);
gp(2, 8, 2) = 1;
gp(3, 5, 3) = (-(1-params(5)));
gp(3, 5, 5) = params(3);
gp(3, 6, 4) = (-(1-params(5)));
gp(3, 6, 5) = params(4);
gp(3, 2, 5) = (-1);
gp(3, 8, 4) = 1-params(5);
gp(3, 8, 5) = (-params(4));
gp(3, 17, 11) = (-1);
gp(4, 3, 6) = (-1);
gp(4, 18, 12) = (-1);
gp(5, 4, 7) = (-1);
gp(5, 19, 13) = (-1);
if nargout >= 3
rpp = zeros(4,4);
rpp(1,1)=1;
rpp(1,2)=1;
rpp(1,3)=1;
rpp(1,4)=(y(7)-y(13)-y(16))*T112;
rpp(2,1)=2;
rpp(2,2)=8;
rpp(2,3)=8;
rpp(2,4)=(-(y(13)*T143));
rpp(3,1)=3;
rpp(3,2)=3;
rpp(3,3)=5;
rpp(3,4)=y(5);
rpp(4,1)=3;
rpp(4,2)=4;
rpp(4,3)=5;
rpp(4,4)=y(6)-y(8);
gpp = zeros(7,5);
gpp(1,1)=1;
gpp(1,2)=13;
gpp(1,3)=1;
gpp(1,4)=1;
gpp(1,5)=(-T112);
gpp(2,1)=1;
gpp(2,2)=7;
gpp(2,3)=1;
gpp(2,4)=1;
gpp(2,5)=T112;
gpp(3,1)=1;
gpp(3,2)=16;
gpp(3,3)=1;
gpp(3,4)=1;
gpp(3,5)=(-T112);
gpp(4,1)=2;
gpp(4,2)=13;
gpp(4,3)=8;
gpp(4,4)=8;
gpp(4,5)=(-T143);
gpp(5,1)=3;
gpp(5,2)=5;
gpp(5,3)=3;
gpp(5,4)=5;
gpp(5,5)=1;
gpp(6,1)=3;
gpp(6,2)=6;
gpp(6,3)=4;
gpp(6,4)=5;
gpp(6,5)=1;
gpp(7,1)=3;
gpp(7,2)=8;
gpp(7,3)=4;
gpp(7,4)=5;
gpp(7,5)=(-1);
end
if nargout >= 5
hp = zeros(0,5);
end
end
