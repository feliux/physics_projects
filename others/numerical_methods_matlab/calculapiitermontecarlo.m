function calculapiitermontecarlo(iter)
%
% calculapiitermontecarlo(iter)
%
% Aproxima el número pi mediante una simulación de MonteCarlo.
% El programa itera cierto número de veces (valor de entrada).
% Dibuja un círculo y los disparos aleatorios en cada iteración. Al final
% muestra el valor de pi aproximado y el error cometido en el cálculo.
%
theta=linspace(0,360);   % Vector puntos del círculo.
x=sind(theta);   % Ecuación círculo eje x.
y=cosd(theta);   % Ecuación círculo eje y.
plot(x,y,'k')    % Dibujamos círculo.
hold on
axis equal
hit=2.*rand(1,2)-1;    % Número aleatorio entre [-1,1]. "Disparo".
h=sqrt(hit(1).^2+hit(2).^2);  % Distancia al número aleatorio.
plot(hit(1),hit(2));   % Dibujamos el disparo.
if h-1<=0              % Si la distancia del disparo es menos que 1...
    acierto=1;         %..está dentro del círculo.
end
a=1;                   % Contador de aciertos.
i=1;                   % Contador número de disparos realizados
pic=4.*a./i;     % Aproximación del valor. Al principio siempre 4, acierte o no.
for i=2:iter
    acierto=0;   % Reiniciamos acierto para nuevo disparo.
    hit=2.*rand(1,2)-1;
    h=sqrt(hit(1).^2+hit(2).^2);
    plot(hit(1),hit(2),'*')
    if h-1<=0
        acierto=1;
    end
    a=a+acierto; % Aumentamos en 1 si el disparo es acertado.
    pic=4.*a./i;
    pause(0.01)
end
disp('El valor de pi obtenido es')
disp(pic)
disp('El error cometido en el calculo es')
disp(abs(pic-pi))
