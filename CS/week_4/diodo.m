clear;
clc;

% Rendo disponibile Newton dalla settimana precedente
cartellaScript = fileparts(mfilename('fullpath'));
addpath(fullfile(cartellaScript, '..', 'week_3'));

% Parametri
Vin = 1;
Is = 1e-12;
Vt = 26e-3;
R = 430;

% Funzione e derivata
f = @(x) (Vin-x)/R - Is*(exp(x/Vt)-1);
df = @(x) -1/R - (Is/Vt)*exp(x/Vt);

tol = 1e-6;
kmax = 50;

% Grafico della funzione
figure(1);
clf;
fplot(f,[0.4 0.65],'LineWidth',1.5);
hold on;
yline(0,'k--');
xlabel('x');
ylabel('f(x)');
title('Equazione del diodo');
grid on;
hold off;

% Confronto delle tre partenze
partenze = [0.5 0.64 0.4];

figure(2);
clf;

for j = 1:length(partenze)
    x0 = partenze(j);

    [z,k,res,ERR] = newton(f,df,x0,tol,kmax);

    fprintf('x0 = %.2f | z = %.12f | k = %d | res = %.3e\n', ...
        x0,z,k,res);

    semilogy(1:length(ERR),ERR,'o-', ...
        'DisplayName',sprintf('x0 = %.2f',x0));

    hold on;
end

xlabel('Iterazione k');
ylabel('|x_{k+1} - x_k|');
title('Newton: confronto dei punti iniziali');
legend('show');
grid on;
hold off;