clear; clc
s=50; t=6/12; su=60; sd=42; u=su/s; d=sd/s; r=.12; k=48;
cu=max(su-k,0); cd=max(sd-k,0);
delta=(cu-cd)/(su-sd)
c=s*delta-(su*delta-cu)*exp(-r*t)
p=(exp(r*t)-d)/(u-d);
c=exp(-r*t)*(p*cu+(1-p)*cd)