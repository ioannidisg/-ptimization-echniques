function [x_result, y_result, k] = megisti_kathodos(epsilon,x,y,g,grad)

k=1;
x_result = []; 
y_result = [];

x_result(k)=x;
y_result(k)=y;
max =10000;

while  norm(grad (x_result(k) , y_result(k)))>= epsilon %&& k<max 

    d=-grad(x_result(k),y_result(k));
    x_result(k+1) = x_result(k) + g*d(1,1);
    y_result(k+1) = y_result(k) + g*d(2,1);
    k=k+1;

    if(k>max)
        fprintf("Δεν συγκλίνει ");
        break;
    end

end


