clear;
clc;

A = [1 2 3;
    4 5 6];

B = [7  8;
    9  10;
    11 12];

C = prodotto_matrici(A,B);
C_matlab = A*B;

disp('Risultato della funzione:');
disp(C);

disp('Risultato di MATLAB:');
disp(C_matlab);