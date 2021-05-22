
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%          ASSIGNMENT 06             %%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%% PROBLEM 01 %%%%%%%%%%
clc
m=4;n=5;A=[-2 0 0 5 3; 3 2 1 2 2;-4 -3 0 -2 6; 5 3 -4 2 6]
Minimax=-2000;Maximin=2000;
for i=1:m
    if(Minimax<min(A(i,:)))
        Minimax=min(A(i,:));
    end
end
for i=1:n
    if(Maximin>max(A(:,i)))
        Maximin=max(A(:,i));
    end
end
if(Minimax==Maximin)
    fprintf('The game value using manual coding is=%d\n\n',Minimax)
else
    fprintf('There is no saddle point\n\n')
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% Another Way ShortCut %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Minimax=min(max(A))
Maximin=max(min(A'))
if(Minimax==Maximin)
    fprintf('The game value using MATLAB command is= %d\n\n',Minimax)
end



