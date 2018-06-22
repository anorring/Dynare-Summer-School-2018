function y = jermann98_set_auxiliary_variables(y, x, params)
%
% Status : Computes static model for Dynare
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

y(12)=y(11)*params(10)/params(6)/y(11);
