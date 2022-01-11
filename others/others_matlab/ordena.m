function z=ordena(x)
%Ordena de menor a mayor los elementos de un vector
n=length(x);
z=x;
for i=1:n
for j=1:n-1
if x(j)>x(j+1)
z(j)=x(j+1);
z(j+1)=x(j);
x=z;
end
end
end


