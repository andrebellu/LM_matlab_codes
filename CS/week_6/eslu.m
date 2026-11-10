
addpath('../week_5');

% eslu
A=[1 4 3 -2;
    2 20 20 -1;
    3 -6 4 3;
    -3 0 3 1];
b=[5;24;13;-2];

% fattorizzazione senza pivotazione
[L,U]=fattorizzazione_lu(A,0);
y=forsub(L,b);
x=backsub(U,y)

%% fattorizzazione con pivotazione per righe
[L,U,P]=fattorizzazione_lu(A,1);
y=forsub(L,P*b);
x=backsub(U,y)