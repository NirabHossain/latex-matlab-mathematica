open(1,file='in3B.dat')
do t=0,15,.1
    write(1,*)2*cos(t),2*sin(t),t/2
end do
end
