function U=eligaussp(A)
%
% U=eligaussp(A)
%
% Obtiene una matriz triangular superior, a partir de una
% matriz dada, aplicando el método de eliminación gaussiana.
% Realiza pivoteo de filas. Lo primero que hace es comprobar si el
% elemento de la diagonal, de la fila que se va a emplear para eliminar,
% es el mayor que los que tiene por debajo en su columna. Si no es así,
% intercambia la fila con la que tenga el elemento mayor en dicha columna.
%
nf=size(A,1); % Obtenemos el número de filas de la matriz..
U=A;
for j=1:nf-1 % Recorre todas la columnas menos la última.
    % Pivoteo de filas...
    % Buscamos el elemento mayor de la columna j de la diagonal hacia abajo.
    maxcol=U(j,j);
    index=j;
    for l=j:nf
        if U(l,j)>maxcol
            maxcol=U(l,j);
            index=l;
        end
    end
    % Si el mayor no era el elemento de la diagonal U(j,j), intecambiamos la fila l con la fila j.
    if index~=j
        aux=U(j,:);
        U(j,:)=U(l,:);
        U(l,:)=aux;
    end
    % Fin del pivoteo de filas.
    for i=j+1:nf % Recorre las filas desde debajo de la diagonal hasta la última
            U(i,:)=U(i,:)-U(j,:)*U(i,j)/U(j,j);
    end
end
