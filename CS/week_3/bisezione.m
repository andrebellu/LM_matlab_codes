function [z,k,res] = bisezione(f,a,b,tol,kmax)
    
    c = (a+b)/2;
    err = (b-a)/2;

    k=0;

    while err >= tol && k < kmax
        if f(c) == 0
            break;
        end

        if f(a)*f(c) < 0
            b = c;
        else
            a = c;
        end

        c = (a+b)/2;
        err = (b-a)/2;
        k = k + 1;
    end
    z = c;
    res = f(z);
end