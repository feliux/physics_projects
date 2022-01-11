function [ECbeta,alfa,beta,it]=ped4s(x0,x1,tol)
t=[0 0.5 1 1.5 2 2.5 3];   %Valores iniviales
y=[1.095 -0.1569 -1.0157 -1.4740 -1.3616 -0.8342 -0.0135]; %Valores iniciales
syms T Y a
%%%%%La ecuación que satisface beta está formada por términos A B C D
A=inline(Y.*sin(T)-sin(T).*exp(-a.*T));
sumaA=0;
for i=1:length(t)
sumaA=sumaA+A(t(i),y(i),a);
end
B=inline(T.*sin(T).*exp(-a.*T));
sumaB=0;
for i=1:length(t)
sumaB=sumaB+B(t(i),a);
end
AB=sumaB*sumaA;
C=inline(Y.*T.*exp(-a.*T)-T.*exp(-2.*a.*T));
sumaC=0;
for i=1:length(t)
sumaC=sumaC+C(t(i),y(i),a);
end
D=inline(sin(T).*sin(T));
sumaD=0;
for i=1:length(t)
sumaD=sumaD+D(t(i));
end
CD=sumaD*sumaC;
AD=inline(AB-CD); %%%%Ecuación que satisface beta
ECbeta=AD;        %%%%Ecuación que satisface beta
BB=inline(sumaA/sumaD);
%%%%%%%%%%%Método secante%%%%%%%%%%%%%%
fx0=feval(AD,x0); %Evaluamos x0 en la ecuación de beta
fx1=feval(AD,x1); %Evaluamos x1 en la ecuación de beta
x=x1-fx1.*(x1-x0)./(fx1-fx0); %Calculamos aproximación a la raíz
fx=feval(AD,x); %Evaluamos aproximación de raíz
it=1;
while abs(fx)>=tol  
    it=it+1;
    x0=x1;
    x1=x;
    fx0=feval(AD,x0);
    fx1=feval(AD,x1);
    x=x1-fx1.*(x1-x0)./(fx1-fx0);
    fx=feval(AD,x);
end
alfa=x;      %Valor de alfa
beta=BB(x);  %Con el valor previo de alfa calculamos beta.