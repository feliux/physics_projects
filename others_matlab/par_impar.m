function [a,b]=par_impar(x)
%Dado un vector 'x' entero devuelve la suma de sus elementos pares e impares.
%El método calcula elementos divisibles entre 2. rem(x(i),2).
%Si 'x' contiene un elemento negativo, la suma será hasta ese primer
%elemento.
%a=suma elementos pares
%b=suma elementos impares.
n=length(x);  %Longitud x.
if n==0  %n=0 -> el vector x es vacío x=[]
    a=-1;
    b=-1;
    disp('Error: x es el vector vacío')
elseif x==0  %Caso en que x=0
    b=0;
    a=0;
elseif x==1&n==1
    b=1;
    a=0;
else
    ap=[];
    bi=[];
    for i=1:n
        r=rem(x(i),2);  %El método calcula elementos divisibles entre 2.
        if x(i)<0   %Si algún x(i) es negativo.
            disp('Hay un número negativo en la posición:')
            disp(i)
            for j=1:(i-1)  %Entonces la suma se calcula hasta ese elemento negativo
                if r==0   %Número par.
                    ap(j)=x(j);  %ap=vector sólo números pares.
                else      %Número impar.
                    bi(j)=x(j);  %bi=vector sólo números impares.
                end
            end
            break  %Termina el programa en ese primer x(i)<0.
        else    %Si no hay elemento negativo. x(i)>0
            if r==0  %Número par.
                ap(i)=x(i);
            else
                bi(i)=x(i);  %Número impar.
            end
        end
        a=sum(ap);  %a = suma componentes pares de x.
        b=sum(bi);  %b = suma componentes impares de x.
    end
end
