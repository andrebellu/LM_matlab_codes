clear;
clc;

% Funzione e derivata
f  = @(x) x.^2 - 2;
df = @(x) 2*x;

% Parametri
x0 = 1.5;
tol = 1e-8;
kmax = 100;

% Chiamata al metodo
[z,k,res, ERR] = newton(f, df, x0, tol, kmax);

% Risultati
fprintf('Approssimazione:       %.16f\n', z);
fprintf('Iterazioni:           %d\n', k);
fprintf('Residuo f(z):          %.16e\n', res);
fprintf('Errore sulla radice:   %.16e\n', abs(z-sqrt(2)));

disp('Incrementi successivi:');
disp(ERR);