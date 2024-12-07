%% PROGRAMA 2 %%

function [d, Py] = quintica_a_trozos(x, f, fp, fpp, y)
    % Número de nodos de la partición
    nx = length(x); 

    d = zeros(6, nx - 1);

    % Para cada intervalo calculamos el polinomio quintico 
    % con la función quintica
    for j = 1 : nx - 1
        [~, d(:, j)] = quintica(x(j : j+1), f(j : j + 1), fp(j : j + 1), fpp(j : j + 1));
    end
    
    % Finalmente evaluamos el polinomio en los puntos de y
    pp = mkpp(x, d');
    Py = ppval(pp, y);
end