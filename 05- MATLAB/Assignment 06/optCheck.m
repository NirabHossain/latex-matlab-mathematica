function [c,ic,sol] = optCheck(c)
ic=0;n=length(c);
for i1=1:2
p=sum(c'==0)';
for i=1:n       %Row Checking
    if(p(i)==1)
        f=find(0==c(i,:));
        c(:,f)=intmax;
        if(f)
            ic=ic+1;sol(i)=f;
        end
    end
end
p=sum(c==0);
for i=1:n       %Column Checking
    if(p(i)==1)
        f=find(0==c(:,i));
        c(f,:)=intmax;
        if(f)
            ic=ic+1;sol(f)=i;
        end
    end
end
end
for i=1:n %Making other elements exactly zero to calculate easily
    for j=1:n
        if(c(i,j)~=intmax)
            c(i,j)=0;
        end
    end
end
end
