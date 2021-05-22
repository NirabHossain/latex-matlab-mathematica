%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%          ASSIGNMENT 07             %%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%% PROBLEM 01 %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


fprintf('\n\n%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n\n')
fprintf('\nOutput for problem 01:\n')
fprintf('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n\n\n')

clc
k=48;s0=50;r=.12;s1=60;s2=42;t=.5;
u=s1/s0;d=s2/s0;
Cu=max(s1-k,0);Cd=max(s2-k,0);
delta=(Cu-Cd)/(s0*(u-d));
C_0=delta*s0*(1-u*exp(-r*t))+Cu*(exp(-r*t))


p=(exp(r*t)-d)/(u-d);
C_1=exp(-r*t)*(p*Cu+(1-p)*Cd)
if(C_0-C_1<10^-12)
    fprintf('\t\t\tSame value\n\n\n')
end

clear
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%% PROBLEM 02 %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


fprintf('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
fprintf('\nOutput for problem 02:\n')
fprintf('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n\n\n')



s0=30;k=30;u=1+.08;d=1-.1;r=.05;
s1=s0*u;s2=s0*d;s11=s0*u*u;s12=s0*u*d;s22=s0*d*d;
T=4/12;L=2;t=T/L;
Cuu=(max(30-s11,0))^2;
Cud=(max(30-s12,0))^2;
Cdd=(max(30-s22,0))^2;
p=(exp(r*t)-d)/(u-d);

Cu=max(exp(-r*t)*(p*Cuu+(1-p)*Cud),(max(30-s1,0))^2);
Cd=max(exp(-r*t)*(p*Cud+(1-p)*Cdd),(max(30-s2,0))^2);
C01=exp(-r*t)*(p*Cu+(1-p)*Cd);
fprintf('\n\nAmericano: %f\n\n',C01);
Cu=exp(-r*t)*(p*Cuu+(1-p)*Cud);
Cd=exp(-r*t)*(p*Cud+(1-p)*Cdd);
C02=exp(-r*t)*(p*Cu+(1-p)*Cd);
fprintf('Europa: %f\n\n',C02);
if(abs(C01-C02)<10^-8)
    disp('No need to exercise early')
end




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



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%% PROBLEM 03 %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


fprintf('\n\n\n%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
fprintf('\nOutput for problem 03:\n')
fprintf('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n\n\n')




clear
s0=40; k=40; r=.04; v=.3; T=0.5;L=5%input('Step size= ');
c=zeros(1000,1000);
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
fprintf('Option Value: %f \n\nThe %d step binomial tree is:\n\n',c(1,1),L)

for i=1:L+1%%%%%%%%%%%% Tree Printing %%%%%%%%%% Print na korleo hobe
    for i1=1:i-1
        fprintf('           ')%%%%%%%%%%%% Space Printing
    end
   for j=i:L+1
        fprintf(" %10.6f",c(i,j))
    end
    disp(' ')
end









%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%% PROBLEM 04 %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


fprintf('\n\n\n%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
fprintf('\nOutput for problem 04:\n')
fprintf('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n\n\n')
disp(' ')







clear
s=[30.2 32 31.1 30.1 30.2 30.3 30.6 33 32.9 33 33.5 33.5 33.7 33.5 33.2]';
n=length(s)-1;
for i=1:n
    u(i)=log(s(i+1)/s(i));
end
SD=sqrt(sum(u.*u)/(n-1)-(sum(u))^2/(n*(n-1)));%(u*u')
Volatility=SD/sqrt(5/252)
Standard_Error=Volatility/(sqrt(2*n))



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%% PROBLEM 05 %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


fprintf('\n\n\n%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
fprintf('\nOutput for problem 05:\n')
fprintf('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n\n\n')

disp(' ')


clear
k=5; r=.04; v=.2; T=.5; s(1)=5;ic=0;L=1000;R=10^4;m=10^3;step=[L:m:R];
for n=step
    phi=randn(n,1);t=T/n;
    for i=1:n
        s(i+1)=s(i)*exp((r-.5*v*v)*t+v*phi(i)*sqrt(t));
        p(i)=(max(k-s(i),0))*exp(-i*r*t);
        c(i)=(max(s(i)-k,0))*exp(-i*r*t);
    end     %N(x)=(1+Erf(x/?2))/2     N(-d1)=1-N(d1)
    ic=ic+1;s0=s(ic);
    Call(ic)=mean(c);Put(ic)=mean(p);     %%%%    Option Values
    CallParity(ic)=Call(ic)+s0;PutParity(ic)=Put(ic)+k*exp(-r*T);;  %% Parity Checking
    d1=(log(s0/k)+(r+v^2/2)*T)/(v*sqrt(T));    d2=d1-(v*sqrt(T));              
    Nd1=(1+erf(d1/sqrt(2)))/2;              Nd2=(1+erf(d2/sqrt(2)))/2;
    C0(ic)=s0*Nd1-k*exp(-r*T)*Nd2;     P0(ic)=k*exp(-r*T)*(1-Nd2)-s0*(1-Nd1);
end

CallOption______Put___CallParity__PutParity____C0______P0_Error=[Call' Put' CallParity' PutParity' C0' P0',abs(CallParity'-PutParity')] %%% Parity checking
plot(step,Call,'*',step,Put,'d',step,CallParity,step,PutParity,step,C0,'*',step,P0,'d',step,abs(CallParity'-PutParity'),'h')
legend('Call','Put','CallParity','PutParity','Exact_C','Exact_P','Error')
title('Figure showing all the derivatives')
xlabel('Steps')
ylabel('Value of the derivatives')

