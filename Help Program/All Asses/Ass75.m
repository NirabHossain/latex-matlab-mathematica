clear; clc
s(1)=5; k=5; r=.04; v=.2; T=.5; step=1000:1000:10000;
ic=0;
for n=step
    t=T/n;
    phi=randn(n,1);
    for i=1:n
        s(i+1)=s(i)*exp((r-.5*v^2)*t+v*phi(i)*sqrt(t));
        p(i)=max(k-s(i),0)*exp(-i*r*t);
        c(i)=max(s(i)-k,0)*exp(-i*r*t);
    end
    ic=ic+1;
    s0=s(ic);
    
    
    d1=(log(s0/k)+(r+.5*v^2)*T)/(v*sqrt(T));
    d2=(log(s0/k)+(r-.5*v^2)*T)/(v*sqrt(T));
    nd1=.5*(1+erf(d1/sqrt(2)));
    nd2=.5*(1+erf(d2/sqrt(2)));
    
    c1(ic)=mean(c);                  p1(ic)=mean(p);
    c2(ic)=s0*nd1-k*exp(-r*T)*nd2;   p2(ic)=k*exp(-r*T)*(1-nd2)-s0*(1-nd1);
     x(ic)=c1(ic)+s0;                 y(ic)=p1(ic)+k*exp(-r*T);
end
[c1' c2' p1' p2' x' y']

plot(step,c1','r*',step,c2',step,p1','g*',step,p2',step,x',step,y')
legend('Call Approx','Call Exact','Put Approx','Put Exact','Call Parity','Put parity')



