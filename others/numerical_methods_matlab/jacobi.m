function [x,it]=jacobi(A,b,x0,tol)
%
% [x,it]=jacobi(A,b,x0,tol)
%
% Resuelve un sistema de ecuaciones lineales por el
% método iterativo de Jacobi hasta conseguir un error
% inferior a la tolerancia 'tol' y partiendo de un valor
% 'x0' como aproximación inicial.
%
% NOTA: hace uso de la función [x,it]=jacobi1(A,b,x0,tol)
%
% Además, calcula el radio espectral para ver si el método converge.
%
[L,U,D,x]=jacobi1(A,b,x0); % Primera solución usando jacobi1.
it=0;            % Contador de iteración.
H=inv(D)*(L+U);  % Matriz del radio espectral.
e=eig(H);        % Valores propios de H.
if max(abs(e))>1   % El radio espectral es mayor que 1. Método no converge.
    disp('El método no converge')
    x=[];
else
   while norm(x0-x)>tol
    x0=x;          % La nueva aprox. inicial es la antigua 'x'.
    [L,U,D,x]=jacobi1(A,b,x0); % Calculamos una nueva solución 'x'.
    it=it+1;
    end
end
    
    
