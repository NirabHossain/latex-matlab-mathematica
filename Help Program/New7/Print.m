function Print(c,n)
    for i=1:n
        for j=1:n
            if(i>j)
                fprintf('          ')
            else 
                fprintf('%10.4f',c(i,j))
            end
        end
        disp(' ')
    end
end