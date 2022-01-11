function [dmax,dmin,sup,inf]=errorint(x,x1,der)
%
% [dmax,dmin,sup,inf]=errorint(x,x1,der)
%
% Calcula el error de interpolación.
%
% Métodos habituales:
% Lagrange, diferencias divididas, Newton-Gregory
%
% Variables de entrada:
% x = conjunto de datos.
% x1 = pto objetivo.
% der = función derivada (insertar manualmente, entre comillas).
%
% Variables de salida:
% dmax = valor máximo de la derivada
% dmin = valor mínimo de la derivada
% sup = cota superior del error.
% inf = cota inferior del error.
%
n=length(x);
p=1;  % Inicializamos productorio.
for i=1:n
    p=p.*(x1-x(i)); % Multiplicamos diferencias.
end
p=p./factorial(n);
d=feval(der,x);    % Evaluamos los datos en la derivada
dmax=feval(der,max(x));  % Derivada con x=max
dmin=feval(der,min(x));  % Derivada con x=min
sup=max(p.*d);    
inf=min(p.*d);    
