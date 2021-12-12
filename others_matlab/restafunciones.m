function restafunciones(fun1,fun2,x)
%Evalúa la diferencia entre dos funciones arbitrarias 'fun1', 'fun2'
%df=resta(fun1,fun2,x)
%Las funciones pueden ser ficheros .m (comillas) o handles.
%Invocación: resta('ejemfun1','ejemfun2',linspace(0,2)) ¡Entre comillas!
f1=feval(fun1,x);
f2=feval(fun2,x);
df=f1-f2;
plot(x,df)
grid on