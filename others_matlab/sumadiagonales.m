function sumadiagonales(A)
%Calcula la suma de las diagonales principales
%de una matriz cuadrada nxn.
%Invocación: sumadiagonales(A)
s=size(A); %Calcula nxm
if s(1,1)~=s(1,2)  %Si n~=m
    disp('La matriz no es cuadrada')
else
    l1=length(A); %Longitud de A
    d1=0; %Contador
    d2=0; %Contador
    for i=1:l1  %FOR que calcula suma diagonal principal.
        j=i;
        d1=d1+A(i,j);
    end
    for i=1:l1  %FOR que calcula suma diagonal contraria.
        d2=d2+A(i,l1);
        l1=l1-1; %A medida que aumenta 'i', 'j' disminuye.
    end
    sumadiagonales=d1+d2 %Suma de ambas diagonales.
end
