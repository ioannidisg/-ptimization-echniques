function [x_result,y_result,k] = newton_armijo(epsilon,x,y,f,grad,essianosf)

k=1;
x_result = []; 
y_result = [];

x_result(k)=x;
y_result(k)=y;


while  norm(grad (x_result(k) , y_result(k)))>= epsilon

    essianos=essianosf(x_result(k),y_result(k));
    idiotimes = eig(essianos);

    if min(idiotimes) < 0
        fprintf("Δεν είναι θετικά ορισμένος\n" );
        return;
    end

    d= -inv(essianos)*(grad(x_result(k),y_result(k)));
    g = armijo(x_result,y_result,k,f,grad);
    x_result(k+1) = x_result(k) + g*d(1,1);
    y_result(k+1) = y_result(k) + g*d(2,1);
    k=k+1;

end