function [num,pos]=buscanum(x)
%Dado un vector devuelve el menor valor del
%vector y la posición donde se encuentra.
l1=length(x);
num=x(1);
pos=1;
for i=2:l1
    if x(i)<num
        num=x(i);
        pos=i;
    end
end
