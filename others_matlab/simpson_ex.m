function [I,h]=simpson_ex(fun,a,b,n)
x=a:(b-a)./n:b;   %Dividimos el intervalo [a,b] en 'n' intervalos.
h=x(2)-x(1);      %Distancia 'h'.
y=feval(fun,x);   %Evaluamos todos los puntos 'x'.
i=1;
Is=[];
    for i=1:2:n-1 %El inicio de Simpson varía de tres en tres ptos.
        Is(i)=h.*(y(i)+4.*y(i+1)+y(i+2))./3; %Integramos en intervalos de tres ptos.
    end
    I=sum(Is);  %Sumamos todas las integrales.
    disp('asi')
