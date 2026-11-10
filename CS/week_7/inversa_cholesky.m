function B = inversa_cholesky(A)
    
    if ~issymmetric(A)
        error('La matrice non è simmetrica');
    end
    
    d = eig(A);
    display(d);
    
    isposdef = all(d > 0);
    if isposdef 
        disp('La matrice è definita positiva');
    else
        error('La matrice non è definita positiva');
    end
    
    [R,flag] = chol(A); %ritorna una matrice triangolare superiore
    
    if flag ~= 0
        error('Cholesky non riuscita: controllare la positività');
    end
    
    I = eye(size(A));
    B = zeros(size(A));
    
    for k = 1:size(A, 1)
        ek = I(:,k);
        y = R'\ek;
        B(:,k) = R\y;
    end

end