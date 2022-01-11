function [H,xs1]=gseidel1(A,b,xs)
%
% [H,xs1]=gseidel1(A,b,xs)
%
% Resuelve un sistema de ec. lineales matricialmente usando Gauss-Seidel.
% Aplica UNA iteración del método iterativo al sistema de ecuaciones A*x=b, usando 'xs' como valor
% de la aproximación a la solución en la iteración anterior.
%
% Valores de entrada: 
% A = matriz con los coeficientes del sistema.
% b = vector COLUMNA con los términos independientes del sistema.
% xs = vector COLUMNA con la aproximación a la solución en la iteración anterior.
%
% Valores de salida: 
% xs1 = nueva aproximación a la solución.
% H = matriz para calcular radio espectral con gseidel.m
%
% NOTA: función para utilizar con gseidel.m
%
L=A-triu(A);
U=A-tril(A);
D=diag(diag(A));
f=inv(D+L)*b;
H=-inv(D+L)*U;
xs1=f+H*xs;
