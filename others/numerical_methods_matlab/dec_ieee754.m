function [ieee,signo,mantisa,exp]=dec_ieee754(x)
%
% [ieee,signo,mantisa,exp]=dec_ieee754(x)
%
% Implementa la conversión al formato IEEE754 en simple precisión.
% Hace uso de las funciones dec2bin_entero(m) y dec2bin_decimal(m)
%
% Variables de salida:
% ieee = vector con el número codificado.
% signo = bit de signo en dicho formato.
% mantisa = vector mantisa en dicho formato.
% exp = corresponde al campo exponente.
%
if sign(x)==1|x==0             % Calculamos el signo y a su vez resolvemos para x=0.
    signo=0;
    mantisa=zeros(1,23);
    exp=zeros(1,8);
    ieee=[signo exp mantisa];
else
    signo=1;
end
if rem(x,fix(x))==0             % 'x' es entero? Sí.
    b=dec2bin_entero(abs(x));   % Calculamos número en binario.
    lb=length(b);
    for i=1:lb-1
    n(i)=b(i+1);                % Normalizamos.
    end
    expdec=lb-1+127;            % Exponente exceso 127. (lb-1)=las veces que movemos la coma.
    exp=dec2bin_entero(expdec); % Exponente en binario.
    z=zeros(1,23-length(n));    % Para completar la mantisa. it=1 por el break línea 27.
    mantisa=[n z];              % Mantisa.
    ieee=[signo exp mantisa];   % Resultado cuando x=entero.
elseif (x-fix(x))==x            % 'x' es fraccionario? Sí.
    b=dec2bin_decimal(abs(x));  % Calculamos número en binario
    it=1;                       % Iteración para saber las veces que movemos la coma.
    for i=1:length(b)
        if b(i)==1              % Movemos la coma...
            m=b(1,i+1:length(b));  % Creamos 'm': binario normalizado.
            break
        end
        it=it+1;                 % Hemos movido la coma it veces.
    end
    z=zeros(1,23-length(m));     % Para completar mantisa.
    mantisa=[m z];               % Mantisa.
    expdec=127-it;               % Exponente decimal.
    expp=dec2bin_entero(expdec); % Exponente binario.
    if length(expp)<8            % Algunos números muestran exponentes de 7 bits
        d=8-length(expp);        % Arreglamos este error (puede deberse a la función dec2bin_decimal(x)
        z1=zeros(1,d);           
        exp=[z1 expp];           % El 'exp' será [00..expbinario] hasta 8 bits.
    else
        exp=expp;                % Si expdec ya tiene 8 bits no cambiamos nada.
    end
    ieee=[signo exp mantisa];    % Resultado
else                             % Si 'x' es entero.decimales (ej: 347.625).
    x1=fix(x);                   % 'x1' será la parte entera (ej: 347).
    x2=x-fix(x);                 % 'x2' será la parte decimal (ej: 625).
    b=dec2bin_entero(x1);        
    b1=dec2bin_decimal(x2);
    bin=[b b1];                  % 'x' en binario será el resultado de 'x1' 'x2' en binario.
    n=bin(1,2:length(bin));      % Normalizamos n= desde b(2) hasta el último índice.
    lb=length(b);
    expdec=lb-1+127;             % Exponente decimal exceso 127.
    exp=dec2bin_entero(expdec);  % Exponente en binario.
    z=zeros(1,23-length(n));     % Para completar la mantisa.
    mantisa=[n z];               % Mantisa.
    ieee=[signo exp mantisa];    % Resultado.
end
