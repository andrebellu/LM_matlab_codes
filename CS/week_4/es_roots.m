clear;
clc;
format long g;

% Caso 1: radici semplici
a1 = [1 -10 35 -50 24];
z1 = roots(a1);

disp('CASO 1 — radici attese: 1, 2, 3, 4');
disp(z1);

% Caso 2: una radice doppia
a2 = [1 -3 -3 7 6];
z2 = roots(a2);

disp('CASO 2 — radici attese: -1, -1, 2, 3');
disp(z2);

% Caso 3: una radice quadrupla
a3 = [1 -4 6 -4 1];
z3 = roots(a3);

disp('CASO 3 — radice attesa: 1, molteplicità 4');
disp(z3);

% Residui del terzo polinomio nelle radici calcolate
disp('Modulo dei residui nel caso 3:');
disp(abs(polyval(a3,z3)));