function [r,it]=newtonaitken(fun,der,a,tol)
%
% [r,it]=newtonaitken(fun,der,a,tol)
%
% Aplica el método de Newton con una aceleración Aitken para determinar
% las raíces de una función 'fun'.
% El método consiste en obtener el corte de la recta
% tangente a la curva en el punto 'x0' con el eje de abscisas.
%
it=1;
x0(it)=a;  % Almacenamos en un vector para calcular la sucesión de Aitken.
fx0=feval(fun,x0(it));  % Evaluamos el punto 'x0' en la función 'fun'.
dx0=feval(der,x0(it));  % Evaluamos el punto 'x0' en la derivada 'der' de la función.
x(it)=x0(it)-(fx0./dx0);    % Punto de corte de la tangente con eje x.
disp('iteración   x(n)         x(n+1)              error      aitken')
fprintf(1,'\n %i       %f     %f          %f',it,x0(it),x(it),abs(x(it)-x0(it)))
aitken(1)=0;
aitken(2)=a;
erroraitken(it)=0;
while abs(x(it)-x0(it))>=tol
    it=it+1;
    x0(it)=x(it-1);  % Se puede quitar y evaluar fx0=feval(fun,x(it-1));
    fx0=feval(fun,x0(it));
    dx0=feval(der,x0(it));
    x(it)=x0(it)-(fx0./dx0);
    if it>=3  %&& abs(aitken(it)-aitken(it-1))>=tol
        aitken(it)=x(it-2) -((x(it-1)-x(it-2)).^2)./((x(it)-2.*x(it-1)+x(it-2))); % Convergencia Aitken
    end
    fprintf(1,'\n %i       %f     %f          %f         %f',it,x0(it),x(it),abs(x(it)-x0(it)),aitken(it))
end
r=[x(it) aitken(it)];
%
%Calculamos errores de Newton...
%
enewton=[];
for i=1:1:it
    enewton(i)=abs(x(i)-r(1));
    plot(i,log(enewton(i)),'*k')
    hold on, grid on
    xlabel('Iteración'),ylabel('Logaritmo(error)'),title('Error método Newton')
end
%
%Calculamos Orden de convergencia...
%
pnew=[];
for k=1:1:it-2
    pnew(k)=log(enewton(k+2)./enewton(k+1))./log(enewton(k+1)./enewton(k));
end
%
%Calculamos errores de Newton-Aitken...
%
eaitken=[];
for j=3:1:it
    eaitken(j)=abs((aitken(j)-r(2)));
    figure(2),
    plot(j,log(eaitken(j)),'*k')
    hold on, grid on
    xlabel('Iteración'),ylabel('Logaritmo(error)'),title('Error método Newton-Aitken')
end
%
%Calculamos orden de convergencia...
%
pa=[];
for l=3:1:it-2
    pa(l)=log(eaitken(l+2)./eaitken(l+1))./log(eaitken(l+1)./eaitken(l));
end
%
% Mostramos datos...
%
fprintf(1,'\n')
disp('Valor del orden de convergencia para el método de Newton')
pnew
disp('Valor del orden de convergencia para el método de Newton-Aitken')
pa
