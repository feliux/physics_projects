function C=traspo(A)
%Hace la traspuesta de una matriz A
[m,n]=size(A);
if m~=n, error, ('La matriz no es cuadrada'), end
for i=1:m
   for j=1:n
      C(i,j)=A(j,i);
   end 
end
