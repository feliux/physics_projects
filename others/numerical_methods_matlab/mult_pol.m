function mul=mult_pol(p,q)
%
% mul=mult_pol(p,q)
%
% Calcula el producto de dos polinomios.
% 
n=length(p);   % Iniciamos n y m a las longitudes de los vectores.
m=length(q);
% Creamos el vector resultante a 0
c=zeros(1,n+m-1);
% Recorremos los limites de los vectores y vamos guardando en el vector,
% las multiplicaciones correspondientes, sumándole el valor antiguo.
for i=1:n
  for j=1:m
    c(i+j-1)= p(i)*q(j)+ c(i+j-1);
  end
end
mul=c;
