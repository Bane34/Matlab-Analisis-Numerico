
xgrid = [-1 : 0.01 : 1];
coef = diag([1, 1, 1, 1, 1]);

hold on
for l = 1 : 5
    ygrid = ClenshawChebyshev(coef(l, :), xgrid);
    plot(xgrid, ygrid);
    %pause;
end

legend('$T_0(x)$','$T_1(x)$','$T_2(x)$','$T_3(x)$','$T_4(x)$','Interpreter','latex');
pause 
hold off;

coef = zeros(21, 1);
coef(21) = 1;
ygrid = ClenshawChebyshev(coef, xgrid);
plot(xgrid, ygrid);