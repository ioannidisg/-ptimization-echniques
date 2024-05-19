function [ g ] = armijo(x,y,k,f,grad)

x1 = x(k);
y1 = y(k);

b=0.5;
a=0.3;

for m=1:20
    gk=grad(x1(1),y1(1));
    d = -gk;
    x2 = x1 + b^m*d;
    y2 = y1 + b^m*d;
    
    if f(x1(1),y1(1)) - f(x2(1),y2(1)) >= a*b^m*(d')*gk
        break;
    end
    x1=x2;
    y1=y2;

end

g = b^m;