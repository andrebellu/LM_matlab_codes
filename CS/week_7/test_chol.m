clear;
clc;
format long g;

A = [ 6  1 -2  2  1;
    1  3  1 -2  0;
    -2  1  4 -1 -1;
    2 -2 -1  4  2;
    1  0 -1  2  3];

b = [15; 2; 3; 21; 21];

%% 1. Controllo separatamente la simmetria
if ~issymmetric(A)
    error('La matrice non è simmetrica');
end

%% 2. Tento la fattorizzazione
[R,flag] = chol(A);

if flag ~= 0
    error('Cholesky non riuscita: controllare la positività');
end

%% 3. Risolvo i due sistemi triangolari
y = R'\b;
x = R\y;

disp('Soluzione:');
disp(x);

%% 4. Controlli distinti
fprintf('Scarto della fattorizzazione: %.3e\n', ...
    norm(A-R'*R,'fro'));

fprintf('Residuo relativo del sistema: %.3e\n', ...
    norm(A*x-b)/norm(b));

%% 5. Riferimento noto di questo esercizio
x_esatta = (1:5)';

fprintf('Errore relativo sulla soluzione: %.3e\n', ...
    norm(x-x_esatta)/norm(x_esatta));