clear ;
close all;
clc;

syms x1_s  x2_s;
f(x1_s,x2_s)= (1/3)*x1_s^2 + 3*x2_s^2;
grad = gradient(f , [x1_s ,x2_s]);

x1_values= -10:0.5:10 ; 
x2_values= -10:0.5:10 ; 

f_values=zeros(length(x1_values),length(x2_values));

index_x1 = 0;
    
for i=x1_values
    index_x1 = index_x1+1;
    index_x2 =1;
    for j=x2_values
        f_values(index_x2,index_x1) = f(i,j);
        index_x2=index_x2+1;
    end
end


g = [0.1 0.3 3 5];
simio = [5 3];
epsilon = 0.001;

%Με την μέθοδο μέγιστης καθόδου για τις 4 τιμες του γκ

for i=1:4
    [x1,x2,epanalipsis]= megisti_kathodos(epsilon,simio(1),simio(2),g(i),grad);
    figure(i);
    contourf(x1_values, x2_values, f_values)
    hold on
    plot(x1,x2,'-*k');
end








