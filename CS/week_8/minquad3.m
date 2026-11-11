clear;
clc;

load monossido.mat

x = t(:);
y = y(:);
n = length(x);

xplot = linspace(min(x),max(x),1000)';

figure;
scatter(x,y,'filled','DisplayName','Dati');
hold on;
grid on;

for m = 4:12

    % Matrice del modello di grado m
    X = ones(n,1);

    for j = 1:m
        X = [x.^j, X];
    end

    % Coefficienti ai minimi quadrati
    [Q,R] = qr(X,"econ");
    a = R\(Q'*y);

    % Valutazione negli stessi punti dei dati
    y_modello = polyval(a,x);
    err = norm(y_modello-y)/norm(y);

    fprintf('Grado %2d: scarto relativo = %.6e\n',m,err);

    % Mostro solo tre gradi per non affollare la figura
    if ismember(m,[4 8 12])
        plot(xplot,polyval(a,xplot), ...
            'LineWidth',1.5, ...
            'DisplayName',sprintf('Grado %d',m));
    end
end

xlabel('Ora del giorno');
ylabel('Concentrazione di NO');
legend('Location','best');