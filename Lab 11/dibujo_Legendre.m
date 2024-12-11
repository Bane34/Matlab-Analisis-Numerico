% Contruimos los 201 nodos equiespaciados en [-1, 1]

xgrid = linspace(-1, 1, 201);

coef = [1];

hold
for i = 1 : 5
    ygrid = ClenshawLegendre(coef', xgrid');
    plot(xgrid, ygrid);
    pause;
    coef = [0, coef];
    
end
hold

legend('P_0','P_1','P_2','P_3','P_4');
hold