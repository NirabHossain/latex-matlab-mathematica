function [V P_tot]=RecursiveAsian(V,N,K,n,P_tot,P,Q,M,allS)
allS_prev=allS;
S_prev=allS(end);
P_prev=P;
for i=1:3
allS=[allS_prev S_prev*exp(M(i))];
P=P_prev*Q(i);
if n==N
P_tot=P_tot+P;
% Calculates the payoff for each path
V=V+P*max(mean(allS(2:length(allS)))- K,0);
else % Increases n until n=N
[V P_tot]=RecursiveAsian(V,N,K,n+1,P_tot,P,Q,M,allS);
end
end