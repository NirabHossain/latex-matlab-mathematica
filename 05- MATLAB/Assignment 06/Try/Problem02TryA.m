clc
m=3;n=4;
fprintf("The given matrix is,");
a=[2 4 4 1 150; 10 3 7 7 200; 6 7 20 5 150; 50 100 150 200 500]
c=a;k=0;
b=zeros(3,4);
for i=1:m%%%%%%%Finding the matrix:
    for j=1:n
        if(c(i,n+1) && c(m+1,j)>0)
            b(i,j)=min(c(i,n+1),c(m+1,j));
            c(i,n+1)=c(i,n+1)-b(i,j);
            c(m+1,j)=c(m+1,j)-b(i,j);
        end
    end
end
fprintf('The cost matrix with northwest rule is,');b
TotalCost=sum(sum(b.*a(1:m,1:n)))









