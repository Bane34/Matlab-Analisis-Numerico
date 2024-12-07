%% PROGRAMA 3 %%

K = [2, 4, 8, 16, 32, 64, 128, 256];

nK = length(K);

% Handles a la función de Runge, su primera derivada y su segunda derivada
f = @(x) 1 ./ (1 + x.^2);
fp = @(x) -2 * x ./ ((1 + x.^2).^2);
fpp = @(x) ( (6 * (x.^2)) - 2 ) ./ ((1 + x.^2).^3);

y = linspace(-5, 5, 501);
error = zeros(nK, 1);

tiledlayout(2, 4);

for i = 1 : nK
    ax = nexttile; % Instrucción para poder poner todas las figuras en la misma ventana
    
    part = [-5: (10/ K(i)) :5]'; % Creamos los nodos equiespaciados
    [~, val] = quintica_a_trozos(part, f(part), fp(part), fpp(part), y);

    % Pintamos las funciones según el enunciado
    plot(y, f(y), 'b-', y, val, 'r--', part, f(part), 'ro');
    title(ax, sprintf('Gráfica para K = %d', K(i)));

    error(i) = max(abs(f(y) - val));
end

p = error(1 : nK - 1) ./ error(2 : nK);
p = log2(p);
p = [p ; 0];
disp([error p]);