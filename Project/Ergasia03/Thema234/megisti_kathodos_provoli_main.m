clear ;
close all;
clc;

syms x1_s  x2_s;
f(x1_s,x2_s)= (1/3)*x1_s^2 + 3*x2_s^2;
gradf = gradient(f , [x1_s ,x2_s]);

size=100;
x1_values= linspace(-10,5,size); 
x2_values= linspace(-8,12,size) ; 

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
    
   
    e_thema2 = 0.01;
    s_thema2= 5;
    g_thema2= 0.5;
    simio_thema2 = [5 -5];

    [x1,x2,epanalipsis]= megisti_kathodos_provoli(e_thema2,simio_thema2(1),simio_thema2(2),g_thema2,gradf,s_thema2);
    figure(1);
    contourf(x1_values, x2_values, f_values)
    hold on
    plot(x1,x2,'-*k');
    fprintf("Θεμα 2 , επαναλήψεις :" + epanalipsis + "\n");
   
    
    e_thema3 = 0.01;
    s_thema3= 15;
    g_thema3= 0.1;
    simio_thema3 = [-5 10];

    [x1,x2,epanalipsis]= megisti_kathodos_provoli(e_thema3,simio_thema3(1),simio_thema3(2),g_thema3,gradf,s_thema3);
    figure(2);
    contourf(x1_values, x2_values, f_values)
    hold on
    plot(x1,x2,'-*k');
    fprintf("Θεμα 3 , επαναλήψεις : " + epanalipsis + "\n");


    e_thema4 = 0.01;
    s_thema4= 0.1;
    g_thema4= 0.2;
    simio_thema4 = [8 -10];

    [x1,x2,epanalipsis]= megisti_kathodos_provoli(e_thema4,simio_thema4(1),simio_thema4(2),g_thema4,gradf,s_thema4);
    figure(3);
    contourf(x1_values, x2_values, f_values)
    hold on
    plot(x1,x2,'-*k');
    fprintf("Θεμα 4 , επαναλήψεις : " + epanalipsis + "\n");



