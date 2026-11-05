clear; close all; clc;

% Parametri scelti per l'esperimento
r = 1;
K = 10;
tspan = [0 15];

% Legge dinamica: restituisce dx/dt, NON x(t)
f = @(t, x) r*x*(1 - x/K);

% Proviamo diverse quantita iniziali
condizioni_iniziali = [0, 0.1, 2, 8, 10, 15];

figure;
hold on;
grid on;

for x0 = condizioni_iniziali
    [t, x] = ode45(f, tspan, x0);

    plot(t, x, 'LineWidth', 1.5, ...
        'DisplayName', sprintf('x(0) = %g', x0));
end

xlabel('Tempo t');
ylabel('Risorsa x_1(t)');
title('Modello logistico: diverse condizioni iniziali');
legend('Location', 'best');
ylim([-0.5 16]);

x_grid = linspace(0, 16, 400);
dx_grid = r*x_grid.*(1 - x_grid/K);

figure;
plot(x_grid, dx_grid, 'LineWidth', 2);
hold on;
grid on;

plot([0 16], [0 0], 'k--');
plot([0 K], [0 0], 'ro', 'MarkerFaceColor', 'r');

xlabel('Stato x_1');
ylabel('Derivata dx_1/dt');
title('Legge dinamica: dove la risorsa cresce o diminuisce');

alpha_values = [0, 0.4, 1, 1.5];
x0 = 5;
tspan_sfruttamento = [0 30];

figure;
hold on;
grid on;

for alpha = alpha_values
    f_sfruttamento = @(t, x) r*x*(1 - x/K) - alpha*x;

    [t, x] = ode45(f_sfruttamento, tspan_sfruttamento, x0);

    plot(t, x, 'LineWidth', 1.5, ...
        'DisplayName', sprintf('alpha = %g', alpha));
end

xlabel('Tempo t');
ylabel('Risorsa x_1(t)');
title('Effetto dello sfruttamento, con r = 1');
legend('Location', 'best');