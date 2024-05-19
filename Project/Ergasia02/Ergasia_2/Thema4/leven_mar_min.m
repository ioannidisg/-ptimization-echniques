function [x_result,y_result,k] = leven_mar_min (epsilon,x,y,f,grad,essianosf)

k=1;
x_result = []; 
y_result = [];

x_result(k)=x;
y_result(k)=y;
l= epsilon; % να το αλλαξω μετα σε ε/2
a=0; b=3;


while  norm(grad (x_result(k) , y_result(k)))>= epsilon

    essianos=essianosf(x_result(k),y_result(k));
    m=abs(max(eig(essianos))); % βιβλίο σελίδα 139 (βήμα 2)
     m = m +m/2;
   
    d= -inv(essianos + m*eye(2))*(grad(x_result(k),y_result(k))); %(βήμα 3)
    
    % (βημα 4)
    syms g;
    h =  f(x_result(k) +g*d(1,1) , y_result(k) +g*d(2,1));
    paragogos=diff(h,g);
    g = der_bis_2(paragogos,l,a,b);
    
    if kritiria(g,d,k,x_result,y_result,f,grad)
        x_result(k+1) = x_result(k) + g*d(1,1); % (βημα 5 )
        y_result(k+1) = y_result(k) + g*d(2,1);
    else
        fprintf("ΔΕΝ πληρούνται τα κρητίρια.\n")
        break;
    end
k=k+1;
end
