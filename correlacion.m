clc
clear all
close all
warning off all
clear variables
%secuencias
x = [0, 0, 2, -1, 3, 7, 1, 2, -3, 0, 0];
y = [0, 0, 1, -1, 2, -2, 4, 1, -2, 5, 0, 0];

correlacionRes = correlacionCruzada(x,y,2);

disp(correlacionRes)





function resultado = correlacionCruzada(x,y,rango)
    resultado = zeros(1,(rango*2)+1)
    tamX = length(x);
    tamY = length(y);
    for i = 0: rango
        sumaPos = 0;
        sumaNeg = 0;
        for n = 1:tamX
            if (i == 0)
                sumaPos = x(n)*y(n-i) + sumaPos;
            else
                if (n-i > 0)
                    sumaPos = x(n)*y(n-i) + sumaPos;
                end
                if (n+i < tamY)
                    sumaNeg = x(n)*y(n+i) + sumaNeg;
                end
            end
        end
        
        disp(i)
        if (i == 0)
            resultado(rango+1) = sumaPos;
        else
            resultado(rango+1+i) = sumaPos;
            resultado(rango+1-i) = sumaNeg;
        end
    end
end