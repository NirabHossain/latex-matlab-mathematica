clear;clc
L=2;

C=pvltree(L,1);
C(1,1)

D=pvltree(L,0);
D(1,1)


for i=1:L+1
    for j=1:L+1
       if(i>j)
           fprintf('          ')
       else
           fprintf('%10.4f',C(i,j))
       end
    end
    disp(' ')
end
disp(' ')
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


if(abs(C(1,1)-D(1,1))<10^-12)
    fprintf('No need to exercise earlier\n\n')
else
    disp('Exercise early\n\n')
end




















function C=pvltree(L,america)
s=30; T=4/12; t=T/L; u=1.08; d=.9; r=.05; k=30; 
p=(exp(r*t)-d)/(u-d);
for j=L+1:-1:1
    for i=1:j
        if(j==L+1)
            C(i,j)=max(k-s*u^(L+1-i)*d^(i-1),0)^2;
        else
            C(i,j)=exp(-r*t)*(p*C(i,j+1)+(1-p)*C(i+1,j+1));
            if(america==1)
                C(i,j)=max(C(i,j),max(k-s*u^(L+1-i)*d^(i-1),0)^2);
            end
        end
    end
end

end

