clear;
clc;

f = @(x) x.^2 .* cos(x);

fplot(f, [-pi, pi]);

xlabel('x')
ylabel('y')
grid on
title('disegno di f(x)')
legend('f(x) = x^2 cos(x)')   