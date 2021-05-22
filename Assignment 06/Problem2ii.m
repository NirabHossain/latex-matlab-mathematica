clear; clc
Cost=[2 4 4 1; 10 3 7 7; 6 7 20 5]; d=[50 100 150 200]; s=[150 200 150]';
a=Cost
[m,n]=size(a);b=zeros(m,n);
while(sum(d)+sum(s)>0)
    mm=min(min(a));
    [i,j]=find(a==mm,1);
    b(i,j)=min(s(i),d(j))
    s(i)=s(i)-b(i,j); d(j)=d(j)-b(i,j);
    
    if(s(i)==0)a(i,:)=inf
    else a(:,j)=inf;
    end
end
fprintf('Total cost using LCM is: %d \n The cost Matr',sum(sum(b.*Cost)))

b
