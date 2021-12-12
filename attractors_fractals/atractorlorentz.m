function xdt=atractorlorentz(t,x,a,b,c)
% 
% xdt=atractorlorentz(t,x,a,b,c)
%
% Implementa las ecuaciones de Lorentz para luego resolverlas con ode45.
%
% Ejemplo:
% Copiar y pegar en la ventana de comandos
% [t,x]=ode45(@atractorlorentz,[t0 tf],[x1 x2 x3])
% plot3(x(:,1),x(:,2),x(:,3))
% [to tf]=[0 50]  y  [x1 x2 x3]=[0 1 0]
%
% Podemos cambiar los valores de las constantes a,b,c.
% Lorentz a=10 b=17 c=1
% Caracol a=19 b=4 c=1
%
% Lorentz:
xdt(1,1)=a.*(x(2)-x(1));
xdt(2,1)=x(1).*(b-x(3))-x(2);
xdt(3,1)=x(1).*x(2)-c.*x(3);
