function C=mtree(L)
s=30; T=4/12; t=T/L; u=1.08; d=.9; r=.05; k=30; america=1;
p=(exp(r*t)-d)/(u-d)
for j=L+1:-1:1
    for i=1:j
        if(j==L+1)
            C(i,j)=max(k-s*u^(L+1-i)*d^(i-1),0)^2;
        else
            C(i,j)=exp(-r*t)*(p*C(i,j+1)+(1-p)*C(i+1,j+1));
    end
end
end

end
