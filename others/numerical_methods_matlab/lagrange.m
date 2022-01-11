function y1=lagrange(x,y,x1)
%
% y1=lagrange(x,y,x1)
%
% Calcula el valor interpolado 'y1' correspondiente al valor 'x1'
% empleando el polinomio interpolador de Lagrange de grado n-1, obtenido a
% partir de los vectores x e y (de longitud n).
%
n=length(x);
y1=0;   % Iniciamos la variable de salida.
% Construimos el valor a partir de los polinomios de Lagrange...
for j=1:n
    lj=1; % Iniciamos el polinomio de Lagrange correspondiente al dato i.
    for i=1:j-1
        lj=lj*(x1-x(i))/(x(j)-x(i)); % Contribuciones antes del dato i.
    end
    for i=j+1:n
        lj=lj*(x1-x(i))/(x(j)-x(i));  %Contribuciones después del dato i.
    end
    y1=y1+lj*y(j); % Sumamos la contribución del polinomio de Lagrange lj.
end
