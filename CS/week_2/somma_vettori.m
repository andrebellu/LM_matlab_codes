clear;
clc;

n = 8;

a = rand(n, 1);
b = rand(n, 1);
c = zeros(n, 1);

for i = 1:length(a)
    c(i) = 2*a(i) - b(i);
end

disp('Risultato con il ciclo:');
disp(c);

disp('Risultato con la formula diretta:');
disp(2*a - b);