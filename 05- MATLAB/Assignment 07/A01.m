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

