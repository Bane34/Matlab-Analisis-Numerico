n = 32;

% funcion de runge como handle (inline va a ser eliminado)
f = @(x) 1 ./ (1 + x.^2);

t_zeros = cos( (0 : n) * pi / n );
w = [1/2, ones(n - 1, 1)', 1 / 2] .* ((-1).^[0 : 1 : n]);

xgrid = linspace(-1, 1, 201);
f_vals = f(t_zeros);

numerador = zeros(length(xgrid));
denominador = zeros(length(xgrid));

for j = 1 : n + 1
    aux = xgrid - t_zeros(j);
    numerador = numerador + (w(j) ./ aux) * f_vals(j);
    denominador = denominador + (w(j) ./ aux);
end

p = numerador ./ denominador;

plot(t_zeros, f_vals, 'o', xgrid, f(xgrid), '-.g');