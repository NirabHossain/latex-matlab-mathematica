clear; clc
s=30; T=4/12; t=2/12; u=1.08; d=.9; r=.05;
su=s*u; suu=s*u*u; sud=s*d*u; sdd=s*d*d; sd=s*d;
cuu=max(30-suu,0)^2;
cud=max(30-sud,0)^2;
cdd=max(30-sdd,0)^2;

p=(exp(r*t)-d)/(u-d)
cu=exp(-r*t)*(p*cuu+(1-p)*cud)
cd=exp(-r*t)*(p*cud+(1-p)*cdd)

fu=max(cu,max(30-su,0)^2)
fd=max(cd,max(30-sd,0)^2)

c0=exp(-r*t)*(p*cu+(1-p)*cd)
c1=exp(-r*t)*(p*fu+(1-p)*fd)


if(abs(c0-c1)<10^-10)
    disp('They are same')
end