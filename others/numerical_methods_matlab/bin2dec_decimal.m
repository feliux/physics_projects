function num=bin2dec_decimal(x)
%
% num=bin2dec_decimal(x)
%
% Dado un número en binario (vector fraccionario) devuelve su valor en decimal.
% Ejemplo: x = [0 0 1] -> num=0.125
%
l1=length(x);
y=[]; 
for i=1:l1
    y(i)=x(i)*2.^(-i);  % Fórmula cambio bin2dec
end
num=sum(y);
