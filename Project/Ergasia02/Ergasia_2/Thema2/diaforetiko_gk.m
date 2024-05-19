close all;
clear;
clc;

epsilon = 0.001;

syms x_s  y_s;
f(x_s,y_s)= x_s^3 * exp(-x_s^2-y_s^4);
grad = gradient(f , [x_s ,y_s]);

x_1 = 1 ;
y_1 = 1;

index =0 ;
for gamma = linspace(0.2,1,20)
    index = index + 1;
    [~,~,cnt(index),g(index)]=megisti_kathodos(epsilon,x_1,y_1,gamma,grad);
    
   
end
    plot(g,cnt,'*r');
    xlabel("γ");
    ylabel("Φορές εκτέλεσης")