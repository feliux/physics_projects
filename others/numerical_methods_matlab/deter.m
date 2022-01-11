function D=deter(a)
%
% D=deter(a)
%
% Calcula el determinante de una matriz (cuadrada) 'a'.
% Consiste en hacer la matriz triangular superior para luego
% multiplicar los términos de la diagonal principal.
%
disp('EL DETERMINANTE ES')	
d=2;
for k=2:length(a);
	x=d;
	for i=x:length(a);
		m(i,k-1)=a(i,k-1)/a(k-1,k-1);
		for j=1:length(a);
			a(i,j)=a(i,j)-m(i,k-1)*a(k-1,j);
		end
	end
	d=d+1;
end
D=1;
for f=1:length(a);
	D=D*a(f,f);
end
	
 
