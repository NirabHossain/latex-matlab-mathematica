function [c,sol]=isOptimal(c)
    n=length(c);
    for k=1:2
        p=(sum(c'==0));
        for i=1:n
            if(p(i)==1)
                j=find(c(i,:)==0);
                if(j)
                    sol(i)=j;
                    c(:,j)=inf;
                end
            end
        end
        
        p=sum(c==0);
        for j=1:n
            if(p(j)==1)
                i=find(c(:,j)==0);
                if(i)
                    sol(i)=j;
                    c(i,:)=inf;
                end
            end
        end
    end
end

