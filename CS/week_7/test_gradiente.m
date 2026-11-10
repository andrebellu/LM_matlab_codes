clear;
clc;

A = [ 6  1 -2  2  1;
    1  3  1 -2  0;
    -2  1  4 -1 -1;
    2 -2 -1  4  2;
    1  0 -1  2  3];

b = [15; 2; 3; 21; 21];

x0 = zeros(5,1);
tol = 1e-12;
kmax = 1500;

x_esatta = (1:5)';

[xg,resg,kg,storia_g] = gradiente(A,b,x0,tol,kmax);

[xc,resc,kc,storia_c] = ...
    gradiente_coniugato(A,b,x0,tol,kmax);

% xg, xc	Ultima soluzione approssimata
% resg, resc	Norma del residuo divisa per norm(b)
% kg, kc	Numero di iterazioni
% storia_g, storia_c	Residui normalizzati, incluso quello iniziale

fprintf('Gradiente: k = %d, residuo relativo = %.3e\n', ...
    kg,resg);

fprintf('Gradiente coniugato: k = %d, residuo relativo = %.3e\n', ...
    kc,resc);

% Confronto con la soluzione esatta → errore
errore_relativo_g = norm(xg-x_esatta)/norm(x_esatta);
errore_relativo_gc = norm(xc-x_esatta)/norm(x_esatta);

% Sostituzione nel sistema → residuo
residuo_relativo_g = norm(A*xg-b)/norm(b);
residuo_relativo_gc = norm(A*xc-b)/norm(b);

fprintf('Gradiente: errore relativo = %.3e, residuo ricalcolato = %.3e\n', ...
    errore_relativo_g,residuo_relativo_g);

fprintf('GC: errore relativo = %.3e, residuo ricalcolato = %.3e\n', ...
    errore_relativo_gc,residuo_relativo_gc);


figure;
semilogy(0:kg, storia_g, 'DisplayName','Gradiente');
hold on;

semilogy(0:kc, storia_c, 'DisplayName','Gradiente coniugato');

yline(tol,'k--','DisplayName','Tolleranza');
xlabel('Iterazione k');
ylabel('Residuo relativo');
legend('show');
grid on;
hold off;

figure;
semilogy(0:kc,storia_c,'o-','LineWidth',1.5);
hold on;
yline(tol,'k--','Tolleranza');
xlabel('Iterazione k');
ylabel('Residuo relativo');
title('Dettaglio del gradiente coniugato');
grid on;
hold off;

% Il gradiente riduce il residuo, ma non raggiunge la
% tolleranza 1e-12 entro il limite di iterazioni impostato.
% Il residuo relativo ricalcolato è circa 3.56e-10,
% mentre l'errore relativo è circa 2.69e-8.

% Il gradiente coniugato soddisfa la tolleranza in 5 passi:
% residuo relativo circa 8.82e-15 ed errore relativo
% circa 4.47e-15. Il comportamento è coerente con la
% terminazione in al più n passi in aritmetica esatta,
% ricordando che in macchina intervengono arrotondamenti.

% Da verificare separatamente il conteggio kg=1501
% rispetto al parametro kmax=1500.