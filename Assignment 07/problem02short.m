clear; clc
s=30; T=4/12; L=input('Please put the value\n'); t=T/L; u=1.08; d=.9; r=.05;
p=(exp(r*t)-d)/(u-d);

american=0

for j=L+1:-1:1   %%%% Tree calculation
    for i=1:j
        if(j==L+1)
            C(i,j)=max(30-s*u^(L+1-i)*d^(i-1),0)^2;
        else
            C(i,j)=exp(-r*t)*(p*C(i,j+1)+(1-p)*C(i+1,j+1));            
            if(american==1)
                C(i,j)=max(C(i,j),max(30-s*u^(L+1-i)*d^(i-1),0)^2);
            end
        end
    end
end
C(1,1)
for i=1:L+1    %%%%Tree printing
    for j=1:L+1
        if(j<i)
%             fprintf('          ');
        else
%             fprintf('%10.4f',C(i,j));
        end
    end
    disp(' ');
end
