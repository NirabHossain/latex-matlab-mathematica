clear; clc
s(1)=5; k=5; r=.04; v=.2; T=.5; L=1000; m=10^3; R=10000;ic=0;
step=L:m:R;


for n=step
    phi=randn(n,1);
    t=T/n;
    for i=1:n
        s(i+1)=s(i)*exp((r-.5*v^2)*t+v*phi(i)*sqrt(t));
        p(i)=max(k-s(i),0)*exp(-i*r*t);
        c(i)=max(s(i)-k,0)*exp(-i*r*t);
    end
    ic=ic+1;  s0=s(ic);
    Call(ic)=mean(c); Put(ic)=mean(p);
    CallParity(ic)=Call(ic)+s0;
    PutParity(ic)=Put(ic)+k*exp(-r*T);
    
    d1=(log(s0/k)+(r+.5*v^2)*T)/(v*sqrt(T));
    d2=(log(s0/k)+(r-.5*v^2)*T)/(v*sqrt(T));
    
    nd1=.5*(1+erf(d1/sqrt(2)));
    nd2=.5*(1+erf(d2/sqrt(2)));
    
    C0(ic)=s0*nd1-k*exp(-r*T)*nd2;
    P0(ic)=k*exp(-r*T)*(1-nd2)-s0*(1-nd1);

end
CallOption______Put___CallParity__PutParity____C0______P0_Error=...
    [Call' Put' CallParity' PutParity' C0' P0',abs(CallParity'-PutParity')] %%% Parity checking
plot(step,Call,step,Put,step,CallParity,step,PutParity,step,C0,...
step,P0,step,abs(CallParity'-PutParity'))
legend('Call','Put','CallParity','PutParity','Exact_C','Exact_P','Error')
