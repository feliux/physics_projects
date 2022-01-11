function [L,U,D,x]=jacobi1(A,b,x0)
%
% [L,U,D,x]=jacobi1(A,b,x0)
%
% Aplica UNA iteración del método iterativo de Jacobi
% al sistema de ecuaciones A*x=b, usando x0 como valor
% de la aproximación a la solución en la iteración anterior.
%
% NOTA: para utilizar con jacobi.m
%
% Valores de entrada: 
% A matriz con los coeficientes del sistema.
% b vector COLUMNA con los términos independientes del sistema.
% x0 vector COLUMNA con la aproximación a la solución en la iteración anterior.
% Valores de salida: 
% x nueva aproximación a la solución.
% Matrices: para evaluar la convergencia de la función jacobi.m
%
L=A-triu(A);
U=A-tril(A);
D=diag(diag(A));
x=inv(D)*(b-(L+U)*x0);
