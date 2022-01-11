function xs=gauss_seidel_mixto(A,b,w,c,d)
L=A-triu(A);
U=A-tril(A);
D=diag(diag(A));
n=size(A,1);
x0=zeros(n,1);   %Empezamos GS
f=inv(D+L)*b;
H=-inv(D+L)*U;
it1=1;
xs=f+H*x0;
error=norm(x0-xs);
while it1<=c
    x0=xs;
    xs=f+H*x0;
    error=norm(x0-xs);
    plot(it1,error,'k*');
    hold on
    it1=it1+1;
end   
I=eye(n);    %Empezamos SOR
fs=w*inv(D+L)*b;
Hs=(1-w)*I-w*inv(D+L)*U;
it2=1;
x0=xs;
xs=fs+Hs*x0;
error=norm(x0-xs);
while it2<=d
    x0=xs;
    xs=fs+Hs*x0;
    error=norm(x0-xs);
    plot(it2+c,error,'+');
    it2=it2+1;
end
xlabel('Iteraciones');
ylabel('Error');
