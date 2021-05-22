clear;clc 
inp=10^5; %x=zeros(2,inp);
id=fopen('open2.dat','w');
for i=1:inp
     fprintf(id,"%d %d\n",i,f(i));    %x(:,i)=[i;f(i)];
end