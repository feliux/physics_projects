function [x,it]=jacobi_amor(A,b,x0,w,tol)
%
% [x,it]=jacobi_amor(A,b,x0,w,tol)
%
% Resuelve un sistema de ecuaciones lineales por el
% método iterativo de Jacobi amortiguado hasta conseguir un error
% inferior a la tolerancia 'tol' y partiendo de un valor
% 'x0' como aproximación inicial. 
%
% NOTA: hace uso de la función jacobi2.m
%
% Valores de entrada: 
% A = matriz con los coeficientes del sistema.
% b = vector COLUMNA con los términos independientes del sistema.
% x0 = vector COLUMNA con la aproximación a la solución en la iteración anterior.
% w = factor de relajamiento (amortiguamiento).
% tol = tolerancia.
%
% Valores de salida: 
% x = nueva aproximación a la solución.
% it = iteraciones
%
x=jacobi2(A,b,x0,w);
it=0;   % Contador de iteración.
while norm(x0-x)>tol
    x0=x; % La nueva aprox. inicial es la antigua 'x'.
    x=jacobi2(A,b,x0,w); % Calculamos una nueva solución 'x'.
    it=it+1;
end
