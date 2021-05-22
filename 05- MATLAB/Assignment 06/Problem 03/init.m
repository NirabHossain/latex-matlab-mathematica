function [outputArg2,outputArg1] = init(Cost,d,s,m,n)
a=Cost;
b=zeros(m,n);
while((sum(d)+sum(s)>0))
    mm=min(min(a));
    [p,q] = find(a==mm,1);
    b(p,q)=min(s(p),d(q));
    s(p)=s(p)-b(p,q);d(q)=d(q)-b(p,q);
    if(s(p)==0)
        a(p,:)=intmax;
    else
        a(:,q)=intmax;
    end
end
sm=sum(sum(Cost.*b));
outputArg1 = sm;
outputArg2 = b;
end

