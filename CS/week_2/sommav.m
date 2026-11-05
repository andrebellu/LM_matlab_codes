function c = sommav(a,b)
    % Somma due vettori colonna della stessa lunghezza
    
    n = length(a);
    c = zeros(n,1);
    
    for i = 1:n
        c(i) = a(i) + b(i);
    end
end