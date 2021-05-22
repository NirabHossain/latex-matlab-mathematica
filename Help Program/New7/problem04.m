clear; clc
s=[30.2,32.0,31.1,30.1,30.2,30.3,30.6,33.0,32.9,33.0,33.5,33.5,33.7,33.5,33.2];
n=length(s)-1;
for i=1:n
    u(i)=log(s(i+1)/s(i));
end
sd=sqrt((u*u')/(n-1)-sum(u)^2/(n*(n-1)))
v=sd/sqrt(5/252)
se=v/sqrt(2*n)
