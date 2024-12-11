function ygrid = ClenshawLegendre(coef, xgrid)  
    n = length(coef) - 1; % Coef tiene \alpha_0, \dots, \alpha_n entradas
    j = length(xgrid);

    if (n > 0)
        ygridv = coef(n + 1) * ones(j, 1);
        ygrid = coef(n) +((2 * n - 1) / n) * xgrid .* ygridv;
    
        for k = n - 1 : -1 : 1
            aux = coef(k) + ((2 * k - 1) / k) * xgrid .* ygrid - (k / (k + 1)) * ygridv;
            ygridv = ygrid;
            ygrid = aux;
        end
    else 
        ygrid = coef(1) * ones(j, 1);
    end
end