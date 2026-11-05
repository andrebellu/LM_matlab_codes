clear;
clc;

f = @(x,y) x .* exp(-(x.^2 + y.^2));

v = -2:0.1:2;
[X,Y] = meshgrid(v);

Z = f(X,Y);

figure(1);
clf;
surfc(X,Y,Z); % superficie

xlabel('x');
ylabel('y');
zlabel('z');
title('z = x exp(-(x^2 + y^2))');
colorbar;
colormap('parula');
grid on;

