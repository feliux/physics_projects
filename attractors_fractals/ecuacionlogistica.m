function xn=ecuacionlogistica(niter)
%
% xn=ecuacionlogistica(niter)
%
% Representación de la ecuación logística poblacional x(n+1)=C*x(n)*(1-x(n))
% Las diferentes órbitas se producen al cambiar el parámetro C.
%
% Este programa itera la ecuación logística para 600 valores diferentes de C
% commprendidos entre 1 y 4.
% Para cada valor de C se calcula una órbita de 600 valores, de los cuales
% no se representan los 100 primeros ya que la función todavía no se ha
% estabilizado.
%
% Variable de entrada:
% niter = número iteraciones para establizar la ecuación. 
% Tiene que ser mayor que 100.
%
c=1:0.005:4;                 % Evaluamos todas las ctes ecológicas 'c'.
x=linspace(0.1,1,length(c)); % Creamos vector para el porcentaje de población óptima 'x'.
h=niter-100;                 % Para representar a partir de la iteración 100.
for i=1:100                  % Para las primeras 100 iteraciones.
    yn=c.*x.*(1-x);
    x=yn;
end
for j=1:h    % Para el resto de iteraciones.
    xn=c.*x.*(1-x);
    x=xn;
    hold on
    plot(c,xn,'m.','markersize',1)
end
disp('el resultado xn es el valor de la población para la última iteración.')
title('Diagrama de bifurcación de la ecuación logística')
xlabel('Constante ecológica  C')
ylabel('Porcentaje población  X')
