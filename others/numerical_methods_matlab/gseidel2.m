function xs1=gseidel2(A,b,xs,w)
%
% xs1=gseidel2(A,b,xs,w)
%
% Resuelve un sistema de ec. lineales matricialmente usando Gauss-Seidel amortiguado (SOR).
% plica UNA iteración del método iterativo al sistema de ecuaciones A*x=b, usando 'xs' como valor
% de la aproximación a la solución en la iteración anterior.
%
% Valores de entrada: 
% A = matriz con los coeficientes del sistema.
% b = vector COLUMNA con los términos independientes del sistema.
% xs = vector COLUMNA con la aproximación a la solución en la iteración anterior.
% w = factor relajación (amortiguamiento).
%
% Valores de salida: 
% xs1 = nueva aproximación a la solución.
%
% NOTA: función para utilizar con gseidel_amor.m
%
L=A-triu(A);
U=A-tril(A);
D=diag(diag(A));
n=size(A,1);
I=eye(n);
f=w*inv(D+L)*b;
H=(1-w)*I-w*inv(D+L)*U;
xs1=f+H*xs;
