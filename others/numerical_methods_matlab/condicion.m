function condicion(A)
%
% condicion(A)
%
% Función que nos da el valor de los tres números
% de condición y el determinante de una matriz A.
%
%NOTA:
% cond(A): intervalo entre (1,inf). Cuanto más próximo a 1 mejor codicionada
% rcond(A): aproximadamente es 1/cond(A). Intervalo entre (0,1).
%
cond1=cond(A)
rcond1=rcond(A)
condest1=condest(A)
determinante=det(A)
