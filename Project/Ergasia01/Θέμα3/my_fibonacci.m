function [a,b,k,l] = my_fibonacci (f,lamda)

l = lamda;
a = []; b= [];
a(1) = 0; b(1) = 3;

k=1; n=0;

while ((b(1)-a(1))/l) > fibonacci(n+1)
    n=n+1;
end


x1(1) =a(1) + (fibonacci(n-2)/fibonacci(n))*(b(1)-a(1));
x2(1)= a(1) + (fibonacci(n-1)/fibonacci(n))*(b(1)-a(1));

while k <= n-2
    
    if( subs(f,x1) > subs(f,x2))
         a(k+1) = x1(k);
         b(k+1)=b(k);
         x1(k+1) = x2(k);
         x2(k+1) = a(k+1) +(fibonacci(n-k-1)/fibonacci(n-k))*(b(k+1)-a(k+1)); 
    
    else
        a(k+1) = a(k);
        b(k+1) = x2(k);
        x2(k+1) = x1(k);
        x1(k+1) = a(k+1)+(fibonacci(n-k-2)/fibonacci(n-k))*(b(k+1)-a(k+1)); 
    end

    k=k+1;

end

    x1(n) = x1(n-1);
    x2(n) = x1(n-1);
    if f(x1(n)) > f(x2(n))
        a(n) = x1(n);
        b(n) = b(n-1);
    else
        a(n) = a(n-1);
        b(n) = x2(n);
    end

