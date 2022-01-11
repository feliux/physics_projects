function x=sp(A,b)
%
% x=sp(A,b)
%
% Resuelve un sistema de ecuaciones triangular inferior
% por el método de sustituciones progresivas.
% A es la matriz asociada al sistema y
% b es un vector columna con los términos independientes.
%
x(1)=b(1)./A(1,1);   %Valor de x(1).
n=length(A);
for i=2:n
    x(i)=b(i);   % Guardamos b(i) en x(i). Luego reescribiremos x(i).
    for j=1:i-1  
        x(i)=x(i)-A(i,j).*x(j);  % Despejamos y reescribimos x(i) sin dividir por su coeficiente.
    end
    x(i)=x(i)./A(i,i);  % Dividimos por su respectivo coeficiente.
end
x=x';  % Trasponemos el vector fila solución (para obtener vector columna).
