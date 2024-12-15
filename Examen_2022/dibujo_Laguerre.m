% Vamos a dibujar las 5 primeros polinomios de Laguerre

xgrid = [0 : 0.001 : 5]';

coef=[1];
hold 
axis([0 5 -4 4])

for l=0:6
    ygrid =ClenshawLaguerre(coef, xgrid);
    
    plot(xgrid, ygrid);
    pause
    
    coef = [0 coef];
end

legend('P_0', 'P_1', 'P_2', 'P_3', 'P_4', 'P_5', 'P_6');
pause
hold 

close all;