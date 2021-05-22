clc
clear
k=5; r=.04; v=.2; T=.5; s(1)=5;ic=0;L=1000;R=10^4;m=10^3;step=[L:m:R];
for n=step
    phi=randn(n,1);t=T/n;
    for i=1:n
        s(i+1)=s(i)*exp((r-.5*v^2)*t+v*phi(i)*sqrt(t));
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

