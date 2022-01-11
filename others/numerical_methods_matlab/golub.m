function A=golub(n)
%
% A=golub(n)
%
% Ejemplo de matrices mal condicionadas.
% Devuelve el producto de dos matrices nxn generadas aleatoreamente,
% una de ellas triangular inferior y la otra triangular superior.
% Factorización LU revela que las matrices están mal condicionadas.
%
s = 10;
L = tril(round(s*randn(n)),-1)+eye(n);
U = triu(round(s*randn(n)),1)+eye(n);
A = L*U;
