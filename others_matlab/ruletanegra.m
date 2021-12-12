function [dinero,pg,pp]=ruletanegra(di,apuesta,n)
% Ruleta color. Si sale negro gana. Tiene en cuenta un cierto número de
% apuestas 'n'.
negro=[2 4 6 8 10 11 13 15 17 20 22 24 26 28 29 31 33 35]; %Números negros.
ap=apuesta;
for i=1:n  %Contador para número 'n' apuestas.
    dinero=di-ap; %Dinero que tengo hecha la apuesta.
    r=randi([0,36],1); %Número de ruleta.
    for j=1:length(negro) %Contador que coprueba apuesta ganadora.
        if negro(j)==r %Si gana... m=1
            m=1;
            break
        else
            m=0;   %Si no gana.... m=0
        end
    end
    if m==1 %Si ganamos...
        dinero=dinero+2.*ap; %Dinero total: el que teníamos más ap ganadora.
        ap=apuesta;
        pgg(i)=1;   %Prob: contamos cuantas veces ganamos.
    else
        dinero=dinero;
        ap=2.*ap;  %Duplicamos apuesta para compensar pérdidas. ESTRATEGIA!.
        ppp(i)=1;  %Prob: contamos cuantas veces perdemos.
    end
    if dinero==0
        disp('Imposible seguir método:')
        disp('Se te ha acabado el dinero')
        disp('Has perdido tu dinero en la apuesta número')
        disp(i)
        n=i; %Prob: si nos quedamos sin dinero hay que reducir 'n'.
        break
    end
    di=dinero;  %Termina ronda y seguimos próxima tirada.
    if ap>di    %Nos quedamos sin dinero...
        ap=dinero;  %Apostamos lo que nos queda.
    end
    hold on
    grid on
    plot(i,dinero,'*')
    axis equal
end
pg=sum(pgg)./n; %Calculamos probabilidades.
pp=sum(ppp)./n;
    