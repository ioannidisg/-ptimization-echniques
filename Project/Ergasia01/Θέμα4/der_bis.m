function [a,b,k,l] = der_bis(df,lamda)

l = lamda;
a = []; b= [];
a(1) = 0; b(1) = 3;

n=0; k=1;

while( n<log2((b(k) - a(k))/ l))
    n = n +1;
end

for k=1:n 
    x(k) = (a(k)+b(k))/2;
    A = subs(df,x(k));

    if A==0
        break;
    elseif A > 0
        a(k+1) = a(k);
        b(k+1)=x(k);
    else
        a(k+1)=x(k);
        b(k+1)=b(k);
    end

end