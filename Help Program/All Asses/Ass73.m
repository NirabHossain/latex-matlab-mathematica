clear; clc
L=3;
C=Tree(L);
PrintTree(C,L+1);
step=[10,50,500];

for L=step
    C=Tree(L);
    C(1,1)
end



function c=Tree(L)
s(1)=40; k=40; r=.04; v=.3; T=6/12;

t=T/L;
u=exp(v*sqrt(t));
d=1/u;
p=(exp(r*t)-d)/(u-d);

for j=L+1:-1:1
    for i=1:j
        if(j==L+1)
            c(i,j)=max(s*u^(L+1-i)*d^(i-1)-k,0);
        else 
            c(i,j)=exp(-r*t)*(p*c(i,j+1)+(1-p)*c(i+1,j+1));
        end
    end
end

end

function PrintTree(c,n)
    for i=1:n
        for j=1:n
            if(j<i)
                fprintf('          ')
            else
                fprintf('%10.5f',c(i,j))
            end
        end
        disp(' ')
    end
end
















