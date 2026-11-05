function C = prodotto_matrici(A,B)

    [na,ma] = size(A);
    [nb,mb] = size(B);
    
    if ma == nb
        C = zeros(na,mb);
    
        for i = 1:na
            for j = 1:mb
                for k = 1:ma
                    C(i,j) = C(i,j) + A(i,k)*B(k,j);
                end
            end
        end
    
    else
        disp('Matrici non compatibili per il prodotto');
        C = [];
    end
end