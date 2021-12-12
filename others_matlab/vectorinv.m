function y=vectorinv(x)
%Dado un vector 'x', genera otro con
%el orden de sus elementos invertidos.
l1=length(x);
for i=1:l1
    y(l1)=x(i);
    l1=l1-1;
end
