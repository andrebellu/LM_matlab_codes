clc;
clear;

x = -55:10:65;
y = [3.7 3.7 3.52 3.27 3.2 3.15 3.15 3.25 3.47 3.52 3.65 3.62 3.52];

np = length(x);
deg = np - 1;

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
xlat = [42, 59];

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

ylat_poly   = polyval(a, xlat);
ylat_linear = interp1(x, y, xlat);
ylat_spline = spline(x, y, xlat);
plot(xlat, ylat_poly,   'sw', 'MarkerSize', 8, 'LineWidth', 1.5); % quadrati bianchi
plot(xlat, ylat_linear, 'hm', 'MarkerSize', 8, 'LineWidth', 1.5); % esagoni magenta
plot(xlat, ylat_spline, '+c', 'MarkerSize', 8, 'LineWidth', 1.5); % croci ciano

fprintf('Roma (42°):  Lagrange = %.4f | Lineare = %.4f | Spline = %.4f\n', ...
    ylat_poly(1), ylat_linear(1), ylat_spline(1));
fprintf('Oslo (59°):  Lagrange = %.4f | Lineare = %.4f | Spline = %.4f\n', ...
    ylat_poly(2), ylat_linear(2), ylat_spline(2));