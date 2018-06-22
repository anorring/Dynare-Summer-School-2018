function c = f_c(c0,pie,omega,bet,epsilon,phi,gamma); 
    
    f = @(x) omega*pie*(pie-1)-bet*omega*pie*...
      (pie-1)-epsilon*(x+(omega/2)*(pie-1)^2)*(x*phi*(x+(omega/2)*(pie-1)^2)^gamma-(epsilon-1)/epsilon);
    
    c = fzero(f,c0);