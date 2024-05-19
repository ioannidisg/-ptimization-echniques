clear ;
close all;
clc;

syms x_s  y_s;
f(x_s,y_s)= x_s^3 * exp(-x_s^2-y_s^4);
grad = gradient(f , [x_s ,y_s]);

x_values= -3:0.1:3 ; 
    y_values= -3:0.1:3 ; 

f_values=zeros(length(x_values),length(y_values));

index_x = 0;
    
for i=x_values
    index_x = index_x+1;
    index_y =1;
    for j=y_values
        f_values(index_y,index_x) = f(i,j);
        index_y=index_y+1;
    end
end


points_x=[0 -1 1];
points_y=[0 -1 1];
epsilon=0.001;
g=0.5;

%Με την μέθοδο μέγιστης καθόδου με σταθερό βήμα γκ

for i=1:3

    [x,y,k]= megisti_kathodos(epsilon,points_x(i),points_y(i),g,grad);
    figure(i);
    contourf(x_values, y_values, f_values)
    hold on
    plot(x,y,'-*k');
    min = double(f(x(k),y(k)));
    if k>1
        epanalipsis = k -1;
    else
        epanalipsis=1;  % βαζω κ=2 ωστε το κ-1 που θα τυπώσει τις επαναληψεις αν το κ ειναι 1 να είναι 1 επανάληψη
    end
    fprintf ("Ελάχιστη τιμή στο σημείο (" + x(k) + "," + y(k) + ") με τιμή f(x,y)= " + min + " σε " +epanalipsis+" επαναλήψεις\n");
end

% Με την μέθοδο μέγιστης καθόδου με βήμα γκ ώστε να ελαχιστοποιεί 
% την f(xk+γκdk)

for i=1:3

    [x,y,k]= megisti_kathodos_min(epsilon,points_x(i),points_y(i),f,grad);
    figure(i+3);
    contourf(x_values, y_values, f_values)
    hold on
    plot(x,y,'-*k');
    min = double(f(x(k),y(k)));
     if k>1
        epanalipsis = k -1;
    else
        epanalipsis=1;  % βαζω κ=2 ωστε το κ-1 που θα τυπώσει τις επαναληψεις αν το κ ειναι 1 να είναι 1 επανάληψη
    end
    fprintf ("Ελάχιστη τιμή στο σημείο (" + x(k) + "," + y(k) + ") με τιμή f(x,y)= " + min + " σε " +epanalipsis+" επαναλήψεις\n");
end

for i=1:3

    [x,y,k]= megisti_kathodos_armijo(epsilon,points_x(i),points_y(i),f,grad);
    figure(i+6);
    contourf(x_values, y_values, f_values)
    hold on
    plot(x,y,'-*k');
    min = double(f(x(k),y(k)));
    if k>1
        epanalipsis = k -1;
    else
        epanalipsis=1;  % βαζω κ=2 ωστε το κ-1 που θα τυπώσει τις επαναληψεις αν το κ ειναι 1 να είναι 1 επανάληψη
    end
    fprintf ("Ελάχιστη τιμή στο σημείο (" + x(k) + "," + y(k) + ") με τιμή f(x,y)= " + min + " σε " +epanalipsis+" επαναλήψεις\n");
    
end


