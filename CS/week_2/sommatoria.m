function s = sommatoria(n)

    s = 0;
    
    for k = n:-1:1
        s = s + 1/k;
    end
    
    fprintf('La somma vale %8.6f\n', s);
end