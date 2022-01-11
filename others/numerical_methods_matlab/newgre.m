function [a,y1]=newgre(x,y,x1)
%
% [a,y1]=newgre(x,y,x1)
%
% Calcula los coeficientes del polinomio de Newton-Gregory 
% que interpola los datos contenidos en los vectores x e y. 
% Da como resultado un vector fila 'a' con los coeficientes, si se le dan
% además un punto o vector de puntos calcula los valores que toma el
% polinomio en dichos puntos.
%
n=length(x);
% inicializamos el vector de coeficientes con las diferencias de orden 0, es
% decir los valores de y.
a=y;
h=x(2)-x(1);
% Montamos un bucle, si tenemos n datos debemos calcular n
% diferencias, como ya tenenos la primera (que en realidad no es una diferencia 
% sino el valor de y), iniciamos el bucle en 2...
for j=2:n
    % en cada iteración calculamos las diferencias de un orden superior,
    % como solo nos vale la primera diferencia de cada orden empezamos el
    % bucle interior en el valor del exterior j.
    for i=j:n
        % ahora basta dividir en todos los casos por la distancia h
        % multiplicada por el orden de la diferencia.
        a(i)=(a(i)-y(i-1))/((j-1)*h);
    end
    % volvemos a copiar en y las diferencias obtenidas para emplearlas en la
    % siguiente iteración.
    y=a;
end
% Si nos dan los puntos donde calcular el valor del polinomio.
y1=[];
if nargin==3 % Número de inputs = 3
    % Construimos un bucle para calcular el valor del polinomio.
    y1=a(1);
    for k=1:n-1
        % Calculamos el valor del producto de los binomios que multiplican al coeficiente i.
        binprod=1;
        for j=1:k
            binprod=binprod.*(x1-x(j));
        end
        y1=y1+a(k+1)*binprod;
    end
end
