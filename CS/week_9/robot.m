clc;
clear;

x = [2.00 4.25 5.25 7.81 9.20 10.60];
y = [7.2, 7.1, 6.0, 5.0, 3.5, 5.0];

deg = length(x) - 1;

list = ["Vandermonde" "Polyfit"];
[choice,tf] = listdlg(ListString=list);

if ~tf, return; end

if choice == 1
    disp("Vandermonde mode");

    A = vander(x);

    a = A \ y.';
else
    disp("Polyfit mode");

    a = polyfit(x, y, deg);
end

x1 = linspace(x(1), x(length(x)), 100);
y1p = polyval(a, x1);
y1i = interp1(x, y, x1);
y1s = spline(x, y, x1);

figure(1);
clf;

scatter(x, y, 'filled');

hold on;
grid on;

plot(x1, y1p);
plot(x1, y1i);
plot(x1, y1s);

legend("starting values", "polyval", "composite linear", "spline");
