function [c,sol]=isOptimal(c)
n=length(c);
for k=1:2
    p=sum(c'==0)'
    for i=1:n
        if(p(i)==1)
            f=find(c(i,:)==0);
                c(:,f)=inf
            if(f) 
                sol(i)=f;
            end
        end
    end
    p=sum(c==0)
     for j=1:n
        if(p(j)==1)
            f=find(c(:,j)==0)
                c(f,:)=inf
            if(f)
                sol(f)=j;
            end
        end
     end

end
c=c.*(c==inf)
end
