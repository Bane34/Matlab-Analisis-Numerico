function y = polyBernstein_val(coeff, x)
    n = length(coeff) - 1;

    for k = 1 : n + 1
        c(k, :) = coeff(k) .* ones(1, length(x));
    end

    for m = 1 : n
        c(1 : n - m + 1, :) = (ones(1, length(x)) - x) .* c(1 : n - m + 1, :) + x .* c(2 : n - m + 2, :);
    end

    y = c(1, :);
end