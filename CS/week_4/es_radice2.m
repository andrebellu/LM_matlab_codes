clear;
clc;

phi1 = @(x) -0.25*x.^2 + x + 0.5;
phi2 = @(x) -x.^2 + x + 2;
phi3 = @(x) x/2 + 1./x;

x0 = 1.5;
tol = 1e-12;
kmax = 50;

[a1,k1,E1] = puntofisso(phi1,x0,tol,kmax);
[a2,k2,E2] = puntofisso(phi2,x0,tol,kmax);
[a3,k3,E3] = puntofisso(phi3,x0,tol,kmax);

fprintf('phi1: alpha = %.16f | k = %d | errore = %.3e\n', ...
    a1,k1,abs(a1-sqrt(2)));

fprintf('phi2: alpha = %.16f | k = %d | errore = %.3e\n', ...
    a2,k2,abs(a2-sqrt(2)));

fprintf('phi3: alpha = %.16f | k = %d | errore = %.3e\n', ...
    a3,k3,abs(a3-sqrt(2)));

figure(1);
clf;

semilogy(1:length(E1),E1,'o-','DisplayName','phi1');
hold on;
semilogy(1:length(E2),E2,'s-','DisplayName','phi2');
semilogy(1:length(E3),E3,'d-','DisplayName','phi3');

xlabel('Iterazione k');
ylabel('|x_{k+1} - x_k|');
title('Punto fisso: confronto delle tre formule');
legend('show');
grid on;
hold off;