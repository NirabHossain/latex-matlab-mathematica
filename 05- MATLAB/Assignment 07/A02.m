clc
clear
s0=30;k=30;u=1+.08;d=1-.1;r=.05;
s1=s0*u;s2=s0*d;s11=s0*u*u;s12=s0*u*d;s22=s0*d*d;
T=4/12;L=2;t=T/L;
Cuu=(max(30-s11,0))^2;
Cud=(max(30-s12,0))^2;
Cdd=(max(30-s22,0))^2;
p=(exp(r*t)-d)/(u-d);

Cu=max(exp(-r*t)*(p*Cuu+(1-p)*Cud),(max(30-s1,0))^2);
Cd=max(exp(-r*t)*(p*Cud+(1-p)*Cdd),(max(30-s2,0))^2);
C0=exp(-r*t)*(p*Cu+(1-p)*Cd);
fprintf('Americano: %f\n\n',C0);
Cu=exp(-r*t)*(p*Cuu+(1-p)*Cud);
Cd=exp(-r*t)*(p*Cud+(1-p)*Cdd);
C0=exp(-r*t)*(p*Cu+(1-p)*Cd);
fprintf('Europa: %f\n\n',C0);





%%%%%%%%%%% 
fprintf('\nN-Step Binomial Tree\n\n')
c=zeros(1000,1000);
p=(exp(r*t)-d)/(u-d);
for j=L+1:-1:1    
    for i=1:j
        if(j==L+1)
            c(i,j)=(max(30-s0*u^(L-i+1)*d^(i-1),0))^2;
        else
            c(i,j)=exp(-r*t)*(p*c(i,j+1)+(1-p)*c(i+1,j+1));
        end
    end
end
for i=1:L+1%%%%%%%%%%%% Tree Printing %%%%%%%%%%
    for i1=1:i-1
        fprintf('           ')
    end
   for j=i:L+1
        fprintf(" %10.6f",c(i,j))
    end
    disp(' ')
end

