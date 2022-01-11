function [L,U,x]=crout(A,b)
%
% [L,U,x]=crout(A,b)
%
% Calcula la factorización de Crout de la matriz 'A' tal que A=L*U
% Y resuelve el sistema A*x=b.
%
% Variables de entrada:
% A = matriz.
% b = vector columna con los términos independientes.
%
[m,n]=size(A);  % Calculamos tamaño matriz 'A'.
L=zeros(n);     % Matriz ceros 'L'.
U=eye(n);       % Matriz diagonal de unos 'U'.
for i=1:n       % Primera fila de L.
    L(i,1)=A(i,1);
end
for j=2:n       % Primera columna de U. Empieza en dos porque U(1,1)=1
    U(1,j)=A(1,j)./L(1,1);
end
p=2;
while p<=n
    sum=0;
    for i=p:n
        for k=1:p-1
            sum=sum+L(i,k).*U(k,p); % Sumatorio
        end
        L(i,p)=A(i,p)-sum; % Calculamos la fila p de L.
        sum=0;
    end
    sum=0;
    if p==n      % Para no calcular la columna p=n+1 de U (pues no existe) (mejorar).
        break    % Salimos del while
    end
    for i=p+1:n  % Serán las columnas.
        for k=1:p-1
            sum=sum+L(p,k).*U(k,i); % Sumatorio.
        end
        U(p,i)=(A(p,i)-sum)./L(p,p); % Calculamos la columna i de U.
        sum=0;
    end
    p=p+1;
end
%
% Sustituciones progresivas. Ly=b para calcular vector 'y'.
%
y(1)=b(1)./L(1,1);   % Valor de x(1).
n=length(L);
for i=2:n
    y(i)=b(i);   % Guardamos b(i) en x(i). Luego reescribiremos x(i).
    for j=1:i-1  
        y(i)=y(i)-L(i,j).*y(j);  % Despejamos y reescribimos x(i) sin dividir por su coeficiente.
    end
    y(i)=y(i)./L(i,i);  % Dividimos por su respectivo coeficiente.
end
y=y';  % Trasponemos el vector fila solución (para obtener vector columna).
%
% Sustituciones regresivas. Ux=y para calcular solución 'x' al sistema previo
% Cálculo de vector intermedio 'y'.
%
n=length(U);
for i=n:-1:1  % Empezamos bucle desde atrás. Pues sabemos el valor de x(n).
    x(i)=y(i);
    for j=n:-1:i+1
        x(i)=x(i)-U(i,j).*x(j); % Despejamos y reescribimos x(i) sin dividir por su coeficiente.
    end
    x(i)=x(i)./U(i,i);  % Dividimos por su respectivo coeficiente.
end
x=x';         % Trasponemos el vector fila solución (para obtener vector columna).
    
