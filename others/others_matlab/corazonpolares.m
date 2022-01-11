function corazonpolares
%
%Dibuja un corazón en coordenadas polares.
%f=(sin(theta).*sqrt(cos(theta))./sin(theta)+7/5)-2.*sin(theta)+2
%
t = 0:.01:2*pi;  %t==theta.
f = ( sin(t) .* sqrt(abs(cos(t))) ) ./ (sin(t) + 7/5) - 2 .* sin(t) + 2; %Ecuación.
polar(t,f) %Help polar para más info.
set(findobj('Type','line'),'Color',[.50 .0 .0],'Linewidth', 2);