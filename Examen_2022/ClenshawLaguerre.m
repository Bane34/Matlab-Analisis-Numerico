function ygrid = ClenshawLaguerre(coef, xgrid)
    n = length(coef) - 1; % Grado del polinomio de Laguerre
    n_x = length(xgrid); % Numero de nodos a evaluar
    

    %%% ALGORITMO DE CLENSHAW %%%
    
    if (n > 0)
        % PRIMERA ITERACION d_n+2 = d_n+1 = 0
        ygrid_ant = coef(n + 1) * ones(n_x, 1);
    
        % SEGUNDA ITERACION d_n = \alpha_n; d_n+1 = 0
        ygrid = coef(n) + ((2 * n - 1 - xgrid) / n) .* ygrid_ant;

        % RESTO DE ITERACIONES
        for k = n - 1  : -1 : 1
            aux = coef(k) + ((2 * k - 1  - xgrid) / k) .* ygrid - ((k) / (k + 1)) * ygrid_ant;
            ygrid_ant = ygrid;
            ygrid = aux;
        end
    else
        ygrid = coef(1) * ones(n_x, 1);
    end
    
end
