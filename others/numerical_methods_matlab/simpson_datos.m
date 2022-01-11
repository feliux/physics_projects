function [I]=simpson_datos(x,y)
%
% [I]=simpson(x,y)
%
% Emplea el método de Simpson 1/3 para calcular la integral
% de un conjunto de datos (x,y).
% Aplica Simpson cada 2 subintervalos -> cada tres ptos.
% El vector 'x' (conjunto puntos) debe estar equiespaciado.
% Si nº datos=impar aplica la fórmula del trapecio sobre el último subintervalo.
% 
n=length(x);      % Tenemos n puntos.
h=x(2)-x(1);      % Distancia 'h'.
i=1;
Is=[];
if rem(n-1,2)==0    % Aplicamos Simpson para n=par. n-1 intervalos.
    for i=1:2:n-1   % El inicio de Simpson varía de tres en tres ptos.
        Is(i)=h.*(y(i)+4.*y(i+1)+y(i+2))./3; % Integramos en intervalos de tres ptos.
    end
    I=sum(Is);    % Sumamos todas las integrales.
else              % Aplicamos método del trapecio.
    for i=1:2:n-2 % Aplicamos Simpson.
        Is(i)=h.*(y(i)+4.*y(i+1)+y(i+2))./3;
    end
    It=h.*(y(n)+y(n-1))./2;  % Calculamos 'trapecio' último pto.
    I=It+sum(Is);  % Sumamos integrales Simpson + trapecio.
end
