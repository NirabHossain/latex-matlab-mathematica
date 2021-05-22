clear; clc
a=load('mat.txt');cost=a;
n=length(a);
for i=1:n
    a(i,:)=a(i,:)-min(a(i,:));
end
for i=1:n
    a(:,i)=a(:,i)-min(a(:,i));
end
[c,sol]=isOptimal(a);
while(length(sol)~=n)
    mm=min(min(c));
    for i=1:n
        for j=1:n
            if(c(i,j)~=inf)
                a(i,j)=a(i,j)-mm;
            elseif(sum(c(i,:)==inf)+sum(c(:,j)==inf)==2*n)
                a(i,j)=a(i,j)+mm;
            end
        end
    end
    [c,sol]=isOptimal(a);
end
for i=1:n
    fprintf('Person %d gets the job %d\n\n',i,sol(i))
end









