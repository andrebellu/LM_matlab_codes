% test gradiente_iso
A=[10 6 ; 6 6];
b=[11;2];
x0=[-40;50]; tol=1e-10; kmax=100;

scelta=menu('scegli il metodo',...
    'gradiente',...
    'gradiente coniugato');

if scelta==1
    [x, res, k, resv]= gradiente_iso(A,b,x0,tol,kmax);
elseif scelta==2
    [x, res, k, resv]= gc_iso(A,b,x0,tol,kmax);
end