clc
clear
t=0:.1:15;
id1=fopen('part1.dat','w');
id2=fopen('part2.dat','w');
id3=fopen('part3.dat','w');
fprintf(id1,'%f %f\n',t,2*cos(t));
fprintf(id2,'%f %f\n',t,2*sin(t));
fprintf(id3,'%f %f\n',t,t/2);
fclose(id1);
fclose(id2);
fclose(id3);

type part1.dat part2.dat part3.dat