function tablamultiplicar
%Dado un número 'n' devuelvre por pantalla su 
%tabla de multiplicar.
%Invocación: tablademultiplicar.
n=input('Inserte el número del que desea conocer la tabla: ');
for i=1:10
    m(i)=n.*i;
end
fprintf(1,'La tabla de multiplicar de %d es\n',n)
disp(m')
