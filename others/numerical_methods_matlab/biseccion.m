function [r,it]=biseccion(fun,a,b,itmax)
%
% [r,it]=biseccion(fun,a,b,itmax)
%
% Aplica el método de la bissección para determinar las raíces de una función.
% %La tolerancia del método se inserta por pantalla.
%
% Variables entrada:
% [a, b] = intervalo donde se encuentra la raíz.
% fun = función a evaluar (inline OR .m)
% itmax = número máximo de iteraciones.
% 
% Variables de salida:
%r = raíz  .
% it = número iteraciones.
%
tol=input('Inserte la tolerancia del método: ');
fa=feval(fun,a);
fb=feval(fun,b);
if fa==0
    disp('a es una raíz de la función')
    r=a;
    it=0;
end
if fb==0
    disp('b es una raíz de la función')
    r=b;
    it=0;
end
if fa*fb>=0
    disp('Error: no hay raíz en el intervalo ó hay un número par de ellas')
    r=[];
    it=0;
else
    r=(a+b)./2;
    fr=feval(fun,r);
    it=0;
    while abs(fr)>=tol & it<=itmax
        it=it+1;
        if fb*fr>0
            b=r;
            r=(a+b)./2;
            fr=feval(fun,r);
        elseif fb*fr<0
            a=r;
            r=(a+b)./2;
            fr=feval(fun,r);
        else
            disp('Raìz encontrada')
            
        end
    end
end
