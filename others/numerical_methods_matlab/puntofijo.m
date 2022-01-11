function [r,it]=puntofijo(fun,tol,x0)
%
% [r,it]=puntofijo(fun,tol,x0)
%
% Aplica el método del punto fijo para determinar
% las raíces de una función 'fun'.
%
x=feval(fun,x0);  % Evaluamos el punto x.
it=0;
while abs(x-x0)>=tol  
    x0=x;   % Antigua x es nuestro nuevo punto.
    x=feval(fun,x0);  % Evaluamos nueva x.
    it=it+1;
    fprintf(1,'\n iter=%i  punto x(n)=%f  punto x(n+1)=%f  error=%f',it,x0,x,abs(x-x0))
end
r=x;
