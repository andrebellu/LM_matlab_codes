clear;
clc;

A = [6  1  -2   2   1;
    0 -3   3  -2   1;
    2  0.5 5  -1  -2;
    0  1   2  -3   2;
    0.5 -1 1   0.4 2];

b = [15; 0; 4; 6; 13.1];

x0 = zeros(5,1);
tol = 1e-12;
kmax = 500;

%% Tre metodi, stessi dati
[xg,resg,kg,storia_g] = ...
    gradiente(A,b,x0,tol,kmax);

[xc,resc,kc,storia_c] = ...
    gradiente_coniugato(A,b,x0,tol,kmax);

[xb,resb,kb,storia_b] = ...
    bcgstab(A,b,x0,tol,kmax);

%% Riferimento numerico, non soluzione esatta
x_ref = A\b;

%% Controlli diretti sulle soluzioni
rg = norm(b-A*xg)/norm(b);
rc = norm(b-A*xc)/norm(b);
rb = norm(b-A*xb)/norm(b);

dg = norm(xg-x_ref)/norm(x_ref);
dc = norm(xc-x_ref)/norm(x_ref);
db = norm(xb-x_ref)/norm(x_ref);

fprintf('Gradiente: k=%d, residuo=%.3e, differenza=%.3e\n', ...
    kg,rg,dg);

fprintf('GC:        k=%d, residuo=%.3e, differenza=%.3e\n', ...
    kc,rc,dc);

fprintf('BiCGStab:  k=%d, residuo=%.3e, differenza=%.3e\n', ...
    kb,rb,db);

%% Storie dei residui relativi
figure;
semilogy(0:numel(storia_g)-1,storia_g, ...
    'DisplayName','Gradiente');
hold on;

semilogy(0:numel(storia_c)-1,storia_c, ...
    'DisplayName','Gradiente coniugato');

semilogy(0:numel(storia_b)-1,storia_b, ...
    'DisplayName','BiCGStab');

yline(tol,'k--','DisplayName','Tolleranza');

xlabel('Iterazione k');
ylabel('Residuo relativo');
legend('show');
grid on;
hold off;