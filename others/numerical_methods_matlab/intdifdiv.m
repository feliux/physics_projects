function y=intdifdiv(x,xp,yp)
%
% y=intdifdiv(x,xp,yp)
%
% Calcula el polinomio de interpolación tras haber hallado
% los coeficientes mediante el programa difdiv.m y evaluarlos
% según evdif.m
%
% Variables entrada:
% xp = datos x
% yp = datos y
% x = ptos para los que se quiere calcular el valor que toma el polinomio.
%
a=difdiv(xp,yp);
y=evdif(a,xp,x);
