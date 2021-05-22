clear; clc
C=[2 4 4 1; 10 3 7 7; 6 7 20 5]
D=[50 100 150 200]; S=[150 200 150]';
[m,n]=size(C)
B=zeros(m,n);


for i=1:m
    for j=i:n
        B(i,j)=min(S(i),D(j));
        S(i)=S(i)-B(i,j);     D(j)=D(j)-B(i,j);
    end
end
fprintf("Total cost for the NorthWest method: %d and the cost matrix is: ",sum(sum(C.*B)))
Cost_Matrix=B
