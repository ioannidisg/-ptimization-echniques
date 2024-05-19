clc;
clear all ; 
clear;
syms x;
f1 =  (x-1)^3 + (x-4)^2*cos(x);
f2 =  exp(-2*x) + (x-2)^2;
f3 =  (x^2)*log(0.5*x) + sin(0.2*x)^2;

% β)Για σταθερο e

l= 0.002:0.005:0.1;
n = length(l);
k= zeros(n,1);
lamda = zeros(n,1);


for i=1:3
    if i == 1
        f = f1;
    elseif i == 2 
        f = f2;
    elseif i == 3
        f = f3;
    end

    df=diff(f,x);

    for j=1:n
       [a,b,k(j),lamda(j)] = der_bis(df,l(j));
    end
    
    subplot(3,1,i);
    plot(l,k,"-r") 
    title("Για την f"+ i);
    ylabel("Φορές που καλείται");
    xlabel('l');
end


