clear; clc;
s=[30.2 32 31.1 30.1 30.2 30.3 30.6 33 32.9 33 33.5 33.5 33.7 33.5 33.2];L=length(s)-1;
for i=1:L
    u(i)=log(s(i+1)/s(i));
end
sd=sqrt((u*u')/(L-1)-sum(u)^2/(L*(L-1)))
volatility=sd/sqrt(5/252)
standard_error=volatility/sqrt(2*L)