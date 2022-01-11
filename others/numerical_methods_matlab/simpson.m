function [I,h]=simpson(fun,a,b,n)
%
% [I,h]=simpson(fun,a,b,n)
%
% Emplea el método de Simpson 1/3 para calcular la integral de una
% función 'fun' en el intervalo [a,b] dividido en 'n' subintervalos de
% longitud 'h'.
% Aplica Simpson cada 2 subintervalos -> cada tres ptos.
% Si n=impar aplica la fórmula del trapecio sobre el último subintervalo.
%
x=a:(b-a)./n:b;   % Dividimos el intervalo [a,b] en 'n' intervalos.
h=x(2)-x(1);      % Distancia 'h'.
y=feval(fun,x);   % Evaluamos todos los puntos 'x'.
i=1;
Is=[];
if rem(n,2)==0    % Aplicamos Simpson para n=par.
    for i=1:2:n-1 % El inicio de Simpson varía de tres en tres ptos.
        Is(i)=h.*(y(i)+4.*y(i+1)+y(i+2))./3; % Integramos en intervalos de tres ptos.
    end
    I=sum(Is);  % Sumamos todas las integrales.
    disp('asi')
else            % Aplicamos método del trapecio.
    for i=1:2:n-2 % Aplicamos Simpson.
        Is(i)=h.*(y(i)+4.*y(i+1)+y(i+2))./3;
    end
    It=h.*(y(n)+y(n+1))./2;  % Calculamos 'trapecio' último pto.
    I=It+sum(Is);  % Sumamos integrales Simpson + trapecio.
end
        
    

