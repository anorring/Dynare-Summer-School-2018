function [ys,check,penlt] = dsge_base2_steadystate(ys, exe)
global M_

persistent idx NumberOfParameters NumberOfEndogenousVariables
persistent load_parameters fill_ys


if isempty(idx)
    NumberOfParameters = M_.param_nbr;
    NumberOfEndogenousVariables = M_.orig_endo_nbr;
    load_parameters = [];
    for i = 1:NumberOfParameters
        load_parameters = [ load_parameters M_.param_names{i} ' = M_.params(' int2str(i) '); '];    
    end
    fill_ys = [];
    for i = 1:NumberOfEndogenousVariables
        fill_ys = [fill_ys 'ys(' int2str(i) ') = ' M_.endo_names{i} '_ss' '; '];
    end
    idx = 1;
end


% Do not call matlab's routine!

eval(load_parameters);

ys = zeros(NumberOfEndogenousVariables,1);
check = 0;

k_ss = -(alp-1)*(alp^(1/(1-alp)))*(bet^(1/(1-alp)))*((bet*(delt-1)+1)^(alp/(alp-1)))*tet;

k_ss = k_ss/(-alp*delt*bet+delt*bet+alp*tet*bet-bet-alp*tet+1);

l_ss = (alp-1)*(bet*(delt-1)+1)*tet;

l_ss = l_ss/(alp*tet+bet*((alp-1)*delt-alp*tet+1)-1) ;

y_ss = (k_ss^alp)*(l_ss^(1-alp)) ;

i_ss = delt*k_ss ;

c_ss = y_ss - i_ss ;

A_ss = 1;


% Fill vector ys (steady state values).
eval(fill_ys);