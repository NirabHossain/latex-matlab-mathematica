
open(2,file='in32.dat')
open(3,file='in33.dat')
open(4,file='in34.dat')
do x=0,15,.1
    write(2,*)t,2*cos(t)
    write(3,*)t,2*sin(t)
    write(4,*)t,t/2
end do
end
