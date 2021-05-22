clear; clc
disp('Answer to the question number (a)')
s=40; k=40; v=.3; T=6/12; r=.04;
L=3; %input('Tree value\n'); 
t=T/L;

u=exp(v*sqrt(t))
d=1/u
p=(exp(r*t)-d)/(u-d)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp('Answer to the question number (b)')
C=pvltree(L,0);
fprintf('Option value for %d step binomial tree is: %f\n\n',L,C(1,1))
Print(C,L)

disp('Answer to the question number (c)')
step=[10 50 100 500];
for L=2
    C=pvltree(L,1);
    D=pvltree(L,0);
    fprintf('Step: %d\tAmerican Option value: %f\t European option value: %f\n\n',L,C(1,1),D(1,1))
    Print(C,L)
    Print(D,L)
end


function C=pvltree(L,america)
s=40; k=40; T=6/12; t=T/L; v=.3; r=.04;
u=exp(v*sqrt(t));
d=1/u;
p=(exp(r*t)-d)/(u-d)
for j=L+1:-1:1
    for i=1:j
        if(j==L+1)
            C(i,j)=max(s*u^(L+1-i)*d^(i-1)-k,0);
        else
            C(i,j)=exp(-r*t)*(p*C(i,j+1)+(1-p)*C(i+1,j+1));
            if(america==1)
                C(i,j)=max(C(i,j),max(s*u^(j-i)*d^(i-1)-k,0));
            end
        end
    end
end
end



function Print(C,L)
    for i=1:L+1
        for j=1:L+1
            if(j<i)
                fprintf('          ')
            else 
                fprintf('%10.3f',C(i,j))
            end
        end
        disp(' ')
    end
end