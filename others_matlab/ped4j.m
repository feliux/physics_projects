function ab=ped4j
x=[0 0.5 1 1.5 2 2.5 3]; %Valores iniviales
y=[1.095 -0.1569 -1.0157 -1.4740 -1.3616 -0.8342 -0.0135]; %Valores iniciales
syms a b T Y
f=inline(-T*exp(-T*a)*(exp(-T*a) - Y + b*sin(T))); %Calculamos Sa=f(a,b)
sum=0;
for i=1:length(x)
    sum=sum+f(x(i),y(i),a,b);
end
f=inline(sum)
g=inline(-sin(T)*(exp(-T*a) - Y + b*sin(T))); %Calculamos Sb=g(a,b)
sum=0;
for i=1:length(x)
    sum=sum+g(x(i),y(i),a,b);
end
g=inline(sum)
%%%%%%%%%%%%%%Derivadas parciales%%%%%%%%%%%%%%
fa=inline(diff(-T*exp(-T*a)*(exp(-T*a) - Y + b*sin(T)),a)); %Calculamos fa
sum=0;
for i=1:length(x)
    sum=sum+fa(x(i),y(i),a,b);
end
fa=inline(sum)
fb=inline(diff(-T*exp(-T*a)*(exp(-T*a) - Y + b*sin(T)),b));  %Calculamos fb
sum=0;
for i=1:length(x)
    sum=sum+fb(x(i),a);
end
fb=inline(sum)
ga=inline(diff(-sin(T)*(exp(-T*a) - Y + b*sin(T)),a)); %Calculamos ga
sum=0;
for i=1:length(x)
    sum=sum+ga(x(i),a);
end
ga=inline(sum)
gb=inline(diff(-sin(T)*(exp(-T*a) - Y + b*sin(T)),b)); %Calculamos gb
sum=0;
for i=1:length(x)
    sum=sum+gb(x(i));
end
gb=sum %%gb es constante (no tiene variable dependiente).

%%%%%%%%%%%%%Resolvemos sistema ecuaciones%%%%%%%%%%%%%%%%%%
it=1;  %Primera iteración
abi=[0;0]; %[a,b] pto inicial
J=[fa(abi(1),abi(2)) fb(abi(1));ga(abi(1)) gb]; %Matriz del sistema. Jacobiano
fg=[-f(abi(1),abi(2));-g(abi(1),abi(2))]; %Vector 
U=eligaussp(J); %Eliminación Gaussiana
Val=sr(U,fg);   %Solución del sistema.
ab=Val+abi;     %Calculamos la solución (a,b) más próxima al valor real. a(i+1),b(i+1)
%%%%%Iteramos método Newton%%%%%%%%%%%%%%%%
while abs(ab-abi)>0.0000001 %Tolerancia
    it=it+1;
    abi=ab;
    J=[fa(abi(1),abi(2)) fb(abi(1));ga(abi(1)) gb];
    fg=[-f(abi(1),abi(2));-g(abi(1),abi(2))];
    U=eligaussp(J);
    Val=sr(U,fg);
    ab=Val+abi;
end
it %Mostramos las iteraciones realizadas.