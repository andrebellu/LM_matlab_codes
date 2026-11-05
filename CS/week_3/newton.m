function [z,k,res,ERR] = newton(f,df,x0,tol,kmax)
    k = 0;
    err = tol + 1;
    ERR = [];
    while err >= tol && k < kmax
        
        xnew=x0-f(x0)/df(x0);

        err = abs(xnew-x0);
        ERR = [ERR; err];

        
        k  =  k + 1;

        x0  = xnew;
    end
    
    z = x0;
    res = f(z);
end