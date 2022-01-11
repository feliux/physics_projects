function v_calculado=intmontecarlo(a,b,iter)
%
% v_calculado=intmontecarlo(a,b,iter)
%
% Aproxima el valor de una función en el intervalo [a,b] mediante una
% simulación de MonteCarlo.
% La función tiene que ser evaluada en el cuadrante superior derecho:
% x>=0, y=>0. De lo contrario pueden surgir errores.
% Para pintar los disparos en cada iteración modificar el programa (línea pause).
%
% NOTA: la función a evaluar se pide en formato inline('funcion').
%
disp('Debe insertar la función para la cual calcular la integral')
disp('El formato es el siguiente:')
disp('Escribir:  inline(funcion)')
f=input('Inserte función   ')
x=linspace(a,b); % Vector eje x.
y=feval(f,x);    % Evaluamos x.
plot(x,y,'k')
hold on
ymax=abs(max(y)); % Calculamos maximo punto positivo.
dentro=0;
for i=1:iter
    ya=ymax.*rand(1);    % Calculamos componente y punto aleatorio.
    xa=(b-a).*rand(1)+a; % Calculamos componente x punto aleatorio.
    v=feval(f,xa);       % Evaluamos componente x del pto calculado para saber que valor toma en la función.
    if ya<=v  % Si el pto (componente y) está por debajo de la función...
        dentro=dentro+1;
    end
    v_calculado=dentro.*(b-a).*ymax./i; % Relación ptos que caen dentro frente al total de disparos i.
    plot(xa,ya,'*')
    %pause(0.001)
end

