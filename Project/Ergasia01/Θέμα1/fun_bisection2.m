    function [a,b,k,e,l] = fun_bisection2(f,epsilon,lamda)

k = 1;
a = []; b= [];
l = lamda;
e = epsilon;
a(k) = 0; b(k) = 3;

while b(k)-a(k)>l
    x_1 = (a(k) + b(k))/2 - e;
    x_2 = (a(k) + b(k))/2 + e;
    k = k + 1;
    if subs(f,x_1) < subs(f,x_2)
        a(k) = a(k-1);
        b(k) = x_2;
    else
        a(k) = x_1;
        b(k) = b(k-1);
    end
end