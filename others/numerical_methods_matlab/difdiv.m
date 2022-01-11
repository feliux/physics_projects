function a=difdiv(x,y)
%
% a=difdiv(x,y)
% 
% Calcula los coeficientes del polinomio de diferencias divididas que
% interpola los datos contenidos en los vectores 'x' e 'y'. 
% Da como resultado un vector fila 'a' con los coeficientes de dicho
% polinomio: a=[c0 c1 ... cn]
%
n=length(x);
% Iniciaamos el vector de coeficientes con las diferencias de orden 0, es decir los valores de 'y'.
a=y;
% Montamos un bucle, si tenemos n datos debemos calcular n iferencias, como ya tenenos la primera, iniciamos el bucle en 2.
for j=2:n
    % En cada iteración calculamos las diferencias de un orden superior,
    % como solo nos vale la primera diferencia de cada orden empezamos el
    % bucle interior en el valor del exterior j.
    for i=j:n
        a(i)=(a(i)-y(i-1))/(x(i)-x(i-j+1));
    end
    % Volvemos a copiar en 'y' las diferencias obtenidas para emplearlas en la siguiente iteración.
    y=a;
end
