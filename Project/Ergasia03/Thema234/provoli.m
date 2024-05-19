    function [xbar,ybar] = provoli(x,y)

if x<=-10
    xbar=-10;
elseif x>=5
    xbar=5;
else
    xbar=x;
end

if y<=-8
    ybar=-8;
elseif y>=12
    ybar=12;
else
    ybar=y;
end

