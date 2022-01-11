function [solucion,x,incremento,iter]=regulafalsi(f,a,b,tol,maxiter)
%
% [solucion,x,incremento,iter]=regulafalsi(f,a,b,tol,maxiter)
%
% Aplica regula falsi a la función f en el intervalo [a, b].
% tol: precisión deseada.
% maxiter: límite de iteraciones.
% solución: solución aproxinada.
% x: vector de las iteraciones.
% incremento: distancia entre las dos últimas iteraciones.
% iter: número de iteraciones.
% Ejemplo: [solucion,x,incremento,iter]=regulafalsi('cos',1,2,0.001,100)
% La función hace la comprobación de que hay cambio de signo en el intervalo.
%
fa=feval(f,a);
fb=feval(f,b);
if fa*fb>0 
    disp('La función debe tener signos contrarios en los extremos del intervalo')
    return
end
iter=0; % inicializar variables
x=a;
incremento=b-a;
while incremento > tol & iter<maxiter
    c=(a*fb-b*fa)/(fb-fa);
    x=[x,c];
    fc=feval(f,c);
    if fc==0  % por casualidad, c es la solución.
        a=c;b=c;
    elseif fa*fc<0 % Cambio de signo en [a, c]
        b=c;fb=fc;
    else fc*fb<0 % Cambio de signo en [c, b]
        a=c;fa=fc;
    end
    incremento=abs(x(end)-x(end-1));
    iter =iter+1; % Contador de iteraciones.
end
solucion=c; % Salida
if incremento>tol
    disp('Insuficientes iteraciones')
end
