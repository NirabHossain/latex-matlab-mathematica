clc
clear
s0=40; k=40; r=.04; v=.3; T=0.5;L=input('Step size= ');c=zeros(1000,1000);
t=T/L;
u=exp(v*sqrt(t))
d=1/u 
p=(exp(r*t)-d)/(u-d)
for j=L+1:-1:1    
    for i=1:j
        if(j==L+1)
            c(i,j)=(max(s0*u^(L+1-i)*d^(i-1)-k,0));
        else
            c(i,j)=exp(-r*t)*(p*c(i,j+1)+(1-p)*c(i+1,j+1));
        end
    end
end
fprintf('Option Value: %f\n\n and the binomial tree is:\n\n',c(1,1))

for i=1:L+1%%%%%%%%%%%% Tree Printing %%%%%%%%%% Print na korleo hobe
    for i1=1:i-1
        fprintf('           ')%%%%%%%%%%%% Space Printing
    end
   for j=i:L+1
        fprintf(" %10.6f",c(i,j))
    end
    disp(' ')
end
