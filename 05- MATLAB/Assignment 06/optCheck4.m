function [c,sol] = optCheck4(c)
n=length(c);
for i1=1:2
p=sum(c'==0)'
for i=1:n       %Row Checking
    if(p(i)==1)
        f=find(0==c(i,:))
        c(:,f)=inf;
        if(f)
            sol(i)=f;
        end
    end
end
p=sum(c==0);
for i=1:n       %Column Checking
    if(p(i)==1)
        f=find(0==c(:,i))
        c(f,:)=inf
        if(f)
            sol(f)=i
        end
    end
end
end
c=c.*(c==inf);
end
