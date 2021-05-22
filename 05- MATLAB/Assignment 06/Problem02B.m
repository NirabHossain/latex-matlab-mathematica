%%%%%%%%% PROBLEM 02(ii) %%%%%%%%%%
clc 
clear
Cost=[2 4 4 1; 10 3 7 7; 6 7 20 5];d=[50 100 150 200];s=[150;200;150];
%Cost=[5 4 3; 8 4 3; 9 7 5];d=[300 200 200];s=[100;300;300];
[m n]=size(Cost);a=Cost;b=zeros(m,n);
while((sum(d)+sum(s)>0))
    %    k=k+1;    fprintf("Round: %d\n\n",k);b %%%%%For Printing the Round
    mm=min(min(a));
    [p,q] = find(a==mm,1);
    b(p,q)=min(s(p),d(q));
    s(p)=s(p)-b(p,q);d(q)=d(q)-b(p,q);
    if(s(p)==0)
        a(p,:)=intmax;
    else
        a(:,q)=intmax;
    end
end
fprintf("\t\t\tUsing LCM:\n\nCost= %d\nCost Matrix,",sum(sum(Cost.*b)));b






