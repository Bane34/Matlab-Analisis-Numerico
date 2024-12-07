n = [2, 4, 8, 16, 32, 64];
nn = length(n);

f = @(x) sin(x); % Handle para la función seno

x_vals = linspace(-pi, pi, 501);
f_vals = f(x_vals);
plot(x_vals, f_vals, 'b')

% Declaración del vector donde vamos a guardar los errores
error = zeros(nn, 1);

hold 

for j = 1 : nn
    delta = [-pi : (2 * pi) / n(j) : pi]; % Creamos la partición segun los valores de n
    f_delta = f(delta); % Valores en los nodos
    f_delta = f_delta(1 : length(f_delta) - 1);

    % Calculamos el spline cubico periodico en los nodos de la partición
    coefs = spline_cubico_per(delta', f_delta');
    S = mkpp(delta, coefs);
    s_vals = ppval(S, x_vals);

    plot(x_vals, s_vals, '--r',  delta, [f_delta, f_delta(1)], 'or');

    error(j) = max(abs(f_vals - s_vals));

    pause
end

hold

% Cálculo del orden del error
p = error(1 : nn - 1) ./ error(2 : nn);
p = log2(p);
p = [p ; nan];
table(error, p)


%% El orden del interpolante completo es 4 luego
%% efectivamente coincide el orden que observamos aqui.