function [coef] = spline_cubico_per(x, f)
    n = length(x);

    % Calculamos los h_i
    h_inv = 1 ./ (x(2 : n)' - x(1 : n - 1)');
    l_h = length(h_inv);
     
    % Calculamos los H[x_{i-1}, x_i]
    f = [f; f(1)]';
    H = zeros(n - 1, 1);
    H = (f(2 : n) - f(1 : n - 1)) .* h_inv;

    % Calculo de la matriz
    d_prin = (2 * h_inv(1 : l_h - 1) + 2 * h_inv(2 : l_h));
    d_prin = [2 * h_inv(1) + 2 * h_inv(l_h), d_prin];

    A = diag(d_prin) + diag(h_inv(1 : n - 2), 1) + diag(h_inv(1 : n - 2), -1);
    A(n - 1, 1) =  h_inv(l_h);
    A(1, n - 1) = h_inv(l_h);
    %spy(A);

    % Matriz de términos 
    b = (H(1 : l_h - 1) .* h_inv(1 : l_h - 1)) + (H(2 : l_h) .* h_inv(2 : l_h));
    b = [(H(1) * h_inv(1)) + (H(l_h) * h_inv(l_h)), b];
    b = 3 * b;

    % Calculo de los coeficientes mediante la tabla de diferencias dividas
    H_prim = A \ b';
    H_prim = [H_prim; H_prim(1)];
    
    % No hace falta calcular diferencias divididas pues según lo visto en
    % period.pdf el cálculo de los coeficientes solo depende de H y H_prim
    % luego podemos hacerlo directamente

    coef = zeros(n - 1, 4);
    coef(:, 4) = f(1 : n - 1);
    coef(:, 3) = H_prim(1 : n - 1);
    coef(:, 2) = (3 .* H - 2 .* H_prim(1 : n - 1)' -1 .* H_prim(2 : n)') .* h_inv;
    coef(:, 1) = (H_prim(1 : n - 1)' - 2 .* H + H_prim(2 : n)') .* (h_inv .^ 2);
end