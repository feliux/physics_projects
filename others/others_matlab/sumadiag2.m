function d2=sumadiag2(A)
%Suma los elementos de la diagonal principal
%en sentido contrario de una matriz cuadrada.
%Invocación: d2=sumadiag2(A)
l1=length(A);
d2=0;
for i=1:l1
    d2=d2+A(i,l1);
    l1=l1-1;
end