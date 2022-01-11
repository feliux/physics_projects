function result=triang(a,b,c)
%Nos dice si con las variables de entrada a b c se puede formar un triángulo equilátero
%Ordenamos los lados de menor a mayor
x=sort([a,b,c])
if x(3)==x(2) & x(3)==x(1)
   result='Equilatero';
else
   result='No equilatero';
end
x=[0 a/2 a]
y=[0 a*sin(-60) 0]
plot(x,y)
hold on
x=[0 a]
y=[0 0]
plot(x,y)

