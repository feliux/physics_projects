function F=fernfinite(varargin)
%
% F=finitefern(varargin)
%
% varargin == vacío  dibuja 100000 puntos.
%
% finitefern(n)      dibuja 'n' puntos.
%
% finitefern(n, 's') muestra cada paso al dibujar.
%
% finitefern(n,r,c)  devuelve mapa de bits en un array rxc
% que luego puede ser visto con spy(F) ó image(F).
% colormap([1 1 1; 0 2/3 0])
%
% F puede guardarse en formato .png escribiendo: 
% imwrite(full(F),'myfern.png','png','bitdepth',1)
%
showstep = (nargin >= 1) && ischar(varargin{end});
if showstep || (nargout == 0)
   clf
   shg
   set(gcf,'menubar','none','numbertitle','off','name','Finite Fern', ...
       'color','white')
   darkgreen = [0 2/3 0];
   darkred = [2/3 0 0];
end
if showstep
   finish = uicontrol('style','toggle','string','finish', ...
      'value',0,'background','white');
end
if (nargin >= 1) && ~ischar(varargin{1})
   n = varargin{1};
else
   n = 100000;
end

p  = [ .85  .92  .99  1.00];
A1 = [ .85  .04; -.04  .85];  b1 = [0; 1.6];
A2 = [ .20 -.26;  .23  .22];  b2 = [0; 1.6];
A3 = [-.15  .28;  .26  .24];  b3 = [0; .44];
A4 = [  0    0 ;   0   .16];

x = [.5; .5];
xs = zeros(2,n);
xs(:,1) = x;
for j = 2:n
   r = rand;
   if r < p(1)
      x = A1*x + b1;
   elseif r < p(2)
      x = A2*x + b2;
   elseif r < p(3)
      x = A3*x + b3;
   else
      x = A4*x;
   end
   xs(:,j) = x;
   if showstep
      h = plot(xs(1,1:n-1),xs(2,1:n-1),'.',x(1),x(2),'o');
      set(h(1),'markersize',6,'color',darkgreen);
      set(h(2),'color',darkred);
      axis([-3 3 0 10])
      axis off
      showstep = get(finish,'value') == 0;
      if ~showstep, delete(finish), end
      pause(.01)
   end
end

if nargout == 0
   plot(xs(1,:),xs(2,:),'.','markersize',1,'color',darkgreen);
   axis([-3 3 0 10])
   axis off
else
   if nargin < 3
      r = 768; c = 1024;
   else
      r = varargin{2}; c = varargin{3};
   end
   j = round((xs(1,:)+3)/6*c);
   i = round((9-.9*xs(2,:)+.5)/10*r);
   F = sparse(i,j,1,r,c)~=0;
end
