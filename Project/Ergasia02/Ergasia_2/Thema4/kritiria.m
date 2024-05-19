function [result] = kritiria(g,d,k,x_result,y_result, f ,grad)

result = false;

x_result(k+1) = x_result(k) + g*d(1,1);
y_result(k+1) = y_result(k) + g*d(2,1);

s1 = d'*grad(x_result(k+1),y_result(k+1));
s2 = d'*grad(x_result(k),y_result(k));


    for b = linspace(0.1,1,20)
        if s1 > b * s2
            temp1 = f(x_result(k+1),y_result(k+1));
            temp2 = f(x_result(k),y_result(k));
            temp3 = g*d'*grad(x_result(k+1),y_result(k+1))   ;

           

            for a = linspace(0.00001,b,20)
                if temp1 <= temp2 + a*temp3
                    result = true;
                    break;
                end
            end
            break;
        end
    end

            