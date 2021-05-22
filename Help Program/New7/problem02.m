clear; clc;
L=2; american=0;
s=30; k=30; u=1.08; d=.9; r=.05; T=4/12; 


C=nirab(L,0,s,k,u,d,r,T)
Print(C,L+1)
