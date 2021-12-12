function d1=sumadiag1(A)
%Suma los elementos de la diagonal principal
%de una matriz cuadrada.
%Invocación: d1=sumadiag1(A)
l1=length(A);
d1=0;
for i=1:l1
    j=i;
    d1=d1+A(i,j);
end
