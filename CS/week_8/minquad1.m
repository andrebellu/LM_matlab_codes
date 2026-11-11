clear;
clc;

x = [0; 0.04; 0.06; 0.1; 0.14; 0.25; 0.31];
y = [0; 0.03; 0.08; 0.08; 0.14; 0.2; 0.23];

X = [x, ones(length(x),1)];

[Q,R] = qr(X,"econ");
a = R\(Q'*y);

disp('Pendenza e intercetta:');
disp(a);

% Valori del modello negli stessi punti dei dati
y_modello = polyval(a, x);

% Scarto relativo modello-dati
scarto_relativo = norm(y_modello-y)/norm(y);

% Deformazione stimata per sforzo 0.2
xnew = 0.2;
ynew = polyval(a,xnew);

fprintf('Scarto relativo: %.3e\n',scarto_relativo);
fprintf('Valore stimato in 0.2: %.6f\n',ynew);