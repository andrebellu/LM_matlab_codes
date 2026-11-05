function c = combinav(a, b)
    n = length(a);
    c = zeros(n,1);

    for i = 1:n
        c(i) = 2*a(i) - b(i);
    end
end