function sum=suma_pol(p,q)
%
% sum=suma_pol(p,q)
%
% Calcula la suma de dos polinomios.
%
n=length(p);
m=length(q);
%
% Igualamos un vector de 0's al mayor y recorremos 
% el polinomio mayor del último elemento al primero y
% le vamos sumando los elementos del menor, en el caso
% de que sean iguales en longitud, simplemente sumamos 
% cada elemento del vector por el correspondiente al otro.
%
s=zeros(1,max(n,m));
if n == m
    for i=n:-1:1
       s(i)= p(i)+q(i);
    end
elseif n < m
    s = q;
    aux=m;
    for i=n:-1:1
        s(aux)= s(aux) + p(i);
        aux=aux-1;
    end
else
    s = p;
    aux=n;
    for i=m:-1:1
        s(aux)= s(aux) + q(i);
        aux=aux-1;
    end
end  
sum = s;
