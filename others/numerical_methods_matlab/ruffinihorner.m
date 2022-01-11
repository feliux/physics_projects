function [p,pderivada,q] = ruffinihorner(z0,pol)
%
% [p,pderivada,q] = ruffinihorner(z0,pol)
%
% Obtiene las raices reales e imaginarias (complejos) de un polinomio.
% Algoritmo de Ruffini-Horner para evaluar el polinomio p,
% su derivada y el polinomio p deflacionado
%
   
l = length(pol); % Número de términos del polinomio, incluidos los nulos.
r = pol(1);      % Valor numérico del polinomio.
q(1) = pol(1); 
p = pol(1);
pderivada = pol(1);
% Nos movemos desde el segundo término del vector hasta el último.
for i=2:l
% Reutilizando los cálculos anteriores
% Bucle para obtener p deflacionado, que pasará a llamarse q.
    r = ((z0*r) + pol(i));
    if (i < l)
        q(i) = r;
    end
    p = ((z0*p) + pol(i));
    % Para obtener p'(z0) paramos antes de la última operación.
    if i <= l-1
        pderivada = ((z0*pderivada) + p);
    end
end
