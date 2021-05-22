clc
clear
s=[30.2 32 31.1 30.1 30.2 30.3 30.6 33 32.9 33 33.5 33.5 33.7 33.5 33.2]';
n=length(s)-1;
for i=1:n
    u(i)=log(s(i+1)/s(i));
end
SD=sqrt(sum(u.*u)/(n-1)-(sum(u))^2/(n*(n-1)));%(u*u')
Volatility=SD/sqrt(5/252)
Standard_Error=Volatility/(sqrt(2*n))


