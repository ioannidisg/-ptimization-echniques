clc

x=[-5:0.15:5];  % x = linspace(-10, 10, size);
y=[-5:0.15:5];  % y = linspace(-10, 10, size);

[X,Y] =meshgrid(x,y);

Z= X.^3 .* exp(-X.^2-Y.^4);
figure(1);
surfc(X,Y,Z);

% figure(2);
% f=@(x,y) x^3 * exp(-x^2-y^4);
% fsurf(f);

Z= X.^2 + X.*Y +Y.^2 -X +Y;
figure(2);
surfc(X,Y,Z);

