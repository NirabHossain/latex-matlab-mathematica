function y = f(x)
    n=x;k=0;
    while(n>1)
           k=k+1;
       if(mod(n,2)==0)
           n=n/2;
           else n=3*n+1;
       end
    end
    y=k;
end