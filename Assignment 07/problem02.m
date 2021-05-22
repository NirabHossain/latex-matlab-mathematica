clear; clc
s=30; t=2/12; T=4/12; u=1.08; d=.9; r=.05;

su=s*u; sd=s*d; suu=s*u*u; sud=s*u*d; sdd=s*d*d;
fuu=(max(30-suu,0))^2;fud=(max(30-sud,0))^2;fdd=(max(30-sdd,0))^2;

p=(exp(r*t)-d)/(u-d);
fu=exp(-r*t)*(fuu*p+(1-p)*fud); fd=exp(-r*t)*(fud*p+(1-p)*fdd);
fu1=max((max(30-su,0))^2,fu); fd1=max((max(30-sd,0))^2,fd);

C0_Europe=exp(-r*t)*(p*fu+(1-p)*fd)
C0_American=exp(-r*t)*(p*fu1+(1-p)*fd1)
if(abs(C0_Europe-C0_American)<10^-12)
    fprintf('No need\n')
else
    fprintf('Please exercise early\n')
end
    



fprintf('N step binomial tree')
c=zeros(1000,1000);
L=2;t=T/L;
for j=L+1:-1:1
    for i=1:j
        if(j==L+1)
            c(i,j)=(max(30-s*u^(L+1-i)*d^(i-1),0))^2;
        else
            c(i,j)=exp(-r*t)*(p*c(i,j+1)+(1-p)*c(i+1,j+1));
        end
    end
end
disp(' ')
for i=1:L+1
    for j=1:i-1   
        fprintf('           ')
    end
    for j=i:L+1
        fprintf(' %10.6f',c(i,j))
    end
    disp(' ')
end

