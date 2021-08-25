En el direcotorio [src](src) se encuentras los scripts para llevar a cabo la simulación.

El script que ejecuta el programa se llama `montecarlo.sh`. tras ejecutarlo, solicita la concentración de partículas, medida en partículas por A^2, y la temperatura del sistema (K). Se generará un directorio con cinco archivos de datos (actualmente se encuentran en [data](data)) cuyo nombre tiene la forma `<concentración-temperatura>`

- `energias.txt`: guarda los valores en 1000 pasos distintos, así como el promedio a lo largo de todos los pasos.

- `dinamica.txt`: guarda las coordenadas de 200 partículas cada 100000 pasos.

- `rdf.txt`: contiene la función de distribución radial G, que mide la proporción en la cual se han dado las distintas distancias entre partículas. Se encuentra normalizada, de tal forma que el valor 1 corresponde a una distribución aleatoria de las partículas. 

- `distribucion.txt`: contiene el valor de una función H que cuenta el número de partículas a lo largo del plano, en función de la distancia y dirección (x,y). Se encuentra normalizada al igual que G, por lo tanto tomará el valor 1 en todos los puntos del plano para una distribución aleatoria de partículas.

Los datos de las funciones G y H han sido obtenidos a partir de la segunda mitad de la simulación, para que el sistema haya tenido el tiempo suficiente para evolucionar desde el estado inicial aleatorio a uno compatible con las condiciones del sistema. A este proceso se conoce como **termalización**.

Para visualizar los datos se pueden emplear los siguientes scripts

~~~
$ ./rdf.sh <dir>
$ ./distribucion.sh <dir>
$ ./energias.sh <dir>
$ ./dinamica.sh <dir>
~~~

El script `to_csv.sh` sirve para convertir los `.txt` donde se encuentran los datos a un formato en `.csv`.