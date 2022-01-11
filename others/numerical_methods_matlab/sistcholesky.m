function [L,x]=sistcholesky(A,b)
%
% [L,x]=sistcholesky(A,b)
%
% Resuelve un sistema de ecuaciones lineales mediante factorización de Cholesky.
% 
Lt=chol(A);  % chol(A) -> función interna.
L=Lt';       % Trasponemos Lt (más facilidad en las operaciones).
z=sp(L,b);
x=sr(Lt,z);

