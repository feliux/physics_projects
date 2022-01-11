function total=trocea(fun,met,inter,div,dib)
%
% total=trocea(fun,met,inter,div,dib)
%
% Trocea un intervalo en el número de tramos indicados por 'div'
% y llama a la función 'integra' para que integre en cada intervalo.
% las variables de entrada son la mismas que las de 'integra', salvo 'div' que
% representa el número de subintervalos en que se desea dividir el
% intervalo de integración.
%
tramos=inter(1):(inter(2)-inter(1))/div:inter(2);
total=0;
if nargin==5
    hold on
end
for i=1:size(tramos,2)-1
    int=integra(fun,met,[tramos(i) tramos(i+1)],dib);
    total=total+int;
end
hold off
