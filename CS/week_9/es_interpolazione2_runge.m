clc;
clear;

f = @(x) 1 ./ (1 + x.^2); 
xa = -5; xb = 5;

N = 2:64;

x1 = linspace(xa, xb, 200);
yf1 = f(x1);
ERR = [];

node_types = ["Equispaced" "Chebyshev"];
[node_chosen,tf_node] = listdlg(ListString=node_types);

methods = ["Polyfit" "Baricentric"];
[method_chosen,tf_method] = listdlg(ListString=methods);

if ~tf_node || ~tf_method, return; end

if node_chosen == 1
   disp("Type: Equispaced");
else
   disp("Type: Chebyshev");
end

if method_chosen == 1
    disp("Method: Polyfit")
else
    disp("Method: Baricentric")
end

for n = N

    if node_chosen == 1
        x = linspace(xa, xb, n+1);
    else
        xs = -cos(pi * (0:n) / n); % valori tra -1 e 1
        x = (xb - xa)/2 * xs + (xb + xa)/2; % mappo tra -5 e 5 assicurandomi di rimanere con lo 0 al centro
    end

    y = f(x);

    if method_chosen == 1
        a = polyfit(x, y, n);
        y1 = polyval(a, x1);
    else
        y1 = barycentric(x, y, x1);
    end

    figure(1); clf; hold on;

    plot(x1, yf1, 'LineWidth', 1.5, 'DisplayName', 'f(x)');
    plot(x1, y1, '--', 'LineWidth', 1.5, 'DisplayName', 'p_n(x)');
    scatter(x, y, 'filled', 'DisplayName', 'nodi');
    legend;
    title(['n = ', num2str(n)]);
    
    pause(0.1);

    err = max(abs(yf1 - y1));
    ERR = [ERR; err];

    fprintf("Errore iterazione %d: %e\n", n, err);
end

figure(2);
semilogy(N, ERR)

%% Conclusioni: convergenza e stabilita' (Funzione di Runge su [-5, 5])
%
% 1. Nodi equispaziati + Polyfit (Vandermonde):
%    L'errore in norma infinito diverge al crescere di n per due cause distinte:
%    - Fenomeno di Runge (instabilita' analitica): forti oscillazioni agli
%      estremi dell'intervallo dovute alla distribuzione equispaziata dei nodi.
%    - Malcondizionamento numerico: da n >= 19 la matrice di Vandermonde e'
%      quasi singolare e amplifica gli errori di arrotondamento.
%
% 2. Nodi equispaziati + Forma baricentrica:
%    L'algoritmo e' numericamente stabile (nessun warning), ma l'errore diverge
%    comunque: dimostra che Runge e' un limite matematico della scelta dei
%    nodi, non del metodo usato per valutare il polinomio.
%
% 3. Nodi di Chebyshev + Polyfit (Vandermonde):
%    L'infittimento dei nodi ai bordi elimina il fenomeno di Runge, ma per
%    gradi alti (n > ~30) il malcondizionamento di Vandermonde degrada la
%    precisione e fa risalire l'errore.
%
% 4. Nodi di Chebyshev + Forma baricentrica:
%    Unica combinazione che garantisce sia convergenza uniforme sia stabilita'
%    numerica al crescere di n (errore -> 0). L'andamento a "dente di sega" tra
%    n pari e dispari dipende dalla simmetria di f(x) = 1/(1+x^2): per n pari
%    esiste un nodo centrale che cade esattamente sul picco in x = 0.