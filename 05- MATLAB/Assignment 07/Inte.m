clc
clear
syms x y
fimplicit(@(x,y) y.^2-x,'r','LineWidth',2)
grid on
hold on
fimplicit(@(x,y) y-x+2,'b','LineWidth',2)
hold on
fimplicit(@(x,y) y,'g.-')
hold on
fimplicit(@(x,y) x,'g.-')
legend('y^2=x','y=x-2')
hold off