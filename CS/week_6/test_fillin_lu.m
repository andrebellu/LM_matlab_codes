clear;
clc;

addpath('../week_5');

%% Matrice dell'esercizio
n = 10;

A = zeros(n);
A(1,:) = 1;
A(:,1) = 1;

for i = 2:n
    A(i,i) = i;
end

b = (1:n)';

%% LU senza pivoting
[L,U] = fattorizzazione_lu(A,0);

y = forsub(L,b);
x = backsub(U,y);

% Struttura dei fattori
% Unisco le posizioni non nulle di L e U.
% La diagonale comune viene contata una volta sola.
S = (L ~= 0) | (U ~= 0);

figure(1);
clf;

subplot(1,2,1);
spy(A);
title('A: prima della fattorizzazione');

subplot(1,2,2);
spy(S);
title('Struttura complessiva di L e U');

% Controlli
fprintf('Elementi non nulli iniziali: %d\n',nnz(A));
fprintf('Posizioni non nulle nei fattori: %d\n',nnz(S));

nuovi = S & (A == 0);
fprintf('Nuove posizioni non nulle: %d\n',nnz(nuovi));

fprintf('Scarto della fattorizzazione: %.3e\n', ...
    norm(A-L*U,'fro'));

fprintf('Residuo del sistema: %.3e\n',norm(A*x-b));


%% Riordinamento di righe e colonne
q = colperm(A);

Ap = A(q,q);
bp = b(q);

% Fattorizzazione del sistema riordinato
[Lp,Up] = fattorizzazione_lu(Ap,0);

yp = forsub(Lp,bp);
xp = backsub(Up,yp);

% Torno all'ordine originale delle incognite
x_riordinato = zeros(n,1);
x_riordinato(q) = xp;

% Struttura dei fattori riordinati
Sp = (Lp ~= 0) | (Up ~= 0);

figure(2);
clf;

subplot(1,2,1);
spy(Ap);
title('Matrice riordinata');

subplot(1,2,2);
spy(Sp);
title('Fattori dopo il riordinamento');

% Confronti
fprintf('\nDOPO IL RIORDINAMENTO\n');

fprintf('Posizioni non nulle nei fattori: %d\n',nnz(Sp));

nuovi_p = Sp & (Ap == 0);
fprintf('Nuove posizioni non nulle: %d\n',nnz(nuovi_p));

fprintf('Residuo nel sistema originale: %.3e\n', ...
    norm(A*x_riordinato-b));

fprintf('Differenza tra le soluzioni: %.3e\n', ...
    norm(x-x_riordinato));