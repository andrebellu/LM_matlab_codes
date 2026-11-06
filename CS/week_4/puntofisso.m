function [alpha,k,ERR] = puntofisso(phi,x0,tol,kmax)
    k = 0;
    err = tol+1;
    ERR = [];
    
    while k < kmax && err >= tol
        xnew = phi(x0);
    
        err = abs(xnew-x0);
        ERR = [ERR; err];
    
        k = k+1;
        x0 = xnew;
    end
    
    alpha = x0;
end