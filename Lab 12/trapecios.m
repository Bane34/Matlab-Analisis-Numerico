f = @(x) exp(x);

h = [1, 1 / 2, 1 / 4, 1 / 8, 1 / 16, 1 / 32]; % Diametros de la particion

a = 0;
b = 2;

% Valor de la integral que buscamos
I_val = exp(2) - 1;

% Vectores donde almacenamos los errores
error = zeros(1, 6);
ef = zeros(1, 6);

for i = 1 : 6
    xx = [a : h(i) : b]; % Nodos de la particion
    n_nodos = length(xx);
    delta = (b - a) / (n_nodos - 1);

    % Calculo de la cuadratura mediante la regla de los trapecios
    S = 0.5 * (f(xx(1)) + f(xx(n_nodos))) + sum(f(xx(2 : n_nodos - 1)));
    S = delta * S;

    % Guardamos los errores y el número de nodos
    error(i) = abs(I_val - S);
    ef(i) = n_nodos;
end

loglog(ef, error, '*-k');

log2(error(1 : 5) ./ error(2 : 6))
