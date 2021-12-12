function [x,y,vx,vy]=dibujaMUC(r,w)
%Dibuja la trayectoria circular de una partícula conociendo
%su velocidad angular 'w' y el radio de giro 'r'. Además dibuja los
%vecotres velocidad 'vx' 'vy'.
%[x,y,vx,vy]=dibujaMUC(r,w)
t=[0:0.01:2*pi];
%Ecuaciones trayectoria y velocidad.
x=r.*cosd(w.*t);
y=r.*sind(w.*t);
vx=-r.*w.*sind(w.*t);
vy=r.*w.*cosd(w.*t);
figure(1)
plot(x,y,'k');  %Dibuja la trayectoria
hold on
quiver(x,y,vx,vy,'r');  %Dibuja vectores 'vx' 'vy'
