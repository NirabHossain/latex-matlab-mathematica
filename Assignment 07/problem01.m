clear; clc
s=50; t=6/12; su=60; sd=42; r=.12; k=48;
u=su/s
d=sd/s
fu=max(su-k,0)
fd=max(sd-k,0)
delta=(fu-fd)/(su-sd)
No_Arbitrage=s*delta*(1-u*exp(-r*t))+fu*exp(-r*t)

p=(exp(r*t)-d)/(u-d);
Risk_Neutral=exp(-r*t)*(p*fu+fd*(1-p))
if(abs(No_Arbitrage-Risk_Neutral)<10^(-14))
    fprintf('They are bound to give the same value\n\n')
end

