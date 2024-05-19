clc

x=[-15:0.2:15];  % x = linspace(-10, 10, size);
y=[-15:0.2:15];  % y = linspace(-10, 10, size);

[X,Y] =meshgrid(x,y);

Z= (1/3)*X.^2 + 3*Y.^2;
figure(1);
surfc(X,Y,Z);
shading interp;
% figure(2);
% f=@(x,y) x^3 * exp(-x^2-y^4);
% fsurf(f);


