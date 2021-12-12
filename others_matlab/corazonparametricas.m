function corazonparametricas
%
%Dibuja un corazón en coordenadas cartesianas.
%Ecuaciones:
%x(t)=12.*sin(t)-4.*sin(3.*t)
%y(t)=13.*cos(t)-5.*cos(2.*t)-2.*cos(3.*t)-cos(4.*t).
%
t = linspace(-pi, pi);
x = 12.*sin(t) -4.*sin(3.*t) ;
y = 13.*cos(t) - 5.*cos(2.*t) - 2.*cos(3.*t) - cos(4.*t);
area(x,y)
set(findobj('Type','patch'),'lineStyle','none','FaceColor',[.50 .0 .0]);