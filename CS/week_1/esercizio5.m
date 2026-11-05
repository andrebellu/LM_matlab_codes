clear;
clc;

f = @(x,y,t) sin(sqrt(x.^2 + y.^2) - 2*t);

[X,Y] = meshgrid(-2*pi:0.5:2*pi);
tt = linspace(0, 2*pi, 50);

figure(1);
clf;

for i = 1:length(tt)
    t = tt(i);
    Z = f(X,Y,t);

    surf(X,Y,Z);
    xlabel('x');
    ylabel('y');
    zlabel('z');

    axis([-2*pi, 2*pi, -2*pi, 2*pi, -2, 2]);
    title(['t = ', num2str(t)]);

    drawnow;
    pause(0.05);
end