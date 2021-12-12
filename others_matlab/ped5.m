function ped5(C,S,n,w)
x=[];
y=[];
for i=1:w  %Los valores de w que necesitamos para reconocer alguna figura
[IC,x(i)]=romberg(C,0,i,n);
[IS,y(i)]=romberg(S,0,i,n);
end
C=x
S=y
plot(x,y)
grid on