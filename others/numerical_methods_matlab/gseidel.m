function [xs1,it]=gseidel(A,b,xs,tol)
%
% [xs1,it]=gseidel(A,b,xs,tol)
%
% Resuelve un sistema de ecuaciones lineales por el método iterativo de Gauss-Seidel hasta conseguir un error
% inferior a la tolerancia 'tol' y partiendo de un valor 'xs' como aproximación inicial. 
% Además, calcula el radio espectral para ver si el método converge.
%
% Valores de entrada: 
% A = matriz con los coeficientes del sistema.
% b = vector COLUMNA con los términos independientes del sistema.
% xs = vector COLUMNA con la aproximación a la solución en la iteración anterior.
%
% Valores de salida: 
% xs1 = nueva aproximación a la solución.
% it = iteraciones.
%
% NOTA: La función llama en su interior otra función llamada gseidel1.m
%
[H,xs1]=gseidel1(A,b,xs);
it=0;
e=eig(H);
if max(abs(e))>1
    disp('El método no converge')
    xs1=[];
else
    while norm(xs-xs1)>tol
    xs=xs1;
    [H,xs1]=gseidel1(A,b,xs);
    it=it+1;
    end
end
