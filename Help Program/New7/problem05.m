clear; clc
s(1)=5; k=5; r=.04; v=.2; T=.5;ic=0;
step=1000:1000:10000;
for n=step
    phi=randn(n,1);
    t=T/n;
    ic=ic+1;
    for i=1:n
        s(i+1)=s(i)*exp((r-.5*v^2)*t+v*phi(i)*sqrt(t));
        c(i)=max(s(i)-k,0)*exp(-i*r*t);
        p(i)=max(k-s(i),0)*exp(-i*r*t);
    end
    s0=s(ic);
    d1=(log(s0/k)+(r+.5*v^2)*T)/(v*sqrt(T)); nd1=.5*(1+erf(d1/sqrt(2)));
    d2=(log(s0/k)+(r-.5*v^2)*T)/(v*sqrt(T)); nd2=.5*(1+erf(d2/sqrt(2)));

    c1(ic)=mean(c);                 p1(ic)=mean(p);
    c2(ic)=s0*nd1-k*exp(-r*T)*nd2;  p2(ic)=k*exp(-r*T)*(1-nd2)-s0*(1-nd1);
    cp(ic)=c1(ic)+s0;           pp(ic)=p1(ic)+k*exp(-r*T);
end
disp('   Call Obt Call Exact Put Obt  Put Exact Call Parity Put Parity Error')
Result_________________________________________________________=...
    [c1'  c2' p1' p2' cp' pp' abs((cp'-pp')./cp')]

plot(step,c1',step,c2',step,p1',step,p2',step, cp',step, pp',step, abs((cp'-pp')./cp'),'LineWidth',1.5)
axis([1000 10000 -1.5 1])
legend('Call','Exact','Put','Exact','Call Parity','Put parity','Abs error')