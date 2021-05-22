function [c,sol]=isOptimal(c)
n=length(c);
for cnt=1:2
    p=sum(c'==0)';
    for i=1:n
        if(p(i)==1)
            f=find(c(i,:)==0);
            if(f) 
                sol(i)=f;
                c(:,f)=inf;
            end
        end
    end
    p=sum(c==0);
     for j=1:n
        if(p(j)==1)
            f=find(c(:,j)==0);
            if(f)
                sol(f)=j;
                c(f,:)=inf;
            end
        end
     end
end
end
