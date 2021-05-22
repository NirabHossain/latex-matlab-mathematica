function[c]=optmine(a,b,m,n)

c=zeros(m,n);
[p q]=find(0~=b);
[p'  ;q']

for k=1:length(p)
    fprintf("     %d",a(p(k),q(k)))
end
p(1)
u(1:m)=intmax
v(1:n)=intmax
u(p(1))=0
L=length(p)

while(sum(intmax==u)+sum(intmax==v)~=0)
    [u v]=solv(u,v,p,q,a);
end

b
for i=1:m
    for j=1:n
        if(b(i,j)==0)
            c(i,j)=a(i,j)-u(i)-v(j);
        end
    end
end


end