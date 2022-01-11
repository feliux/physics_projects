function edadprimos
%Calcula cuantos años te hacen falta
%para tener un número primo de años.
%Invocación: edadprimos
e=input('Cuantos años tienes? ');
i=1;
if e>150
   disp('No tienes más de 150 años...');
   return
elseif isprime(e)==1;  %Si 'e' es primo.
      disp('tienes un número primo de años')
else
    p=primes(150);     %Vector con los 150 primeros números primos.
      while e>p(i)
         a=p(i+1)-e;
         i=i+1;
      end
      fprintf('Tienes que esperar %i años para tener un número primo de años.\n',a)
end