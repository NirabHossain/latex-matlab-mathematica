clear; clc
cost=[20 28 19 13; 15 30 31 28; 40 21 20 17; 21 28 26 12];a=cost;
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
            if(sum(c(i,:)==inf)+sum(c(:,j)==inf)==2*n) 
                a(i,j)=mm+a(i,j);
            elseif(c(i,j)~=inf) 
                a(i,j)=a(i,j)-mm;
            end
        end
    end
    [c,sol]=isOptimal(a);
end
Final_Reduced_Matrix=a
for i=1:length(sol)
    fprintf('Person %d gets the job %d\n\n',i,sol(i))
end
