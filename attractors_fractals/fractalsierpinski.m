function fractalsierpinski(A,B,C,iter)
%
% fractalsierpinski(A,B,C,iter)
%
% Dibuja el triángulo de Siespinski.
%
% Variables de entrada:
% A,B,C = puntos del triángulo; preferiblemente que sea equilátero.
% Ejemplo: A=[0 0] B=[1 1] C=[2 0]
% iter = número de iteraciones.
%
% NOTA: la función se llama así misma recursivamente (XD) por lo que si
% iter>10 el programa tarda mucho en dibujar el fractal. Preferiblemente usar iter<8.
% Es un ejemplo de programa fractal =D
%
hold on
x=[A(1) B(1) C(1) A(1)];  % Vector coordenadas 'x'.
y=[A(2) B(2) C(2) A(2)];  % Vector coordenadas 'y'.
plot(x,y,'k')   % Dibuja primer triángulo.
nA=[A(1)+(B(1)-A(1))./2 A(2)+(B(2)-A(2))./2]; % Calcula primer ptos triángulo contenido.
nB=[A(1)+(C(1)-A(1))./2 A(2)+(C(2)-A(2))./2];
nC=[B(1)+(C(1)-B(1))./2 C(2)+(B(2)-C(2))./2];
x=[nA(1) nB(1) nC(1) nA(1)];  % Coordenadas triángulo contenido.
y=[nA(2) nB(2) nC(2) nA(2)];
plot(x,y)
if iter>=3  % Para que dibuje triángulos contenidos no solo en el central. (Repartidos).
    r=randi(4,1);  % Aleatorio para cambiar el orden de dibujado.
    if r==1
        fractalsierpinski(A,nA,nB,iter-1) % Bucles para repetir proceso en triángulos pequeños.
        fractalsierpinski(nA,B,nC,iter-1)
        fractalsierpinski(nA,nB,nC,iter-1)
        fractalsierpinski(nB,nC,C,iter-1)
    elseif r==2
        fractalsierpinski(nA,nB,nC,iter-1)
        fractalsierpinski(nA,B,nC,iter-1)
        fractalsierpinski(A,nA,nB,iter-1)
        fractalsierpinski(nB,nC,C,iter-1)
    elseif r==3
        fractalsierpinski(nA,nB,nC,iter-1)
        fractalsierpinski(nB,nC,C,iter-1)
        fractalsierpinski(A,nA,nB,iter-1)
        fractalsierpinski(nA,B,nC,iter-1)
    else
        fractalsierpinski(nB,nC,C,iter-1)
        fractalsierpinski(A,nA,nB,iter-1)
        fractalsierpinski(nA,B,nC,iter-1)
        fractalsierpinski(nA,nB,nC,iter-1)
    end
end
