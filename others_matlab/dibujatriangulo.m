function dibujatriangulo(x,y)
%Función que dibuja un triángulo dados 3 puntos A,B,C de componentes (x,y)
%La función recibe un vector(x,y) con 3 vértices (componentes)
%x=[x1,x2,x3], y=[y1,y2,y3])
%x0=linspace(longitud del vector x); r=recta que une A(x1,y1) con
%C(x3,y3)
if x(1)==y(1)==x(2)==y(2)
    disp('No se puede formar triángulo. Coincidencia de puntos A=B')
elseif x(1)==y(1)==x(3)==y(3)
    disp('No se puede formar triángulo. Coincidencia de puntos A=C')
elseif x(2)==y(2)==x(3)==y(3)
    disp('No se puede formar triángulo. Coincidencia de puntos B=C')
else 
    plot(x,y,'r');
    hold on;
    x0=linspace(x(1),x(3));
    r=(((y(3)-y(1)).*(x0-x(1)))/(x(3)-x(1)))+y(1);
    plot(x0,r,'r');
    text(x(1),y(1),'A');
    text(x(2),y(2),'B');
    text(x(3),y(3),'C');
    axis equal;
end

    

