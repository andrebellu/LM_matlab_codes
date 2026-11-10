clear;
clc;

A = [1e5  5  2  1;
    5 10 -4  0;
    2 -4  8 -1;
    1  0 -1  2];



%% Ragionamento
% La matrice è simmetrica perché ha gli elementi uguali rispetto alla diagonale principale (importante che sia quadrata)
% È definita positiva perché tutti i suoi autovalori sono positivi
% Di conseguenza è invertibile perché valgono le proprietà verificate sopra: significa che esiste che la matrice A ha una matrice A-1 tale che il loro prodotto dia come risultato la matrice identità
% La matrice è inoltre REALE quindi posso scegliere la fattorizzazione di Cholesky, che scrive 
% 𝐴 = R(T)R

%% Risposta Rifinita
% La matrice è reale e simmetrica, poiché a_ij = a_ji.
% Gli autovalori calcolati risultano tutti strettamente positivi, 
% quindi è definita positiva. Non avendo autovalori nulli, è invertibile. 
% Per sfruttarne la struttura scelgo la fattorizzazione di Cholesky, 
% che nella convenzione predefinita di MATLAB fornisce A = R' * R, 
% con R triangolare superiore.

%% test

B = inversa_cholesky(A);

I = eye(size(A));

B_matlab = inv(A);

%% confronti e stima errori

disp('Scarto del prodotto rispetto all''identità:');
disp(norm(A*B-I,'fro'));

disp('Differenza relativa rispetto a inv(A):');
disp(norm(B-B_matlab,'fro')/norm(B_matlab,'fro'));

K = cond(A);
u = eps/2;

stima_relativa = K*u;
stima_assoluta = stima_relativa * norm(B,2);

fprintf('Condizionamento di A: %.3e\n',K);
fprintf('Stima relativa in norma: %.3e\n',stima_relativa);
fprintf('Stima assoluta orientativa: %.3e\n',stima_assoluta);

% K*u è una stima orientativa dell'errore relativo in norma.
% Moltiplicando per norm(B,2) ottengo una stima assoluta
% in norma, utilizzabile come scala di maggiorazione
% dell'errore assoluto di ciascun elemento.
% Non è un limite rigoroso completo degli arrotondamenti.

% La matrice è reale, simmetrica e definita positiva,
% come confermato dagli autovalori calcolati, tutti positivi.
% È quindi invertibile e posso utilizzare Cholesky.

% Ho costruito l'inversa risolvendo A*c_j = e_j
% per ciascuna colonna, riutilizzando la stessa fattorizzazione.

% Lo scarto norm(A*B-I,'fro') è circa 4.60e-16.
% La differenza relativa rispetto a inv(A) è circa 2.27e-16:
% i due risultati numerici sono quindi in ottimo accordo.

% Il condizionamento in norma 2 è circa 5.66e4.
% Assumendo errori relativi dell'ordine di u = eps/2,
% la stima orientativa relativa in norma è circa 6.28e-12.
% Moltiplicando per norm(B,2), ottengo una scala di stima
% dell'errore assoluto pari a circa 3.56e-12.
% Questa non è una certificazione rigorosa dell'errore
% effettivo su ogni singolo elemento.
