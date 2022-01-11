function [x,it]=newton(fun,der,x0,tol)
%
% [x,it]=newton(fun,der,x0,tol)
%
% Aplica el método de Newton para determinar
% las raíces de una función 'fun'.
% El método consiste en obtener el corte de la recta
% tangente a la curva en el punto 'x0' con el eje de abscisas.
%
fx0=feval(fun,x0);  % Evaluamos el punto 'x0' en la función 'fun'.
dx0=feval(der,x0);  % Evaluamos el punto 'x0' en la derivada 'der' de la función.
x=x0-(fx0./dx0);    % Punto de corte de la tangente con eje x.
it=1;
fprintf(1,'\n iter=%i  punto x(n)=%f  punto x(n+1)=%f',it,x0,x)
while abs(x-x0)>=tol
    x0=x;
    fx0=feval(fun,x0);
    dx0=feval(der,x0);
    x=x0-(fx0./dx0);
    it=it+1;
    fprintf(1,'\n iter=%i  punto x(n)=%f  punto x(n+1)=%f',it,x0,x)
end
