clc 
clear all
m=3;n=4;
a=[2 4 4 1 150; 10 3 7 7 200; 6 7 20 5 150; 50 100 150 200 500]
c=a;
b=zeros(m,n);
for k=1:3
    fprintf('Round %d: ',k)
    b
    c
     s1=sum(c(m+1,:))+sum(c(:,n+1))
     for i=1:m
            for j=1:n
               if(c(i,j)==(min(min(c(1:m,1:n)))))
                   
                   
                   b(i,j)=min(c(i,n+1),c(m+1,j));
                   if(b(i,j)==0)
                       b(i,j)=50
                   end
                   c(i,n+1)=c(i,n+1)-b(i,j);
                    c(m+1,j)=c(m+1,j)-b(i,j);
                   
                    if(c(i,n+1)==0)
                        c(i,1:n)=100000;
                    end
                    if(c(m+1,j)==0)
                        c(1:m,j)=100000;
                    end
                    
               end
            end
     end
 end

fprintf('\n\n\nThe cost matrix with LCM rule is',b)
s=0;
for i=1:m
    for j=1:n
        s=s+b(i,j)*a(i,j);
    end
end
fprintf('Now the total cost is= %d\n\n',s)










