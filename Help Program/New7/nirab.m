function c=nirab(n,am,s,k,u,d,r,t)
p=(exp(r*t)-d)/(u-d);
for j=n+1:-1:1
    for i=1:j
        if(j==n+1)
            c(i,j)=max(s*u^(j-i)*d^(i-1)-k,0);
        else
            c(i,j)=exp(-r*t)*(p*c(i,j+1)+(1-p)*c(i+1,j+1));
            if(am==1)
                c(i,j)=max(c(i,j),max(s*u^(j-i)*d^(i-1)-k,0));
            end
        end
    end
end
end
