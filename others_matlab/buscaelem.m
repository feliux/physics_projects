function [elem,pos]=buscaelem(x)
%Muestra la posición y el contenido del
%primer elemento negativo de un vector 'x'.
l1=length(x);
if l1==0
    disp('Error: el vector está vacío')
else
    for i=1:l1
        if x(i)<0
        elem=x(i);
        pos=i;
        break
        elseif i==l1
        disp('No hay ningún elemento negativo')
        end
    end
end


      