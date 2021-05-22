%%%%%%%%%%%%%%%%%%%%%%%%   Problem 04  %%%%%%%%%%%%%%%%
clc
clear
a=[20 28 19 13; 15 30 31 28; 40 21 20 17; 21 28 26 12];n=length(a);
fprintf('Row and Column Reduction:')
a=(a'-min(a'))' 
a=a-min(a)
[c,ic,sol]=optCheck4(a);

while(ic~=n)
mm=min(min(a+c));
for i=1:n
    for j=1:n
        if(sum(c(i,:)==inf)+sum(c(:,j)==inf)==2*n)
            a(i,j)=a(i,j)+mm;
        end
        if(c(i,j)~=inf)
            a(i,j)=a(i,j)-mm;
        end
    end
end
[c,ic,sol]=optCheck4(a);
end
Final_Reduced_Matrix=a
Final_Result=sol'




