function corazonfractal
%
% Variación del fractal estándar de Mandelbrot que converge hacia la forma de un corazón.
%
n = 300;
N = 200;
% Grid
x = linspace(-1, 1, N);
y = linspace(-1.4, .6, N);
[X,Y] = meshgrid(x, y);
Z = X + 1i*Y;
Zn = Z;figure
set(gcf, 'Color',[1 1 1]);
for j=1:n
    Zn = - 1i*(Zn).^2 + (rand(N,N).^(1/5)).*Z;  % Mandelbrot con ruido aleatorio.
    M = abs(Zn);
    ind1 = find(M,2);
    %M(ind1) = 0;    % ???
    %M(ind1) = -1;   % ???
    m = .5;
    imagesc(x, y, (M)/m)
    colormap([1 1 1; .50 .0 .0])
    set(gca,'YDir','normal','Box', 'off','XColor', [1 1 1], 'YColor', [1 1 1])
    title(n-j)
    pause(0.01)
end
title('Fractal de Madelbrot en forma de corazón', 'fontsize', 10)
