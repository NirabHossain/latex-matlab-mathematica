clc
clear
s=[30.2 32 31.1 30.1 30.2 30.3 30.6 33 32.9 33 33.5 33.5 33.7 33.5 33.2]';
s1=0;s2=0;n=length(s)-1;s3=0;
for i=1:n
    u(i)=log(s(i+1)/s(i));
    s1=s1+u(i)^2/(n-1); s2=s2+(u(i));
    s2=s2^2/(n*(n-1));
end
sqrt(s1-s2)
sqrt(sum(u.*u)/(n-1)-(sum(u))^2/(n*(n-1)))
for i=1:n
    s1=s1+(u(i)-mean(u))^2;
    s1=sqrt(s1/(n-1));
end
s1;
s1/sqrt(2*(n))


    
    