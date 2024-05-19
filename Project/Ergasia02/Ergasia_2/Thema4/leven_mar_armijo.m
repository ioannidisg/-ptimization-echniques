function [x_result,y_result,k] = leven_mar_armijo (epsilon,x,y,f,grad,essianosf)

k=1;
x_result = []; 
y_result = [];

x_result(k)=x;
y_result(k)=y;

while  norm(grad (x_result(k) , y_result(k)))>= epsilon

    essianos=essianosf(x_result(k),y_result(k));
    m=abs(max(eig(essianos))); % βιβλίο σελίδα 139
    m = m +m/2;
    
    d= -inv(essianos + m*eye(2))*(grad(x_result(k),y_result(k))); %(βήμα 3)
    
    %(βήμα 4)
    g = armijo(x_result,y_result,k,f,grad);

    if kritiria(g,d,k,x_result,y_result,f,grad)
        x_result(k+1) = x_result(k) + g*d(1,1); %(βήμα 5)
        y_result(k+1) = y_result(k) + g*d(2,1);
    else
        fprintf("ΔΕΝ πληρούνται τα κρητίρια.\n")
        break;
    end
k=k+1;
end
