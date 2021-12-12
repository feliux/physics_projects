%medesv
%Script que calcula el valor medio y la desviación media 
%del vector 'x' mediante bucles FOR.
x=input('Inserte vector x=');   %Opcional: al quitar esto, el script funciona con un 'x' asignado previamente
l1=length(x);
sumam=0;
sumad=0;
for i=1:l1     %FOR para calcular la media.
    sumam=sumam+x(i);
    med=sumam./l1;
end
for i=1:l1     %FOR para calcular la desviación.
    sd=(x(i)-med).^2;
    sumad=sumad+sd;
    desv=sqrt(sumad./l1);
end   
disp('La media es:')
disp(med)
disp('La desviación media es:')
disp(desv)