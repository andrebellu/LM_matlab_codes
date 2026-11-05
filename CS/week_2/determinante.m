load matriceB.mat

v = eig(B);

d = 1;

for i = 1:length(v)
    d = d * v(i);

    fprintf('prodotto dei primi %d autovalori = %22.16e\n', i, d);
end

fprintf('Determinante con det(B) = %.16e\n', det(B));

L = sum(log10(abs(v)));

fprintf('Log10 del modulo del prodotto = %.16f\n', L);

%Il prodotto degli autovalori e det(B) restituiscono zero per i 
% limiti della rappresentazione numerica. 
% La somma dei logaritmi permette invece di descrivere la grandezza del prodotto 
% senza calcolarlo direttamente. 
% Uno zero numerico del determinante non dimostra la singolarità della matrice.