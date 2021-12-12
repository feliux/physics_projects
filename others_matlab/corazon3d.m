function corazon3d
%
%Dibuja un corazón en 3 dimensiones.
%
n=100;
x=linspace(-2,2,n);
y=linspace(-2,2,n);
z=linspace(-2,2,n);
[X,Y,Z]=ndgrid(x,y,z);
%Compute function at every point in mesh
F = ( X.^2 + 9/4 .* Y.^2 + Z.^2 -1 ).^3 - X.^2 .* Z.^3 - 9/(80) .* Y.^2 .* Z.^3 ;
%generate plot
f1 = figure;
isosurface(F,0)
view([-67.5 2]);
set(findobj('Type','patch'),'FaceColor',[.50 .0 .0])
light('Parent',gca,...
'Position',[16.3 -103.1 -384.12]);
