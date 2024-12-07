function [c, Py] = hermite(x, f, fp, y)
    n = length(x);
    
    x_dup = zeros(2 * n, 1);
    x_dup(1 : 2 : 2* n - 1) = x;
    x_dup(2 : 2 : 2 * n) = x;

    dif_div = zeros(2 * n, 1);
    dif_div(1) = f(1);
    dif_div(2 : 2 : 2 * n) = fp
   

    % Segunda columna de la tabla de diferencias divididas
    dif_div(3 : 2 : 2 * n - 1) = (f(2 : n) - f(1 : n - 1)) ./ (x(2 : n) - x(1 : n - 1));
    coef(2) = dif_div(2);

    % Resto de columnas de la tabla de diferencias divididas
    for i = 3 : 2 * n 
        dif_div(i : 2 * n) = (dif_div(i : 2 * n) - dif_div(i - 1 : 2 * n - 1)) ./ (x_dup(i : 2 * n) - x_dup(1 : 2 * n - i + 1));
    end
    
    c = dif_div;
end