@#define n = 5

@#for j in 1:n
var a@{j} c@{j} k@{j} i@{j};
@#endfor

var lambda;

@#for j in 1:n
varexo e@{j};
@#endfor

varexo e;

parameters alpha beta A delta rho sigma phi;

@#for j in 1:n
parameters gamma@{j} tau@{j};
@#endfor

beta = 0.99;
alpha = 0.36;
A = (1-beta)/(alpha*beta);
delta = 0.025;
rho = 0.95;
sigma = 0.01;
phi = 0.5;

@#for j in 1:n
gamma@{j} = (@{j} + 0.25*@{n-j})/@{n};
tau@{j} = A^(1/gamma@{j});
@#endfor

model;

@#for j in 1:n
log(a@{j}) = rho*log(a@{j}(-1)) + sigma*(e@{j} + e);
k@{j} = (1-delta)*k@{j}(-1) + i@{j};
tau@{j}*c@{j}^(-1/gamma@{j}) = lambda;
lambda*(1+phi*(i@{j}/k@{j}(-1)-delta)) = beta*(lambda(+1)*(1+a@{j}(+1)*A*alpha*k@{j}^(alpha-1)+phi*(1-delta + i@{j}(+1)/k@{j} - 0.5*(i@{j}(+1)/k@{j}-delta))*(i@{j}(+1)/k@{j}-delta)));
@#endfor


@#for j in 1:n
+c@{j}+i@{j}-delta*k@{j}(-1)
@#endfor
 =
@#for j in 1:n
+a@{j}*A*k@{j}(-1)^alpha - phi/2*k@{j}(-1)*(i@{j}/k@{j}(-1)-delta)^2
@#endfor
;
end;

initval;
@#for j in 1:n
k@{j} = 1;
c@{j} = A;
a@{j} = 1;
i@{j} = delta;
@#endfor
lambda = 1;
end;

shocks;
var e; stderr 1;
@#for j in 1:n
var e@{j}; stderr 1;
@#endfor
end;

steady;

check;

stoch_simul(order=1,nograph);