clear; clc
t=0:.1:15;
a=[2*cos(t); 2*sin(t); t/2];
id=fopen('gen3.dat','w');

fprintf(id,'%f %f %f\n',a);
