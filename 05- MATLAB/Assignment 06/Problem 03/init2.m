

function [outputArg2,outputArg1] = init2(Cost,d,s,m,n)
a=Cost;
b=zeros(m,n);
for i=1:m%%%%%%%Finding the matrix:
    for j=1:n
        if(s(i)&& d(j)>0)
            b(i,j)=min(s(i),d(j));
            s(i)=s(i)-b(i,j);d(j)=d(j)-b(i,j);%Subtract
        end
    end
end
outputArg2=sum(sum(b.*a));
outputArg1=b;
end









