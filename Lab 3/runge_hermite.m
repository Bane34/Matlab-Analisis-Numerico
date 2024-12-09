%% @param
% cond = 0 : se utilizan para la interpolacion los nodos de Chebyshev.
% cond = 1 : se utilizan 501 nodos equiespaciados.


function runge_hermite(cond)
    K = [5, 9, 13, 17];

    % Handle a la función de Runge
    f = @(x) 1 ./ (1 + x.^2);
    fp = @(x) -2 * x ./ [(1 + x.^2).^2];

    % Dibujamos la función de Runge
    f_vals = [-5 : (10 / 501) : 5];
    r_vals = f(f_vals);
    rp_vals = fp(f_vals);
   
    for j = 1 : 4
        switch cond
            case 0
                nodos = 5 * (cos(( pi * (1 : 2 : 2 * K(j) - 1) )/ (2 * K(j)) ));
                titulo = ' puntos de Chebyshev';
            case 1
                nodos = linspace(-5, 5, K(j));
                titulo = ' abscisas equiespaciadas';
        end

        f_nodos = f(nodos);
        fp_nodos = fp(nodos);

        % Sacamos el polinomio interpolador
        [~, Py] = hermite(nodos, f_nodos, fp_nodos, f_vals);
        
        hold
        title(['funcion de Runge e interpolante de Hermite en ', num2str(K(j)), titulo])
        plot(f_vals, r_vals, 'b-', f_vals, Py, 'r--', nodos, f_nodos, 'ro');
        
        for i = 1 : K(j)
            plot([nodos(i) - 0.3, nodos(i) + 0.3], f_nodos(i) + [-0.3 * fp_nodos(i), 0.3 * fp_nodos(i)], 'k-');
        end
        hold
        disp('Pulsar cualquier tecla para seguir')
        pause
    end

end