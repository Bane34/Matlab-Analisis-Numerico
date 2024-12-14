mesh = linspace(0, 1, 501);
coeff = [1];

figure(1);
axis([0 1 0 2]);

hold 
for i = 1 : 6
    vals = polyBernstein_val(coeff, mesh);
    plot(mesh, vals);
    pause;

    coeff = [0, coeff]; 
end

hold 

% Funcion de Runge
f = @(x) 1 ./ (1 + x.^2);
z = [-5 : 0.05 : 5];
f_z = f(z);

figure(2);
hold

% Dibujamos la función de Runge en azul
plot(z,f_z,'b');
pause;

x = (z + 5) / 10; % Cambio de intervalo
jj = 5; 

for k = 1 : 6
    zz = linspace(-5, 5, jj + 1);

    % Los coeficiente vienen dados por f(k/n)
    coef = 1 ./ (1 + zz .^ 2);

    y = polyBernstein_val(coef, x);
    plot(z, y);
    pause;
    jj = 2 * jj;
end 

hold

pause 
close all
