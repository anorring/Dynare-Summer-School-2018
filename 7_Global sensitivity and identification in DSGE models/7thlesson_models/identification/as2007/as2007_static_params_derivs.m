function [rp, gp, rpp, gpp, hp] = as2007_static_params_derivs(y, x, params)
%
% Status : Computes derivatives of the static model with respect to the parameters
%
% Inputs : 
%   y         [M_.endo_nbr by 1] double    vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1] double     vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1] double   vector of parameter values in declaration order
%
% Outputs:
%   rp        [M_.eq_nbr by #params] double    Jacobian matrix of static model equations with respect to parameters 
%                                              Dynare may prepend or append auxiliary equations, see M_.aux_vars
%   gp        [M_.endo_nbr by M_.endo_nbr by #params] double    Derivative of the Jacobian matrix of the static model equations with respect to the parameters
%                                                           rows: variables in declaration order
%                                                           rows: equations in order of declaration
%   rpp       [#second_order_residual_terms by 4] double   Hessian matrix of second derivatives of residuals with respect to parameters;
%                                                              rows: respective derivative term
%                                                              1st column: equation number of the term appearing
%                                                              2nd column: number of the first parameter in derivative
%                                                              3rd column: number of the second parameter in derivative
%                                                              4th column: value of the Hessian term
%   gpp      [#second_order_Jacobian_terms by 5] double   Hessian matrix of second derivatives of the Jacobian with respect to the parameters;
%                                                              rows: respective derivative term
%                                                              1st column: equation number of the term appearing
%                                                              2nd column: column number of variable in Jacobian of the static model
%                                                              3rd column: number of the first parameter in derivative
%                                                              4th column: number of the second parameter in derivative
%                                                              5th column: value of the Hessian term
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

T98 = (params(1)+params(1))/(params(1)*params(1)*params(1)*params(1));
T120 = (1+params(8)/400)*(1+params(8)/400);
T121 = (-0.0025)/T120;
T129 = (-((-0.0025)*((1+params(8)/400)*0.0025+(1+params(8)/400)*0.0025)))/(T120*T120);
rp = zeros(8, 13);
rp(1, 1) = (y(3)-y(1)-y(5))*(-1)/(params(1)*params(1));
rp(2, 2) = (-(y(2)-y(4)));
rp(2, 8) = (-(y(1)*T121));
rp(3, 3) = (-(y(1)*(1-params(5))));
rp(3, 4) = (-((y(2)-y(4))*(1-params(5))));
rp(3, 5) = (-(y(3)+y(1)*(-params(3))+(y(2)-y(4))*(-params(4))));
rp(3, 11) = (-x(1));
rp(4, 6) = (-y(4));
rp(4, 12) = (-x(2));
rp(5, 7) = (-y(5));
rp(5, 13) = (-x(3));
rp(6, 10) = (-1);
rp(7, 9) = (-1);
rp(8, 8) = (-1);
rp(8, 9) = (-1);
rp(8, 10) = (-4);
gp = zeros(8, 8, 13);
gp(1, 1, 1) = (-((-1)/(params(1)*params(1))));
gp(1, 3, 1) = (-1)/(params(1)*params(1));
gp(1, 5, 1) = (-((-1)/(params(1)*params(1))));
gp(2, 1, 8) = (-T121);
gp(2, 2, 2) = (-1);
gp(2, 4, 2) = 1;
gp(3, 1, 3) = (-(1-params(5)));
gp(3, 1, 5) = params(3);
gp(3, 2, 4) = (-(1-params(5)));
gp(3, 2, 5) = params(4);
gp(3, 3, 5) = (-1);
gp(3, 4, 4) = 1-params(5);
gp(3, 4, 5) = (-params(4));
gp(4, 4, 6) = (-1);
gp(5, 5, 7) = (-1);
if nargout >= 3
rpp = zeros(4,4);
rpp(1,1)=1;
rpp(1,2)=1;
rpp(1,3)=1;
rpp(1,4)=(y(3)-y(1)-y(5))*T98;
rpp(2,1)=2;
rpp(2,2)=8;
rpp(2,3)=8;
rpp(2,4)=(-(y(1)*T129));
rpp(3,1)=3;
rpp(3,2)=3;
rpp(3,3)=5;
rpp(3,4)=y(1);
rpp(4,1)=3;
rpp(4,2)=4;
rpp(4,3)=5;
rpp(4,4)=y(2)-y(4);
gpp = zeros(7,5);
gpp(1,1)=1;
gpp(1,2)=1;
gpp(1,3)=1;
gpp(1,4)=1;
gpp(1,5)=(-T98);
gpp(2,1)=1;
gpp(2,2)=3;
gpp(2,3)=1;
gpp(2,4)=1;
gpp(2,5)=T98;
gpp(3,1)=1;
gpp(3,2)=5;
gpp(3,3)=1;
gpp(3,4)=1;
gpp(3,5)=(-T98);
gpp(4,1)=2;
gpp(4,2)=1;
gpp(4,3)=8;
gpp(4,4)=8;
gpp(4,5)=(-T129);
gpp(5,1)=3;
gpp(5,2)=1;
gpp(5,3)=3;
gpp(5,4)=5;
gpp(5,5)=1;
gpp(6,1)=3;
gpp(6,2)=2;
gpp(6,3)=4;
gpp(6,4)=5;
gpp(6,5)=1;
gpp(7,1)=3;
gpp(7,2)=4;
gpp(7,3)=4;
gpp(7,4)=5;
gpp(7,5)=(-1);
end
if nargout >= 5
hp = zeros(0,5);
end
end
