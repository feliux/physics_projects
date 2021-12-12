function atractorpickover(x1,y1,h,iter)
%
% atractorpickover(x1,y1,h,iter)
%
% Dibuja el atractor de Pickover.
% Variar parámetros x1, y1, h para ver distintas formas.
%
% Recomendable un gran número de iteracioines: 1000 - 10000.
% Ejemplo: h=-0.02
%
for i=1:iter
    xn=x1-h.*sin(y1+tan(3.*y1));  % Ecuaciones
    yn=y1-h.*sin(x1+tan(3.*x1));  % Ecuaciones
    x1=xn;
    y1=yn;
    plot(xn,yn,'k','markersize',2)
    pause(0.0001)
    hold on
end
