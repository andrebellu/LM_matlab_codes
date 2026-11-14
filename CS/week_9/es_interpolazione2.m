clc;
clear;

f = @(x) (x+2)/7 .* cos(x);
xa = 0; xb = 6;

x1 = linspace(xa, xb, 200);
yf1 = f(x1);
ERR = [];

for n = 1:10
    x = linspace(xa, xb, n+1);
    y = f(x);

    a = polyfit(x, y, n);
    y1 = polyval(a, x1);

    figure(1); clf; hold on;

    plot(x1, yf1, 'LineWidth', 1.5, 'DisplayName', 'f(x)');
    plot(x1, y1, '--', 'LineWidth', 1.5, 'DisplayName', 'p_n(x)');
    scatter(x, y, 'filled', 'DisplayName', 'nodi');
    legend;
    title(['n = ', num2str(n)]);
    
    pause(0.3);

    err = max(abs(yf1 - y1));
    ERR = [ERR; err];

    fprintf("Errore iterazione %d: %e\n", n, err);
end

figure(2);
semilogy(1:10, ERR)