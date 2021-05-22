clear; clc
a=[20 28 19 13; 15 30 31 28; 40 21 20 17; 21 28 26 12];org=a;
a=a-min(a')';%Row reduction
a=a-min(a);
n=length(a);
[c,sol]=isOptimal(a);

while(length(sol)~=n)
    mm=min(min(c));
    for i=1:n
        for j=1:n
            if(sum(c(i,:)==inf)+sum(c(:,j)==inf)==2*n)
                a(i,j)=a(i,j)+mm;
            elseif(c(i,j)~=inf)
                a(i,j)=a(i,j)-mm;
            end
        end
    end
    [c,sol]=isOptimal(a);
end

for i=1:n
    fprintf('Person %d gets the job %d\n\n',i,sol(i))
end

function [c,sol]=isOptimal(c)
for k=1:2
    n=length(c);
    p=sum(c'==0)';
    for i=1:n
        if(p(i)==1)
            f=find(c(i,:)==0);
            if(f)
                c(:,f)=inf;
                sol(i)=f;
            end
        end
    end
    p=sum(c==0);
    for j=1:n
        if(p(j)==1)
            f=find(c(:,j)==0);
            if(f)
                c(f,:)=inf;
                sol(f)=j;
            end
        end
    end
end
end