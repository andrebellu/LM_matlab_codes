clear;
clc;

x = linspace(0.996, 1.004, 10000);

% rappresentazione delle stessa funziona p(x)=(x−1)^6
% fattorizzato
p1 = @(x) (x-1).^6;

% sviluppato
p2 = @(x) x.^6 - 6*x.^5 + 15*x.^4 ...
    - 20*x.^3 + 15*x.^2 - 6*x + 1;

% forma di Horner: evita di calcolare tutte le potenze con moltiplicazioni
% e somme
p3 = @(x) 1 + x.*(-6 + x.*(15 + x.*(-20 ...
    + x.*(15 + x.*(-6 + x)))));

% in matematica p1=p2=p3, non per il computer

yp1 = p1(x);
yp2 = p2(x);
yp3 = p3(x);

figure(1);
clf;

plot(x, yp3, x, yp2, x, yp1);

legend('p3: Horner', 'p2: sviluppata', 'p1: fattorizzata');
xlabel('x');
ylabel('p(x)');
title('Stesso polinomio, diverse formule di valutazione');
grid on;