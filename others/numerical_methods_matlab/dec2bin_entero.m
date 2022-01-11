function b=dec2bin_entero(m)
%
% b=dec2bin_entero(m)
%
% Pasar un número decimal entero a binario.
% Si el número no es entero, devuelve b1 como vector vacío: b1=[]
%
if m==0
    b=0;
elseif rem(m,fix(m))==0
    i=1;    % Para formar una matriz.
    b(i)=rem(m,2); % b(i) para representar b en forma lineal (matricial).
    while m>=2
        i=i+1; % Para formar una matriz [b(1) b(2) ...]
        m=m/2;
        p=fix(m); % Parte entera de m.
        b(i)=rem(p,2);
    end
    b=fliplr(b); % Invertir el orden de b.
else
    b=[];
end

