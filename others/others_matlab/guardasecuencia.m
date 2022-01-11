function guardasecuencia
%Script que dado un número 'n' crea una secuencia tal que 1,fact(2),...,fact(n)
%Además guarda en un fichero secuencia.txt el vector formado.
%Invocación: guardasecuencia
n=input('Inserte número: ');
secuencia(1)=1;
for i=2:n
    secuencia(i)=i.*secuencia(i-1);  %Factorial de 'n'.
end
disp('La secuencia es: ')
disp(secuencia)
save secuencia.txt -ascii  %Guarda la secuencia en archivo secuencia.txt