function f = fattoriale_ciclo(n)
    if n < 0
        f = [];
        fprintf('Input negativo: fattoriale non calcolato.\n');
    else
        f = 1;

        for i = 1:n
            f = f * i;
        end

        fprintf('Il fattoriale di %d vale %d\n', n, f);
    end
end