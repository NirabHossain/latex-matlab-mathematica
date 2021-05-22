clc
clear
a=[2 4 4 1; 10 3 7 7; 6 7 20 5];d=[50 100 150 200];s=[150;200;150];m=3;n=4;
%a=[5 4 3; 8 4 3; 9 7 5];d=[300 200 200];s=[100;300;300];m=3;n=3;
Print_Problem=[a s;d sum(d)]
fprintf("The initial Matrix,")  %%%%%%   Initial function created  %%%
[b,Initial_LCM_Cost]=init(a,d,s,m,n)
b                  %Initial_Solution=[b s;d sum(d)]



c=zeros(m,n);
[p q]=find(0~=b);
[p';q']
for i=1:4
    fprintf("     %d",a(p(i),q(i)))
end

u(1:m)=intmax;
v(1:n)=intmax;
u(p(1))=0;%%% Initialisationfor u v
while(sum(intmax==u)+sum(intmax==v)~=0)
    sum(intmax==u)+sum(intmax==v)
    [u v]=solv(u,v,p,q,a); %Solve with a simple function
end

for i=1:m %%%%% Optimality Checking at empty cell
    for j=1:n
        if(b(i,j)==0)
            c(i,j)=a(i,j)-u(i)-v(j);
        end
    end
end
c
sum(sum(c<0))



if(sum(sum(c<0))>0)
    




end


