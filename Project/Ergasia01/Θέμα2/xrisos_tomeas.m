function [a,b,k,l] = xrisos_tomeas(f,lamda)

k=1;
l=lamda;
a = []; b= [];
a(k)=0; b(k)=3;
g=0.618;

x1= a(k)+(1-g)*(b(k)-a(k)) ;
x2= a(k)+ g*(b(k)-a(k)) ;

while b(k)-a(k)>l
    k=k+1;

    if subs(f,x1) > subs(f,x2)
        a(k) = x1;
        b(k) = b(k-1);
        x2=a(k)+g*(b(k)-a(k));
        x1=x2;
    else
        a(k) = a(k-1);
        b(k) = x2;
        x2=x1;  
        x1=a(k)+(1-g)*(b(k)-a(k)) ;
    end
end

