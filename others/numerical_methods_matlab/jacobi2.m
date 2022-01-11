function x=jacobi2(A,b,x0,w)
%
% x=jacobi2(A,b,x0,w)
%
% Resuelve un sistema de ec. lineales matricialmente usando Jacobi AMORTIGUADO.
% Aplica UNA iteración del método iterativo de Jacobi
% al sistema de ecuaciones A*x=b, usando x0 como valor
% de la aproximación a la solución en la iteración anterior.
%
% Valores de entrada: 
% A = matriz con los coeficientes del sistema.
% b = vector COLUMNA con los términos independientes del sistema.
% x0 = vector COLUMNA con la aproximación a la solución en la iteración anterior.
% w = factor de relajamiento (amortiguamiento).
%
% Valores de salida: 
% x = nueva aproximación a la solución.
%
L=A-triu(A);
U=A-tril(A);
D=diag(diag(A));
n=size(A,1);
I=eye(n);
f=w*inv(D)*b;
H=-w*inv(D)*(L+U)+(1-w)*I;
x=f+H*x0;
