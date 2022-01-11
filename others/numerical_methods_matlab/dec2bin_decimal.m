function b1=dec2bin_decimal(m)
%
% b1=dec2bin_decimal(m)
%
% Convierte un número fraccionario sin parte entera a binario.
% El programa calcula el número en binario multiplicando por 2 el número en decimal.
% Si el número 'm' no es de la forma 0.xxx (ej, entero) devuelve b1 como un vector vacío: b1=[]
%
% Ejemplo: m=0.375
% Multiplicamos m*2=0.75 y cogemos parte entera: 0
% Multiplicamos 0.75*2=1.5 y cogemos parte entera: 1
% Multiplicamos 0.5*2=!1! y cogemos parte entera: 1
% Cuando llegamos a m*2=!1! finaliza el bucle. nuestro número es [0 1 1].
%
% NOTA: hay números, por ejemplo m=0.7, cuyo resultado da un binario con
% elementos repetitivos. Si m=0.7 -> b1=[1 0 1 1 -- 00 11 00 11 ...]
% la representación correcta sería b1=[1 0 1 1]
% ¿Este fallo puede deberse a la acumulación de errores? (¿en la resta fila 22-31?).
%
if m==0  % m=0 --> b1=0
    b1=0;
elseif (m-fix(m))==m   % ¿Está bien introducido el número en la forma 0.xxx? Sí. 
    b1=[];       % Creamos vector 'b1'.
    x(1)=0;      % Almacenamos vectores 'x','y','h' para comprobar en la ventana de comandos los binarios periódicos.
    y(1)=0;     
    h(1)=0;
    h(2)=m.*2;              % Multiplicamos por 2.
    b1(1)=fix(h(2));        % Parte entera de h(2).
    i=2;                    % Contador.
    while h(i)~=1           % Bucle para cuando h==1 (número entero, sin decimales).
    y(i)=h(i)-fix(h(i));    % Quitamos parte entera a 'h' (si la tiene) y almacenamos en 'y'.
    x(i)=y(i).*2;           % Multiplicamos por 2.
    for j=2:i               % Bucle para evitar números periódicos.
        if y(j)==x(i)       % Si se cumple algún x(i)==y(i).
            disp(b1)        % Muestra 'b1' calculado hasta ahora.
            break           % Fin
        end
    end
    b1(i)=fix(x(i));   % 'b1' es el número binario.
    i=i+1;             % Aumentamos contador en 1.
    h(i)=x(i-1);       % Guardamos x(i) en h(i+1)
    end
else
    b1=[];
end
