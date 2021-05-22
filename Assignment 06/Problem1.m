clc
clear
A=[-2 0 0 5 3; 3 2 1 2 2; -4 -3 0 -2 6; 5 3 -4 -2 6]
max(min(A'))
if(max(min(A'))== min(max(A)))
    fprintf('The game value is: %d\n\n',min(max(A)))
else fprintf('No saddle point')
end


