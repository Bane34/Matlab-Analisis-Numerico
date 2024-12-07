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

    % Calculo de la cuadratura mediante la regla del punto medio
    S = sum(f((xx(2 : n_nodos) + xx(1 : n_nodos - 1)) / 2));
    S = delta * S;
    
    % Guardamos los errores y el número de nodos
    error(i) = abs(I_val - S);
    ef(i) = n_nodos;
end

loglog(ef, error, '*-b');

log2(error(1 : 5) ./ error(2 : 6))