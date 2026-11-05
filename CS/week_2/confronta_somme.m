function [s_avanti, s_indietro] = confronta_somme(n)
    s_avanti = 0;

    for k = 1:n
        s_avanti = s_avanti + 1/k;
    end

    s_indietro = 0;
    
    for k = n:-1:1
        s_indietro = s_indietro + 1/k;
    end

end
