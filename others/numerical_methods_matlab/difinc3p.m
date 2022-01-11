function dn=difinc3p(fun,x0,h)
%
% dn=difinc3p(fun,x0,h)
%
% Diferencia centrada en dos puntos.
xp=x0+h;
xn=x0-h;
yp=feval(fun,xp);
yn=feval(fun,xn);
dn=(yp-yn)./(2.*h);
