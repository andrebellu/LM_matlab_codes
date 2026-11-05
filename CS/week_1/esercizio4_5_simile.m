clear;
clc;

f = @(x, y) x.^2 + y.^2;

v = -2:0.1:2;
[X, Y] = meshgrid(v);

Z = f(X, Y);

figure(1);
clf;
surf(X, Y, Z);

xlabel('x');
ylabel('y');
zlabel('z');
title('z = x^2 + y^2');
colorbar;

figure(2);
clf;
contour(X, Y, Z);

xlabel('x');
ylabel('y');
title('Contour plot of z = x^2 + y^2');
colorbar;

colormap('parula');
grid on;