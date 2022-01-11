function x = newtonraphsonpolinomio(a,maxiter,tol)
%
% x = newtonraphsonpolinomio(a,maxiter,tol)
%
% Obtención de raices reales e imaginarias (complejos) de un polinomio
% p(x)= a(n)x^n+a(n-1)x^(n-1)+....a(1)x+(a0)
%
% Por el teorema fundamental del álgebra, sabemos que un polinomio de
% grado n tiene exactamente n raíces complejas, contando sus
% multiplicidades.
%   
% Para la obtención de estas raíces, empleamos el algoritmo de
% Newton-Raphson.
% z(k+1) = z(k)-p(z(k))/p'(z(k))
%  
% NOTA: Para hallar los valores del polinomio y de su derivada utilizamos el
% algoritmo de Ruffini-Horner: función ruffinihorner.m
%
% El arranque del algoritmo de Newton-Raphson se hace para cada raíz
% del polinomio en una aproximación inicial z0 elegida de uno de los
% términos del vector v = (1+i, i, -1+i, -1, -1-i, -i, 1-i, 1)
% Partiendo del z0 elegido, se realiza 3 iteraciones y analiza la
% convergencia o no con la aproximación inicial escogida. Si no hay
% convergencia, tomamos como aproximación inicial la siguiente
% componente del vector v.
% Cuando se produzca la convergencia con la tolerancia prevista  y que
% p(z(k+1)) sea casi 0, se almacena esta raíz en el vector solución y
% reiteramos todo el proceso con el siguiente polinomio deflacionado,
% mediante el algoritmo de Ruffini-Horner, y así sucesivamente se
% continúa deflacionando el polinomio, hasta otener las raíces
% estimadas.
% Finalmente, las raíces obtenidas serán refinadas mediante 2
% iteraciones por Newton-Raphson del polinomio origial.
%
% Variables de entrada:
% a = vector constituido por los coeficientes del polinomio p
% ordenados de mayor a menor grado
% maxiter = número máximo de iteraciones previstas
% tol = tolerancia
%
grado = length(a) - 1;
% El arranque del algoritmo de Newton-Raphson se hace para cada raíz
% del polinomio en una aproximación inicial z0 elegida de uno de los
% términos del vector v = (1+i, i, -1+i, -1, -1-i, -i, 1-i, 1)
v = [1+i i -1+i -1 -1-i -i 1-i 1];
% Polinomio auxiliar para preservar el polinomio original: 
%para evitar alteraciones cuado se llame a la función de Ruffine-Horner
paux = a;
% Mediante el siguiente bucle obtendremos la totalidad de las raíces.
for raizactual=1:grado 
    if grado == 1 
        x(raizactual) = -(a(2))/a(1); % Para grado 1 no es necesario NR.
        else
        % Tomamos el primer término del vector v como aproximación inicial
        z0 = v(1); % zk corresponde a la posición actual.
        z1 = z0;   % zk+1 corresponde a la posición siguiente.
        zm1 = 0;   % zk-1 corresponde a la posición anterior.
        iter = 0;  
        posicion = 2;  % La nueva posición del vector v es la segunda
        while iter < maxiter 
            [p, pderivada,q] = ruffinihorner(z1,a);
            zm1 = z0;
            z0 = z1;
            z1 = z0 - (p/pderivada);% Fórmula de NR
            iter = iter + 1; 
            if iter == 3
                % Comprobamos la convergencia
                if abs(z1-z0) >= abs(z0-zm1)
                    % No es convergente por tanto avanzamos una posición del vector v
                    posicion = posicion + 1;
                        if posicion <= length(v)
                            z0 = v(posicion);
                            z1 = z0;
                            zm1 = 0;
                            iter = 0; % Comienzo de las iteraciones
                            continue;
                        else
                            error('No hay otros valores posibles');
                        end
                end
            end
            % Si este proceso es convergente se cumplirá la siguiente condición
            if abs(z1 - z0)/abs(z1) < tol
                x(raizactual) = z1;
                % Empezamos a trabajar con el siguiente polinomio deflacionado
                [p, pderivada,q] = ruffinihorner(z1, a);
                a=q;
                break; 
            end
            if iter == maxiter 
            % Al llegar al máximo de ieraciones tomamos el término
            % siguiente del vector v de aproximaciones iniciales
                posicion = posicion + 1;
                if posicion <= length(v)
                    z0 = v(posicion);
                    z1 = z0;
                    zm1 = 0;
                    iter = 0;
                    continue; % Pasamos a la siguiente iteración o posición del vector v
                    else
                        error('No hay más posibles valores');
                end
            end
        end
    end
end
% Finalmente, las raíces obtenidas serán refinadas mediante 2
% iteraciones por Newton-Raphson del polinomio origial, tomamos cada 
% una de ellas como aproximación inicial, a partir de la segunda.
for raizactual=2:grado
    z0 = x(raizactual);
    z1 = z0;
    for k=1:2
        [p, pderivada,q] = ruffinihorner(z1,paux);
        z0 = z1;
        z1 = z0 - (p/pderivada); % Fórmula de NR.
        if abs(z1 - z0)/abs(z1) < tol
            break; % Si el punto elegido cumple con la tolerancia, mo
                % prueba con más puntos y termina la ejecución del bucle
                % for
        end
    end
    x(raizactual) = z1;
end
end
