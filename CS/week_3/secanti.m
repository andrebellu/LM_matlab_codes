function [z,k,res,ERR] = secanti(f,x0,x1,tol,kmax)
    
    k = 0;
    err = tol + 1;
    ERR = [];
    while k< kmax && err>=tol
        r = (f(x1)-f(x0))/(x1-x0);
        xnew = x1 - f(x1)/r;
        
        err = abs(xnew-x1);
        ERR = [ERR; err];
        
        k = k + 1;

        x0 = x1;
        x1 = xnew;
    end

    z = x1;
    res = f(z);

end