clear; clc
x=-8:.1:8;
f=[x; x.^3+2.*x+1];
id=fopen('gen1.dat','w');
fprintf(id,'%f %f\n',f);

