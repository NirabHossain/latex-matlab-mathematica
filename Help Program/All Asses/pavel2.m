clear;clc
L=3;

D=pvltree(L,0);
D(1,1)


for i=1:L+1
    for j=1:L+1
       if(i>j)
           fprintf('          ')
       else
           fprintf('%10.4f',D(i,j))
       end
    end
    disp(' ')
end























function C=pvltree(L,america)
s=40; k=40; T=6/12; t=T/L; v=.3; r=.04;
u=exp(v*sqrt(t));d=1/u;
p=(exp(r*t)-d)/(u-d);
for j=L+1:-1:1
    for i=1:j
        if(j==L+1)
            C(i,j)=max(s*u^(L+1-i)*d^(i-1)-k,0);
        else
            C(i,j)=exp(-r*t)*(p*C(i,j+1)+(1-p)*C(i+1,j+1));
            if(america==1)
                C(i,j)=max(C(i,j),max(s*u^(L+1-i)*d^(i-1)-k,0));
            end
    end
end
end
end

