function [v_teorico,v_calculado,error]=intpartesmontecarlo(a,b,iter)
%
% [v_teorico,v_calculado,error]=intpartesmontecarlo(a,b,iter)
%
% Aproxima el valor de una función en el intervalo [a,b] mediante una
% simulación de MonteCarlo.
% La función puede ser evaluada en cualquier cuadrante. Es una extensión a
% partir de v_calculado=intmontecarlo(a,b,iter) para cualquier tipo de
% función.
% Para pintar los disparos en cada iteración modificar el programa (línea
% pause).
% 
% NOTA: la función a evaluar se pide en formato inline('funcion').
%
% MÉTODO:
% Primero localiza las posibles raíces de la función. Para calcular las
% raíces usamos la función interna "fzero".
% Luego evalúa si la función es positiva o negativa en los intervalos
% limitados por las raíces (incluidos [a,b]). Esto es así para saber "dónde
% disparar".
% Por último calcula integrales a través de MonteCarlo cambiando los límites
% de integración. Es decir I[a,x1]+I[x1,x2]+I[x2,xn]+I[xn,b] dónde las "x"
% son las raíces encontradas.
%
% Variables de salida:
% v_teorico = valor teórico calculado mediante la función interna 'int'.
% v_calculado = valor mediante simulación de MonteCarlo.
% error = error cometido entre v_teorico y v_calculado.
%
disp('Debe insertar la función para la cual calcular el volumen')
disp('El formato es el siguiente:')
disp('Escribir:  inline(funcion)')
f=input('Inserte función   ')
x=linspace(a,b);   % Vector eje x.
y=feval(f,x);      % Evaluamos x.
plot(x,y,'k')
hold on
x0=[];     % Vector para las raíces.
posx0=[];  % Vector para saber la posición de las raíces en x.
v_teorico=int(sym(f),a,b);  % Valor teórico
for j=2:(length(y)-1)    % Si hay un cambio de signo en y=f(x)...
    if sign(y(j))~=sign(y(j+1))      %..hay una raíz...
        x0(j)=fzero(f,x(j));  % Calculamos el punto exacto de las raíz...
        posx0(j)=j;           % Y la posición más cercana en x.
    end
end
x0(x0==0)=[]; % Acortamos la longitud del vector eliminando ceros.
x0=[a x0 b];  % Vector con raíces e intervalo de entrada [a,b].
posx0(posx0==0)=[]; % Acortamos la longitud del vector eliminando ceros.
posx0=[1 posx0 length(y)]; % Las posiciones de las raíces, a y b.
sup=[];        % Integrales.
%
%%%%  CORRECIONES AL VER PROBLEMAS.. POSIBLE MEJORA. %%%%
% Para no crear más bucles y concentrar todo el código en una misma función se ha creado este "if".
% El problema surgía con las raíces y los intervalos a evaluar...
if length(posx0)~=length(x0)  % Corresponder la raíz con su posición...
    x0=[a b];  % Puesto que si no eran iguales se podría calcular mal la posición de ymax y/o ymin más adelante...
    posx0=[1 length(y)];
elseif x0(1)==x0(2)||x0(length(x0))==x0(length(x0)-1)  % Cuando a y/o b eran raíces...
    x0=[a b];
    posx0=[1 length(y)];
end
%%%%%%%%%%%%
[m,n]=size(x0);  % Para saber cuantos intervalos n.
for k=1:n-1
    dentro=0;
    a=x0(k);       % Primer pto intervalo.
    b=x0(k+1);     % Siguiente pto intervalo.
    xm=((b-a)./2)+a; % Punto medio de dicho intervalo...
    sy=feval(f,xm); % Evaluamos punto medio para saber el signo y si la función es positiva o negativa.
    if sy>0               % Positiva.. disparos arriba eje x.
        ymax=max(y(posx0(k):posx0(k+1))); % Ymax de los puntos evaluados "y" dentro del intervalo donde se harán los disparos.
        for i=1:iter
            ya=ymax.*rand(1);    % Calculamos componente y punto aleatorio.
            xa=(b-a).*rand(1)+a; % Calculamos componente x punto aleatorio.
            v=feval(f,xa);       % Evaluamos componente x del pto calculado para saber que valor toma en la función.
            if ya<=v             % Si el pto (componente y) está por debajo de la función...
                dentro=dentro+1;
            end
            sup(k)=dentro.*(b-a).*ymax./i; % Relación ptos que caen dentro frente al total de disparos i. Almacenados en vector "sup".
            plot(xa,ya,'*')
            %pause(0.001)
        end
    elseif sy<0      % Negativa.. disparos debajo eje x.
        ymin=min(y(posx0(k):posx0(k+1))); % Ymin de los puntos evaluados "y" dentro del intervalo donde se harán los disparos.
        for i=1:iter
            ya=ymin.*rand(1);
            xa=(b-a).*rand(1)+a;
            v=feval(f,xa);
            if ya>=v
                dentro=dentro+1;
            end
            sup(k)=-1.*dentro.*(b-a).*abs(ymin)./i; % Nota: hay un -1 en la ec. ya que son integrales negativas.
            plot(xa,ya,'*')
            %pause(0.001)
        end
    end
end
v_calculado=sum(sup); % Sumamos las integrales
% Al calcular el error vendrá un número muy inusual. Copiar y pegar en la ventana de comandos para verlo en decimal.
error=abs(v_calculado-v_teorico);
