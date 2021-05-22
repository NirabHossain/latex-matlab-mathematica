clear; clc
cost=[2 4 4 1; 10 3 7 7; 6 7 20 5];d=[50 100 100 200];s=[150;200;150];
[m,n]=size(cost);

if(sum(d)==sum(s))
    fprintf('The problem is balanced\n\n')
else
    fprintf('The problem is unbalanced\n\n')
    if(sum(s)>sum(d))
        n=n+1;cost(:,n)=0;d(n)=sum(s)-sum(d);
    else
        m=m+1;cost(m,:)=0;s(m)=sum(d)-sum(s);
    end
end

a=cost;b=zeros(m,n);s1=s;d1=d;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Cut me if you don't want to use NW method%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:m                                 %
    for j=i:n                             %
        b(i,j)=min(d(j),s(i));            %
        s(i)=s(i)-b(i,j);                 %
        d(j)=d(j)-b(i,j);                 %
    end                                   %
end                                       %
b                                         %
Total_cost_using_NW_method=sum(sum(b.*a)) %
a=cost; b=zeros(m,n);                     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



while(sum(s1)+sum(d1)>0)
    mm=min(min(a));
    [i,j]=find(a==mm,1);
    b(i,j)=min(d1(j),s1(i));
    s1(i)=s1(i)-b(i,j); d1(j)=d1(j)-b(i,j);
    if(s1(i)==0)
        a(i,:)=inf;
    end
    if(d1(j)==0)
        a(:,j)=inf;
    end
end
b
Total_cost_using_LCM_method=sum(sum(b.*cost))











