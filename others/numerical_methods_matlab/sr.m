function x=sr(A,b)
%
% x=sr(A,b)
%
% Resuelve un sistema de ecuaciones triangular superior
% por el método de sustituciones regresivas.
% A es la matriz asociada al sistema y
% b es un vector columna con los términos independientes.
%
n=length(A);
for i=n:-1:1  % Empezamos bucle desde atrás. Pues sabemos el valor de x(n).
    x(i)=b(i);
    for j=n:-1:i+1
        x(i)=x(i)-A(i,j).*x(j); % Despejamos y reescribimos x(i) sin dividir por su coeficiente.
    end
    x(i)=x(i)./A(i,i);  % Dividimos por su respectivo coeficiente.
end
x=x'; % Trasponemos el vector fila solución (para obtener vector columna).
