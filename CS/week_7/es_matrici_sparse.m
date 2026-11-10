load west0479.mat
W = west0479;
A = full(W);

x = rand(size(W,2),1);

tic
for k = 1:1000
    y = A*x;
end
tempo_pieno = toc;

tic
for k = 1:1000
    z = W*x;
end
tempo_sparso = toc;

fprintf('Tempo pieno: %.3e s\n',tempo_pieno);
fprintf('Tempo sparso: %.3e s\n',tempo_sparso);
fprintf('Differenza risultati: %.3e\n',norm(y-z));

whos A W

%I due prodotti rappresentano la stessa operazione matematica. 
% Il formato sparso può ridurre memoria e lavoro sfruttando gli zeri; 
% i tempi effettivi dipendono dalla matrice, dal computer e dall'implementazione. 
% Eventuali piccole differenze nei risultati possono dipendere dagli arrotondamenti.