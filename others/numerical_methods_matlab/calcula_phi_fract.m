function calcula_phi_fract(n)
%
% calcula_phi_fract(n)
%
% Calcula el número áureo mediante fracciones de 'n' términos.
%
p = '1';
for k = 1:n     % Fracciones
   p = ['1+1/(' p ')'];
end
p
% Simplificamos fracciones
p = 1;
q = 1;
for k = 1:n
   s = p;
   p = p + q;
   q = s;
end
p = sprintf('%d/%d',p,q)

format long
p = eval(p)
% Calculamos error
format short
err = (1+sqrt(5))/2 - p
