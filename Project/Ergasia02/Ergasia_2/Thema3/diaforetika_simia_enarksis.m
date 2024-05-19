close all;
clear;
clc;

syms x_s  y_s;
f(x_s,y_s)= x_s^3 * exp(-x_s^2-y_s^4);
grad = gradient(f , [x_s ,y_s]);
essianosf=hessian(f , [x_s ,y_s]);

points_x=[0 -1 1];
points_y=[0 -1 1];
epsilon=0.001;
g=0.5;

figure(1);
for i= 1:3
    
    subplot (3,1,i)

    if i==1
        [x,y,k] = newton(epsilon,points_x(2),points_y(2),g,grad,essianosf);
        str = "γ σταθερό ";
    elseif i==2
        [x,y,k] = newton_min(epsilon,points_x(2),points_y(2),f,grad,essianosf);
         str = "γ min ";
    else
        [x,y,k] = newton_armijo(epsilon,points_x(2),points_y(2),f,grad,essianosf);
         str = "γ armijo ";
    end
    

    for j=1:k
        plot(j,x(j),'*r');
        hold on;
        plot(j,y(j),"ob");
    end
    
    xlim([0 25]);
    title ( str );
    xlabel('k');
    ylabel("Σημεία")
end

figure(2);
for i= 1:3
    
    subplot (3,1,i)

    if i==1
        [x,y,k] = newton(epsilon,points_x(3),points_y(3),g,grad,essianosf);
        str = "γ σταθερό ";
    elseif i==2
        [x,y,k] = newton_min(epsilon,points_x(3),points_y(3),f,grad,essianosf);
         str = "γ min ";
    else
        [x,y,k] = newton_armijo(epsilon,points_x(3),points_y(3),f,grad,essianosf);
         str = "γ armijo ";
    end
    

    for j=1:k
        plot(j,x(j),'*r');
        hold on;
        plot(j,y(j),"ob");
    end
    
    xlim([0 25]);
    title ( str );
    xlabel('k');
    ylabel("Σημεία")
end