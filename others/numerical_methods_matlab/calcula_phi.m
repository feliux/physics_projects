function [phi,iter]=calcula_phi(tolerancia)
%
% [phi,iter]=calcula_phi(tolerancia)
%
% Calcula del valor del número aureo mediante la fórmula phi=1+1/phi según una tolerancia.
% Devuelve el valor de phi y el número de iteraciones.
%
% Extra: dibuja el rectángulo áureo.
%
phi=rand(1);   % Iniciamos
iter=0;
E=inf;
% Calculo iterativo de phi
while (E>tolerancia),
	phi_ant=phi;
	phi=1+1/phi;
	iter=iter+1;
	E=sqrt((phi-phi_ant)^2);
	fprintf(1,'El valor de phi es: %f e iter=%f E=%f\n', phi, iter, E);
end
% Rectángulo phi
phi = (1+sqrt(5))/2;
x = [0 phi phi 0 0];
y = [0 0 1 1 0];
u = [1 1];
v = [0 1];
plot(x,y,'b',u,v,'b--')
text(phi/2,1.05,'\phi')
text((1+phi)/2,-.05,'\phi - 1')
text(-.05,.5,'1')
text(.5,-.05,'1')
axis equal
axis off
set(gcf,'color','white')
