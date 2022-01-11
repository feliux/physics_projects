function x=ieee754_to_dec(ieee)
%
% x=ieee754_to_dec(ieee)
%
% Dado un número en formato ieee754 en simple presición
%d evuelve el número convertido en decimal.
%
%
% Variable entrada:
% ieee = número en binario simple presición (32 bits). 
%
% Ejemplo:
% ieee=[[1 1 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]
% ieee754_to_dec(ieee)
% x = -5
%
expbin=ieee(1,2:9);           % Exponente desde bit 2 al 9.
exp=bin2dec_entero(expbin);   % Pasamos exponente a binario.
m1=ieee(1,10:32);             % Mantisa desde el bit 10 al 32.
m2=bin2dec_decimal(m1);       % Pasamos mantisa a decimal.
mantisa=1+m2;                 % Sumamos 1.
if ieee(1,1)==0    % Signo positivo.
    x=mantisa.*2.^(exp-127);
else               % Signo negativo.
    x=(-1).*mantisa.*2.^(exp-127);
end
