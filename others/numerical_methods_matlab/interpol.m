function [r,it]=interpol(fun,tol,a,b)
%
% [r,it]=interpol(fun,tol,a,b)
%
% Aplica el método de interpolación lineal (Regula Falsi) para
% determinar las raíces de una función 'fun'.
%
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
    disp('Error: no hay raíz en el intervalo o hay un número par de ellas')
    r=[];
    it=0;
else
    r=b-((fb.*(b-a))./(fb-fa));
    fr=feval(fun,r);
    it=1;
    fprintf(1,'\n iter=%i  raíz=%f  fr=%f  a=%f  b=%f',it,r,fr,a,b)
    while abs(fr)>=tol
        it=it+1;
        if fb*fr>0
            b=r;
            r=b-((fb.*(b-a))./(fb-fa));
            fr=feval(fun,r);
        else
            a=r;
            r=b-((fb.*(b-a))./(fb-fa));
            fr=feval(fun,r);
        end
        fprintf(1,'\n iter=%i  raíz=%f  fr=%f  a=%f  b=%f',it,r,fr,a,b)
    end
end
        
