function ygrid = ClenshawChebyshev(coef, xgrid)
    n = length(coef);
    l_x = length(xgrid);

    ygrid = zeros(n + 2, l_x);

    ygrid(n + 2, :) = 0;
    ygrid(n + 1, :) = 0;

    for i = n : - 1 : 2
        ygrid(i, :) = coef(i) + 2 * xgrid.* ygrid(i + 1, :) - ygrid(i + 2, :);
    end

    ygrid(1, :) = coef(1) + xgrid .* ygrid(2, :) - ygrid(3, :);
    ygrid = ygrid(1, :);
end