clear;
clc;

f = @(x) cos(x);
g = @(x) (cos(x)).^2;

x = linspace(-2*pi, 2*pi, 500);
y = f(x);
yg = g(x);

figure(1);
clf;

figure(1);
clf;

plot(x, y, 'DisplayName', 'f(x) = cos(x)');
legend('show');

hold on;
plot(x, yg, 'r--', 'DisplayName', 'g(x) = (cos(x))^2');
hold off;

xlabel('x');
ylabel('y');
grid on;
title('Confronto tra f(x) e g(x)');