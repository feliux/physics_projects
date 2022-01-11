function [int]=simpson_mixto(fun,a,b,h)
%
%TEST 5 PREGUNTA 5
%
[s]=divide_intervalo(a,b,h);  %Dividimos el intervalo [a,b] en 'n' intervalos.
y=feval(fun,s);   %Evaluamos todos los puntos 's'.
m=length(s);
i=1;
Is=[];
It=[];
for i=1:m-1
    if rem(i,2)==1
        It(i)=h.*(y(i)+y(i+1))./2;
    else
        smedio=s(i)+(s(i+1)-s(i))./2;
        fsmedio=feval(fun,smedio);
        hs=(s(i+1)-s(i))./2;
        Is(i)=hs.*(y(i)+4.*fsmedio+y(i+1))./3;
    end
    int=sum(It)+sum(Is);
end