%%%%%%%%% PROBLEM 02(i) %%%%%%%%%%

clc
clear
m=3;n=4;
a=[2 4 4 1; 10 3 7 7; 6 7 20 5];d=[50 100 150 200];s=[150;200;150];
b=zeros(m,n);
for i=1:m%%%%%%%Finding the matrix:
    for j=1:n
        if(s(i)&& d(j)>0)
            b(i,j)=min(s(i),d(j));
            s(i)=s(i)-b(i,j);d(j)=d(j)-b(i,j);%Subtract
        end
    end
end
fprintf('The cost matrix with northwest rule is,');b
TotalCost=sum(sum(b.*a))









