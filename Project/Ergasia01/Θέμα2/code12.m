clc;
clear all ; 
clear;

f1 = @(x) (x-1)^3 + (x-4)^2*cos(x);
f2 = @(x) exp(-2*x) + (x-2)^2;
f3 = @(x) (x^2)*log(0.5*x) + sin(0.2*x)^2;

%γ) για 3 τιμες του l

for j=1:3
    if j == 1
        f = f1;
    elseif j == 2 
        f = f2;
    elseif j == 3
        f = f3;
    end

figure(j)


subplot(3,1,1)
[a,b,k] = xrisos_tomeas(f,0.0021);

for i=1:k
    plot(i,a(i),'*r')
    hold on
    plot(i,b(i),'ob')
end
title("f"+j)
xlabel('αριθμος επαναλήψεων για l=0.0021') 
ylabel('[a_k,b_k]') 

subplot(3,1,2)
[a,b,k] = xrisos_tomeas(f,0.047);

for i=1:k
    plot(i,a(i),'*r')
    hold on
    plot(i,b(i),'ob')
end
xlabel('αριθμος επαναλήψεων για l=0.0047') 
ylabel('[a_k,b_k]')  

subplot(3,1,3)  
[a,b,k] = xrisos_tomeas(f,0.097);
for i=1:k
    plot(i,a(i),'*r')
    hold on
    plot(i,b(i),'ob')
end
xlabel('αριθμος επαναλήψεων για l=0.097') 
ylabel('[a_k,b_k]') 
end