clear; clc
s=50; t=6/12; su=60; sd=42; r=.12; k=48;
u=su/s; d=sd/s;
fu=max(su-k,0);
fd=max(sd-k,0);
delta=(fu-fd)/(su-sd)
f1=s*delta-(su*delta-fu)*exp(-r*t)


p=(exp(r*t)-d)/(u-d);
f2=exp(-r*t)*(p*fu+(1-p)*fd)

if(abs(f1-f2)<10^-10)
    disp('They are same')
end
