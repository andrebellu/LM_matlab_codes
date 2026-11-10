addpath('../week_5');
addpath('../week_6');

% fattorizzazione lu di matlab
A=[10 4 3 -2;
    2 20 20 -1;
    3 -6 4 3;
    -3 0 3 1];
b=[5;24;13;-2];

% fattorizzo A
[L,U,P]=lu(A); 
% risolvo il sist triangolare inferiore
y=L\(P*b);
x=U\y

% fattorizzo e risolvo con le nostre function
[L1,U1,P1]=fattorizzazione_lu(A,1);
y1=forsub(L1,P1*b);
x1=backsub(U1,y1)