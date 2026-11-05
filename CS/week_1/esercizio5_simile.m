clear;
clc;

f = @(x,y,t) cos(x.^2 + y.^2 - t);

[X,Y] = meshgrid(-2:0.1:2);
tt = linspace(0, 2*pi, 60);

Mv = struct('cdata', {}, 'colormap', {});

fig1 = figure(1);
clf;

for i = 1:length(tt)
    t = tt(i);
    Z = f(X,Y,t);

    surf(X,Y,Z);
    xlabel('x');
    ylabel('y');
    zlabel('z');

    axis([-2, 2, -2, 2, -1.5, 1.5]);
    title(['t = ', num2str(t)]);

    drawnow;
    Mv(i) = getframe(fig1);

    pause(0.01);
end

fig2 = figure(2);
clf;

fig2.Units = fig1.Units;
fig2.Position(3:4) = fig1.Position(3:4);

movie(fig2, Mv, 2, 20);