clear;
clc;

% Funzione e derivata
f = @(x) sin(x-1) - 0.5*sin(2*(x-1));
df = @(x) cos(x-1) - cos(2*(x-1));

tol = 1e-8;
kmax = 60;

%% Newton: radice semplice e radice tripla

[z_ns,k_ns,res_ns,ERR_ns] = ...
    newton(f,df,-1.5,tol,kmax);

[z_nm,k_nm,res_nm,ERR_nm] = ...
    newton(f,df,0.5,tol,kmax);

%% Secanti: radice semplice e radice tripla

[z_ss,k_ss,res_ss,ERR_ss] = ...
    secanti(f,-1.5,-2,tol,kmax);

[z_sm,k_sm,res_sm,ERR_sm] = ...
    secanti(f,0.5,1.1,tol,kmax);

%% Riepilogo numerico

fprintf('NEWTON — radice semplice\n');
fprintf('z = %.16f | k = %d | residuo = %.3e\n', ...
    z_ns,k_ns,res_ns);
fprintf('Errore sulla radice = %.3e\n\n', ...
    abs(z_ns-(1-pi)));

fprintf('NEWTON — radice tripla\n');
fprintf('z = %.16f | k = %d | residuo = %.3e\n', ...
    z_nm,k_nm,res_nm);
fprintf('Errore sulla radice = %.3e\n\n', ...
    abs(z_nm-1));

fprintf('SECANTI — radice semplice\n');
fprintf('z = %.16f | k = %d | residuo = %.3e\n', ...
    z_ss,k_ss,res_ss);
fprintf('Errore sulla radice = %.3e\n\n', ...
    abs(z_ss-(1-pi)));

fprintf('SECANTI — radice tripla\n');
fprintf('z = %.16f | k = %d | residuo = %.3e\n', ...
    z_sm,k_sm,res_sm);
fprintf('Errore sulla radice = %.3e\n', ...
    abs(z_sm-1));

%% Grafico della funzione

figure(1);
clf;

fplot(f,[-3,3],'LineWidth',1.5);
hold on;
yline(0,'k--');

plot(1-pi,0,'bo','MarkerFaceColor','b');
plot(1,0,'ro','MarkerFaceColor','r');

xlabel('x');
ylabel('f(x)');
title('Radice semplice e radice tripla');
legend('f(x)','Asse x','Semplice: 1-pi','Tripla: 1', ...
    'Location','best');

grid on;
hold off;

%% Incrementi: confronto dei metodi

figure(2);
clf;

tiledlayout(1,2,'TileSpacing','compact');

nexttile;

semilogy(1:length(ERR_ns),ERR_ns,'o-', ...
    'DisplayName','Radice semplice');
hold on;

semilogy(1:length(ERR_nm),ERR_nm,'s-', ...
    'DisplayName','Radice tripla');

xlabel('Iterazione k');
ylabel('|x_{k+1} - x_k|');
title('Newton');
legend('Location','best');
grid on;
hold off;

nexttile;

semilogy(1:length(ERR_ss),ERR_ss,'o-', ...
    'DisplayName','Radice semplice');
hold on;

semilogy(1:length(ERR_sm),ERR_sm,'s-', ...
    'DisplayName','Radice tripla');

xlabel('Iterazione k');
ylabel('|x_{k+1} - x_k|');
title('Secanti');
legend('Location','best');
grid on;
hold off;