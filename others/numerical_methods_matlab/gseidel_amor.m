function [xs1,it]=gseidel_amor(A,b,xs,w,tol)
%
% [xs1,it]=gseidel_amor(A,b,xs,w,tol)
%
% Resuelve un sistema de ecuaciones lineales por el
% método iterativo de Gauss-Seidel amortiguado (SOR) hasta conseguir un error
% inferior a la tolerancia 'tol' y partiendo de un valor
% 'xs' como aproximación inicial. El factor de amortiguamiento del método es 'w'.
%
% NOTA: La función llama en su interior otra función llamada gseidel2.m
%
xs1=gseidel2(A,b,xs,w);
it=0;   %Contador de iteración.
while norm(xs-xs1)>tol
    xs=xs1; %La nueva aprox. inicial es la antigua 'x'.
    xs1=gseidel2(A,b,xs,w); %Calculamos una nueva solución 'x'.
    it=it+1;
end
