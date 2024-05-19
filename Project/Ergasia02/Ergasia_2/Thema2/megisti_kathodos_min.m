function [x_result ,y_result,k] = megisti_kathodos_min(epsilon,x,y,f,grad)

k=1;
x_result = []; 
y_result = [];

x_result(k)=x;
y_result(k)=y;

l= epsilon; % να το αλλαξω μετα σε ε/2
a=0; b=3;

while  norm(grad (x_result(k) , y_result(k)))>= epsilon
    
    d = -grad(x_result(k),y_result(k));
    syms g;
    h =  f(x_result(k) +g*d(1,1) , y_result(k) +g*d(2,1));
    paragogos=diff(h,g);
    g = der_bis_2(paragogos,l,a,b);
    x_result(k+1) = x_result(k) + g*d(1,1);
    y_result(k+1) = y_result(k) + g*d(2,1);
    k=k+1;

end






