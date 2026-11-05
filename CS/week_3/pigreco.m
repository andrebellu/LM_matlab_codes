function pigreco(N)
    % Input previsto: N intero, almeno 2

    f = zeros(N,1);
    f(2) = 2;

    for n = 2:N-1
        f(n+1) = 2^(n-0.5) ...
            * sqrt(1-sqrt(1-4^(1-n)*f(n)^2));
    end

    e = abs(f-pi)/pi;
    fprintf('   n          f_n                 errore relativo\n');

    for j = 14:N
        fprintf('%4d   %22.15e   %22.15e\n', j, f(j), e(j));
    end

    n = 2:N;

    % Approssimazioni
    figure(1);
    clf;

    plot(n, f(2:N), 'o');
    hold on;
    plot([2 N], [pi pi], 'r--');
    hold off;

    xlabel('n');
    ylabel('f_n');
    title('Approssimazioni di pi');
    legend('Successione', 'Riferimento pi');
    grid on;

    % Errori relativi
    figure(2);
    clf;

    semilogy(n, e(2:N), 'o');
    xlabel('n');
    ylabel('Errore relativo');
    title('Errore relativo rispetto a pi');
    grid on;
end

% Una successione pensata per approssimare un valore può 
% inizialmente migliorare e poi peggiorare quando gli 
% errori di arrotondamento diventano dominanti. 
% Aumentare il numero di iterazioni non garantisce maggiore accuratezza.