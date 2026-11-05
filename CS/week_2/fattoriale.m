function f = fattoriale(n)

    if n < 0
        f = [];
    elseif n == 0
        f = 1;
    else
        f = prod(1:n);
    end
    
    fprintf('Il fattoriale di %d vale %d\n', n, f);
end