function [x_result, y_result, k] = megisti_kathodos_provoli(epsilon,x,y,g,gradf,s)

k=1;
x_result = [];  
y_result = [];

x_result(k)=x;
y_result(k)=y;
max = 3000;

while  norm(gradf (x_result(k) , y_result(k)))>= epsilon %&& k<max 
    
    if periorismoi(x_result(k),y_result(k)) == false
        [x_result(k) , y_result(k)] = provoli(x_result(k) , y_result(k)) ;
    end

    grad=gradf(x_result(k),y_result(k));

    xbar = x_result(k) - s*grad(1,1);
    ybar = y_result(k) - s*grad(2,1);
    
    [xbar , ybar] = provoli(xbar,ybar);
    
    x_result(k+1) = x_result(k) + g* (xbar - x_result(k));
    y_result(k+1) = y_result(k) + g* (ybar - y_result(k));

    k=k+1;

    if(k==max)
        fprintf("Δεν συγκλίνει. ");
        return;
    end
   
end

fprintf("Συγκλίνει. ");

