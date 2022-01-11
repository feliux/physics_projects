function al=ped4
x=[0 0.5 1 1.5 2 2.5 3];
y=[1.095 -0.1569 -1.0157 -1.4740 -1.3616 -0.8342 -0.0135];
syms a b T Y
f=inline(-T*exp(-T*a)*(exp(-T*a) - Y + b*sin(T)));
sum=0;
for i=1:length(x)
    sum=sum+f(x(i),y(i),a,b);
end
f=inline(sum)
g=inline(-sin(T)*(exp(-T*a) - Y + b*sin(T)));
sum=0;
for i=1:length(x)
    sum=sum+g(x(i),y(i),a,b);
end
g=inline(sum)
fa=inline(diff(-T*exp(-T*a)*(exp(-T*a) - Y + b*sin(T)),a));
sum=0;
for i=1:length(x)
    sum=sum+fa(x(i),y(i),a,b);
end
fa=inline(sum)
fb=inline(diff(-T*exp(-T*a)*(exp(-T*a) - Y + b*sin(T)),b));
sum=0;
for i=1:length(x)
    sum=sum+fb(x(i),a);
end
fb=inline(sum)
ga=inline(diff(-sin(T)*(exp(-T*a) - Y + b*sin(T)),a));
sum=0;
for i=1:length(x)
    sum=sum+ga(x(i),a);
end
ga=inline(sum)
gb=inline(diff(-sin(T)*(exp(-T*a) - Y + b*sin(T)),b));
sum=0;
for i=1:length(x)
    sum=sum+gb(x(i));
end
gb=sum %%gb es constante (no tiene variable dependiente).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
it=1;
ali=[0;0]; %[a,b]
J=[fa(ali(1),ali(2)) fb(ali(1));ga(ali(1)) gb];
fg=[-f(ali(1),ali(2));-g(ali(1),ali(2))];
Val=inv(J)*fg;
al=Val+ali;
while abs(al-ali)>0.0000001
    it=it+1;
    ali=al;
    J=[fa(ali(1),ali(2)) fb(ali(1));ga(ali(1)) gb];
    fg=[-f(ali(1),ali(2));-g(ali(1),ali(2))];
    Val=inv(J)*fg;
    al=Val+ali;
end
it
