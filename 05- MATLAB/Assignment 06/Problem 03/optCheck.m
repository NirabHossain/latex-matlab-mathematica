
function[c]=optCheck(a,b,m,n)
c=zeros(m,n);
[p q]=find(0~=b);
u(1:m)=intmax;
v(1:n)=intmax;
u(p(1))=0;%%% Initialisationfor u v
while(sum(intmax==u)+sum(intmax==v)~=0)
    [u v]=solv(u,v,p,q,a); %Solve with a simple function
end
for i=1:m %%%%% Optimality Checking at empty cell
    for j=1:n
        if(b(i,j)==0)
            c(i,j)=a(i,j)-u(i)-v(j);
        end
    end
end
end