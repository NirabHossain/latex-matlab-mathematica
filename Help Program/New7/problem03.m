clear;
L=3;
s=40; k=40; r=.04; T=6/12; v=.3;
t=T/L;
u=exp(v*sqrt(t));d=1/u;
c=nirab(L,0,s,k,u,d,r,t)
Print(c,L+1)

