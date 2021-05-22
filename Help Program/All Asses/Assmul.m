clear; clc
t=0:.1:15;
x=[t; cos(t)];
y=[t; sin(t)];
id1=fopen('s1.dat','w');
id2=fopen('s2.dat','w');
fprintf(id1,'%f %f\n',x);
fprintf(id2,'%f %f\n',y);
fclose(id1);
fclose(id2);
type s1.dat s2.dat

