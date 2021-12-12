function atractormuneco(x1,y1,iter)
%
% atractormuneco(x1,y1,iter)
%
% Ejemplo de atractor caótico con forma de muñeco.
% Partiendo de x1=-0.01 y=-0.01 se forma un muñeco con cabeza, brazos y piernas.
%
% Recomendable un gran número de iteracioines: +10000.
%
% Puede demostrarse rigurosamente que para cada punto de una órbita existe
% otro dentro de esa misma órbita tan cerca del anterior como se desee.
%
for i=1:iter
    xn=1-y1+abs(x1); % Ecuación iterativa.
    yn=x1;           % Ecuación iterativa.
    x1=xn;
    y1=yn;
    hold on
    plot(xn,yn,'k','markersize',2)
    pause(0.00001)
end
