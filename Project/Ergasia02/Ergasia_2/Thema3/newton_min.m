function [x_result,y_result,k] = newton_min(epsilon,x,y,f,grad,essianosf)

k=1;
x_result = []; 
y_result = [];

x_result(k)=x;
y_result(k)=y;
l= epsilon; % να το αλλαξω μετα σε ε/2
a=0; b=3;
while  norm(grad (x_result(k) , y_result(k)))>= epsilon

    essianos=essianosf(x_result(k),y_result(k));
    idiotimes = eig(essianos);

    if min(idiotimes) < 0
        fprintf("Δεν είναι θετικά ορισμένος\n" );
        return;
    end

    d= -inv(essianos)*(grad(x_result(k),y_result(k)));
    syms g;
    h =  f(x_result(k) +g*d(1,1) , y_result(k) +g*d(2,1));
    paragogos=diff(h,g);
    g = der_bis_2(paragogos,l,a,b);
    x_result(k+1) = x_result(k) + g*d(1,1);
    y_result(k+1) = y_result(k) + g*d(2,1);
    k=k+1;
    
end