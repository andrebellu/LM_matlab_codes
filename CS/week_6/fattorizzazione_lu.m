function [L,U,P] = fattorizzazione_lu(A,ipiv)
% metodo di fattorizzazione LU con o senza pivotazione
% Input A: matrice quadrata
%    ipiv: =1 esegui pivotazione
%    ipiv: =0 non eseguire pivotazione
% Output L,U,P: LU=PA (se ipiv=0, P=I)
%
% [L,U,P] = fattorizzazione_lu(A,ipiv)

% leggo le dimensioni di L
[n,m]=size(A);

if n==m % controllo che la matrice sia quadrata
    % LU
    P=eye(n);
    for k=1:n-1
        % pivotazione per righe
        if ipiv==1
            [~,r_ridotto]=max(abs(A(k:n,k))); % r_ridotto e' riferito al vettore che
            r=r_ridotto+k-1; % r e' l'indice della riga da cambiare
            temp=A(k,:);
            A(k,:)=A(r,:);
            A(r,:)=temp;
            % scambio riga r e k di P
            temp=P(k,:);
            P(k,:)=P(r,:);
            P(r,:)=temp;
            % fine della pivotazione
        end
        for i=k+1:n
            A(i,k)=A(i,k)/A(k,k); % moltiplicatore

            for j=k+1:n % diminuisco il numero di iterazioni: parto da k+1 al posto che da 1
                A(i,j)=A(i,j)-A(i,k)*A(k,j); % combinazione delle righe i e k
            end
        end
    end
    U=triu(A);
    L=tril(A,-1)+eye(n);

else
    disp('Attenzione: le dimensioni di A non sono corrette')
    L=[]; U=[]; P=[];
end