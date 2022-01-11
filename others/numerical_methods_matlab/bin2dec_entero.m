function d=bin2dec_entero(m)
%
% d=bin2dec_entero(m)
%
% Convierte un número en binario a su valor en decimal entero.
% Ejemplo: m=[1 0 0 1 1]
%
m1=fliplr(m);  % Invierte el orden de 'm'.
l1=length(m1);
y=[]; 
for i=l1:-1:1
    y(i)=m1(i)*2.^(i-1);  % Ecuación cálculo con binario invertido (hacia atrás).
end
d=sum(y);  % Suma elementos de 'y'.
%
%
% Otro forma...
   %l1=length(m); y=[];
   %for i=1:l1
     %y(i)=m(i)*2.^(l1-1); % Ecuación cálculo con binario sin invertir.
     %l1=l1-1;             % Disminuimos 'l1' a medida que avanza 'i'
   %end
   %d=sum(y)
