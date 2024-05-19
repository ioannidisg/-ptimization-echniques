function  [x_result,y_result,k] = megisti_kathodos_armijo(epsilon,x,y,f,grad)

k=1;
x_result = []; 
y_result = [];

x_result(k)=x;
y_result(k)=y;


while  norm(grad (x_result(k) , y_result(k)))>= epsilon
    
    d = -grad(x_result(k),y_result(k));
    g = armijo(x_result,y_result,k,f,grad);
    x_result(k+1) = x_result(k) + g*d(1,1);
    y_result(k+1) = y_result(k) + g*d(2,1);
    k=k+1;

end