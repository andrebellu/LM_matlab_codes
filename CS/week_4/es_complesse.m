clear;
clc;

addpath('../week_3');

f  = @(x) x.^2 - 3*x + 4;
df = @(x) 2*x - 3;

x0 = 1 + 1i;
tol = 1e-6;
kmax = 50;

[z,k,res,ERR] = newton(f,df,x0,tol,kmax);

% Radici di riferimento
alpha_plus  = (3 + 1i*sqrt(7))/2;
alpha_minus = (3 - 1i*sqrt(7))/2;

disp('Radice trovata:');
disp(z);

fprintf('Iterazioni: %d\n', k);
fprintf('Modulo del residuo: %.3e\n', abs(res));

fprintf('Distanza dalla radice con parte immaginaria positiva: %.3e\n', ...
    abs(z-alpha_plus));

fprintf('Distanza dalla radice con parte immaginaria negativa: %.3e\n', ...
    abs(z-alpha_minus));