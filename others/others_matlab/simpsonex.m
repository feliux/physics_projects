function [I]=simpsonex(x,y)
n=length(x);      %Tenemos n puntos.
h=x(2)-x(1);      %Distancia 'h'.
i=1;
Is=[];
for i=1:2:n-1 %El inicio de Simpson varía de tres en tres ptos.
    Is(i)=h.*(y(i)+4.*y(i+1)+y(i+2))./3; %Integramos en intervalos de tres ptos.
end
I=sum(Is);  %Sumamos todas las integrales.
