clc;
clear all ; 
clear;

f1 = @(x) (x-1)^3 + (x-4)^2*cos(x);
f2 = @(x) exp(-2*x) + (x-2)^2;
f3 = @(x) (x^2)*log(0.5*x) + sin(0.2*x)^2;

% α)Για σταθερο l
l1= 0.01;
e1=0.0001:0.0001:0.0045;
n1 = length(e1);
k1 = zeros(n1,1);
figure(1)
for i=1:3
    if i == 1
        f = f1;
    elseif i == 2 
        f = f2;
    elseif i == 3
        f = f3;
    end

    
    for j=1:n1
       [a,b,k_a(j),e(j),lamda] = fun_bisection2(f, e1(j), l1);
    end
    
    
    subplot(3,1,i);
    plot(e1,2*(k_a-1),"-r")
    title("Για την f"+ i);
    ylabel("Φορές που καλείται");
    xlabel('Aπόσταση από διχοτόμο');
end

% β)Για σταθερο e

e2=0.0001;
l2= 0.002:0.005:0.1;
n2 = length(l2);
k2 = zeros(n2,1);

figure(2)
for i=1:3
    if i == 1
        f = f1;
    elseif i == 2 
        f = f2;
    elseif i == 3
        f = f3;
    end

    for j=1:n2
       [a,b,k_b(j),e,lamda(j)] = fun_bisection2(f, e2, l2(j));
    end
    
    
    subplot(3,1,i);
    plot(l2,2*(k_b-1),"-r") 
    title("Για την f"+ i);
    ylabel("Φορές που καλείται");
    xlabel('l');
end


