clear; clc
x=-8:.1:8;
fx=x.^3+2*x+1;
id1=fopen('in21.dat','w');
id2=fopen('in22.dat','w');
fprintf(id1,'%f\n',x);
fprintf(id2,'%f\n',fx);

