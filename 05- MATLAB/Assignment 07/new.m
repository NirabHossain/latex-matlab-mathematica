clear
syms x y;

ezplot(y==sin(x),[-3*pi 3*pi])
grid on



y=(4-x^2)/(2-x^2);
y1=diff(y)
y2=diff(y1)
m=solve(y2==0,x)
double(m)

m=solve(y1==0,x)
double(m)