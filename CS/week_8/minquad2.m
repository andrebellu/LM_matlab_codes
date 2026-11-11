clear;
clc;

x = (10000:10000:50000)';
y = [0.31; 0.95; 2.45; 4.10; 6.46];

% Modello di grado 2
X = [x.^2, x, ones(length(x),1)];

% Minimi quadrati tramite QR
[Q,R] = qr(X,"econ");
a = R\(Q'*y);

disp('Coefficienti: a2, a1, a0');
disp(a);

% Confronto modello-dati
y_modello = polyval(a,x);
scarto_relativo = norm(y_modello-y)/norm(y);

% Previsione richiesta
xnew = 55218;
ynew = polyval(a,xnew);

fprintf('Scarto relativo: %.3e\n',scarto_relativo);
fprintf('Tempo previsto per n=%d: %.6f s\n',xnew,ynew);

% Stesso problema risolto con polyfit
a_polyfit = polyfit(x,y,2);

fprintf('Differenza tra le previsioni QR e polyfit: %.3e\n', ...
    norm(polyval(a,x)-polyval(a_polyfit,x)));