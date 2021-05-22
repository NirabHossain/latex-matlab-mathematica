function[u v]=solv(u,v,p,q,a)
k=length(p);
for i=1:k
    if(u(p(i))~=intmax)
        v(q(i))=a(p(i),q(i))-u(p(i));
    end
% end
% for i=1:k
    if(v(q(i))~=intmax)
        u(p(i))=a(p(i),q(i))-v(q(i));
    end
end
end
