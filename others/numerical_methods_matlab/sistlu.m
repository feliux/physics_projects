function [L,U,P,x]=sistlu(A,b)
%
% [L,U,P,x]=sistlu(A,b)
%
% Resuelve un sistema de ecuaciones lineales mediante factorización LU.
%
% Teoría: tenemos que resolver un sistema A*x=b. Si calculamos la 
% factorización LU de su matriz de coeficientes:
% A --> P*A=L*U
% Podemos transformar nuestro sistema en uno equivalente de la forma:
% Ax=b --> P*A*x=P*b 
% y sustituyendo por su factorización:
% P*A*x=P*b --> L*U*x=P*b  
% Este nuevo sistema se resuelve empleando
% sustituciones regresivas y sustituciones progresivas. Para ello, asociamos
% el producto U*x a un vector de incógnitas auxiliar 'z'; U*x=z. Así:
% L*U*x=P*b --> L*z=P*b
%
[L,U,P]=lu(A);  % Calculamos factorización LU mediante la función interna lu(A).
Pb=P*b;  % Calculamos producto P*b. Pb es vector columna.
z=sp(L,Pb); % L*z=P*b es triangular inferior. Calculamos z por sust. progresivas.
x=sr(U,z);  % U*x=z es triangular superior. Calculamos x por sust. regresivas.
