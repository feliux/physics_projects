function [x,xp,eabs,erel]=algoritmoinest(x0,x1)
%
% [x,xp,eabs,erel]=algoritmoinest(x0,x1)
%
% Ejemplo de algoritmo inestable.
% Muestra en pantalla el error absoluto y relativo.
%
x=[];
xp=[];
x(1)=x0;
x(2)=x1;
xp(1)=x0;
xp(2)=xp(1)./3;
eabs(1)=0;
eabs(2)=0;
erel(1)=0;
erel(2)=0;
for i=3:23
    x(i)=(13.*x(i-1)./3)-(4.*x(i-2)./3);
    xp(i)=xp(i-1)./3;
    eabs(i)=abs(x(i)-xp(i));
    erel(i)=abs(x(i)-xp(i))./xp(i);
end
