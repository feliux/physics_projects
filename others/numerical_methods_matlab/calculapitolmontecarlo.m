function calculapitolmontecarlo(error)
%
% calculapitolmontecarlo(error)
%
% Aproxima el número pi mediante una simulación de MonteCarlo.
% El programa itera cuantas veces sea necesario hasta admitir una tolerancia
% Dibuja un círculo y los disparos aleatorios en cada iteración. Al final
% muestra las iteraciones y el valor de pi aproximado.
%
theta=linspace(0,360);   % Vector puntos del círculo.
x=sind(theta);   % Ecuación círculo eje x.
y=cosd(theta);   % Ecuación círculo eje y.
plot(x,y,'k')    % Dibujamos círculo.
hold on
axis equal
it=1;
hit=2.*rand(1,2)-1;    % Número aleatorio entre [-1,1]. "Disparo".
h=sqrt(hit(1).^2+hit(2).^2);  % Distancia al número aleatorio.
plot(hit(1),hit(2));   % Dibujamos el disparo.
if h-1<=0              % Si la distancia del disparo es menos que 1...
    acierto=1;         % ..está dentro del círculo.
end
a=1;          % contador de aciertos.
pic=4.*a./it; % Aproximación del valor. Al principio siempre 4, acierte o no.
while abs(pic-pi)>error  % Mientras la aproximación sea mayor que la tolerancia...
    it=it+1; 
    acierto=0; % Reiniciamos acierto para nuevo disparo.
    hit=2.*rand(1,2)-1;
    h=sqrt(hit(1).^2+hit(2).^2);
    plot(hit(1),hit(2),'*')
    if h-1<=0
        acierto=1;
    end
    a=a+acierto; % Aumentamos en 1 si el disparo es acertado.
    pic=4.*a./it;
    pause(0.01)
end
disp('El valor de pi obtenido es')
disp(pic)
disp('En la iteración')
disp(it)
