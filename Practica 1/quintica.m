%% PROGRAMA 1 %%

function [c, d] = quintica(x, f, fp, fpp)
    c = zeros(6, 1); % Inicializamos el vector que vamos a devolver

    % Datos correspondientes a las tres primeras columnas de la tabla de
    % diferencias divididas
    c(1) = f(1);
    c(2) = fp(1);

    % Calculamos f[x_0, x_1] a mano
    dd_01 = (f(2) - f(1)) / (x(2) - x(1));

    % La tercera columna esta formada por
    %       f_0'' / 2
    %       f[x_0, x_0, x_1]
    %       f[x_0, x_1, x_1]
    %       f_1'' / 2
    
    dd_000 = fpp(1) / 2;
    dd_001 = ( dd_01 - fp(1) ) / ( x(2) - x(1));
    dd_011 = ( fp(2) - dd_01 ) / (x(2) - x(1));
    dd_111 = fpp(2) / 2;

    tercera_col = [dd_000; dd_001; dd_011; dd_111];
    c(3 : 6) = tercera_col';

    % Tenemos que rellenar 3 huecos del vector y para cada diferencia
    % dividida necesitamos una menos que la anterior luego 
    % las vamos guardando en los huecos que no hemos llenado aun en el
    % vector c y las usamos para el calculo de las siguientes
    for j = 4 : 6
        c(j : 6) = ( c(j : 6) - c( j - 1 : 5)) / (x(2) - x(1));
    end

    % Cambio de base a la base de Taylor explicado en el documento
    % adjuntado
    d = c;
    d(1 : 4) = c(1 : 4);
    d(4) = c(4) + c(5) * (x(1) - x(2)) + c(6) * (x(1) - x(2))^2;
    d(5) = c(5) + 2 * c(6) * (x(1) - x(2));
    
    d(1 : 6) = d(6 : -1 : 1);
end