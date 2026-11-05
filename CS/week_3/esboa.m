clear;
clc;

% Parametri e funzione
R = 0.055;
rhob = 0.6;

f = @(x) x.^3 - 3*R*x.^2 + 4*R^3*rhob;

% Grafico
figure(1);
clf;

fplot(f, [0, 2*R]);
hold on;
plot([0, 2*R], [0, 0], 'r--');
grid on;
xlabel('x');
ylabel('f(x)');
title('Ricerca dello zero');

% Bisezione
a = 0;
b = 2*R;
tol = 1e-12;
kmax = 50;

[z_bis,k_bis,res_bis] = bisezione(f,a,b,tol,kmax);

fprintf('Bisezione\n');
fprintf('Radice: %.16f\n', z_bis);
fprintf('Dimezzamenti: %d\n', k_bis);
fprintf('Residuo: %.16e\n', res_bis);

plot(z_bis,res_bis,'ko','MarkerFaceColor','k');
hold off;

% Newton
df = @(x) 3*x.^2 - 6*R*x;

x0 = 0.01;
tol = 1e-8;
kmax = 30;

[z_new,k_new,res_new,ERR_new] = newton(f,df,x0,tol,kmax);

fprintf('\nNewton con x0 = %.3f\n', x0);
fprintf('Radice: %.16f\n', z_new);
fprintf('Iterazioni: %d\n', k_new);
fprintf('Residuo: %.16e\n', res_new);
fprintf('Differenza dalla bisezione: %.16e\n', abs(z_new-z_bis));

disp('Incrementi:');
disp(ERR_new);

% Secante
x0 = 0.01;
x1 = 0.02;
tol = 1e-8;
kmax = 30;

[z_sec,k_sec,res_sec] = secanti(f,x0,x1,tol,kmax);

fprintf('\nSecante con x0 = %.3f e x1 = %.3f\n', x0, x1);
fprintf('Radice: %.16f\n', z_sec);
fprintf('Iterazioni: %d\n', k_sec);
fprintf('Residuo: %.16e\n', res_sec);
fprintf('Differenza dalla bisezione: %.16e\n', abs(z_sec-z_bis));

%% Confronto grafico finale

% Colori
colBis = [0.10 0.35 0.75];
colNew = [0.85 0.25 0.15];
colSec = [0.10 0.60 0.35];

fig = figure(2);
clf(fig);
set(fig, 'Color', 'w', 'Position', [100 100 1250 520]);

tiledlayout(1, 2, 'TileSpacing', 'compact', 'Padding', 'compact');

%% Pannello 1: vista generale
nexttile;
hold on;

% Intervallo abbastanza ampio da includere tutti i risultati
xmin = min([a, z_bis, z_new, z_sec]) - 0.01;
xmax = max([b, z_bis, z_new, z_sec]) + 0.015;

xx = linspace(xmin, xmax, 1500);
yy = f(xx);

% Margini verticali
margine = 0.12 * (max(yy) - min(yy));
limY = [min(yy)-margine, max(yy)+margine];

% Evidenzio l'intervallo assegnato
patch([a b b a], ...
      [limY(1) limY(1) limY(2) limY(2)], ...
      [0.88 0.93 1.00], ...
      'EdgeColor', 'none', ...
      'FaceAlpha', 0.65, ...
      'HandleVisibility', 'off');

plot(xx, yy, 'Color', [0.20 0.20 0.25], ...
    'LineWidth', 1.8, ...
    'DisplayName', 'f(x)');

yline(0, '--', 'Color', [0.45 0.45 0.45], ...
    'HandleVisibility', 'off');

xline(a, ':', 'Color', colBis, 'HandleVisibility', 'off');
xline(b, ':', 'Color', colBis, 'HandleVisibility', 'off');

% Radici approssimate
plot(z_bis, 0, 'o', ...
    'Color', colBis, 'MarkerFaceColor', colBis, ...
    'MarkerSize', 11, 'LineWidth', 1.5, ...
    'DisplayName', sprintf('Bisezione: %d passi', k_bis));

plot(z_sec, 0, 's', ...
    'Color', colSec, 'MarkerFaceColor', 'none', ...
    'MarkerSize', 16, 'LineWidth', 2, ...
    'DisplayName', sprintf('Secanti: %d passi', k_sec));

plot(z_new, 0, 'd', ...
    'Color', colNew, 'MarkerFaceColor', colNew, ...
    'MarkerSize', 10, 'LineWidth', 1.5, ...
    'DisplayName', sprintf('Newton: %d passi', k_new));

text((a+b)/2, limY(2)-0.05*diff(limY), ...
    'Intervallo assegnato', ...
    'HorizontalAlignment', 'center', ...
    'Color', colBis, 'FontSize', 10);

xlim([xmin xmax]);
ylim(limY);
xlabel('x');
ylabel('f(x)');
title('Confronto dei tre metodi');
legend('Location', 'southwest');
grid on;
box on;
set(gca, 'FontSize', 11, 'Layer', 'top');
hold off;

%% Pannello 2: dettaglio nell'intervallo assegnato
nexttile;
hold on;

xx = linspace(a, b, 1000);

plot(xx, f(xx), ...
    'Color', [0.20 0.20 0.25], ...
    'LineWidth', 1.8, ...
    'HandleVisibility', 'off');

yline(0, '--', 'Color', [0.45 0.45 0.45], ...
    'HandleVisibility', 'off');

plot(z_bis, 0, 'o', ...
    'Color', colBis, 'MarkerFaceColor', colBis, ...
    'MarkerSize', 11, 'LineWidth', 1.5, ...
    'DisplayName', 'Bisezione');

plot(z_sec, 0, 's', ...
    'Color', colSec, 'MarkerFaceColor', 'none', ...
    'MarkerSize', 16, 'LineWidth', 2, ...
    'DisplayName', 'Secanti');

% Riepilogo dei risultati
riepilogo = sprintf([ ...
    'Bisezione: %.12f\n' ...
    'Secanti:   %.12f\n' ...
    'Differenza: %.3e\n\n' ...
    'Newton: %.12f\n' ...
    '(fuori dall''intervallo)'], ...
    z_bis, z_sec, abs(z_sec-z_bis), z_new);

text(0.05, 0.95, riepilogo, ...
    'Units', 'normalized', ...
    'VerticalAlignment', 'top', ...
    'FontName', 'Consolas', ...
    'FontSize', 10, ...
    'BackgroundColor', 'w', ...
    'EdgeColor', [0.80 0.80 0.80], ...
    'Margin', 8);

xlim([a b]);
xlabel('x');
ylabel('f(x)');
title('Dettaglio: bisezione e secanti coincidono graficamente');
legend('Location', 'southwest');
grid on;
box on;
set(gca, 'FontSize', 11);
hold off;

sgtitle('Equazione della boa — confronto delle radici trovate', ...
    'FontSize', 16, 'FontWeight', 'bold');