clear; clc
c=[2 4 4 1; 10 3 7 7; 6 7 20 5]; d=[50 100 100 200]; s=[150 200 50]';
[m,n]=size(c)
if(sum(s)>sum(d))
    n=n+1;d(n)=sum(s)-sum(d);c(:,n)=0;
elseif(sum(d)>sum(s))
    m=m+1; s(m)=sum(d)-sum(s); c(m,:)=0;
end
c
d
s


