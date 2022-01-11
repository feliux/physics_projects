function [I,Integral]=romberg(fun,a,b,n)
%
% [I,Integral]=romberg(fun,a,b,n)
%
% Emplea la integración de Romberg (mejora de la regla trapezoidal)
% para calcular la integral de una función 'fun' en el intervalo [a,b] 
% dividido en 'n' subintervalos de longitud 'h'.
% Devuelve una tabla 'I' que contiene en la primera columna el valor de la
% integral a medida que se reducen los intervalos 'h'. A partir de la
% segunda columna se obtienen una extrapolación a partir de los dos valores
% estimados anteriormente.
%
h=(b-a)./2;
I(1,1)=h.*(feval(fun,a) +2.*feval(fun,a+h) +feval(fun,b))./2; % Primera estimación
Iv=I;
c=1;
%%%%% Primera columna de integrales
for i=2:n   % La primera estimación ya se ha calculado.
    h=h./2;
    In=h.*(feval(fun,a) +feval(fun,b))./2;
    while (a+c.*h)~=b
    In=In+h.*(2.*feval(fun,a+c.*h))./2;
    c=c+1;
    end
    I(i,1)=In;
    Iv=In;
    c=1;
end
[p,q]=size(I);
for j=2:p     % Columnas de extrapolación.
    for k=j:p
       I(k,j)=I(k,j-1)+(1./((2.^j)-1)).*(I(k,j-1)-I(k-1,j-1));
    end
end
Integral=I(p,p);
