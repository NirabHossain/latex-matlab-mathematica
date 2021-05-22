open(1,file='in31.dat')
do x=-8,8,.1
    write(*,'(2f10.2)')x,x**3+2*x+1
    write(1,'(2f10.2)')x,x**3+2*x+1
end do

end
