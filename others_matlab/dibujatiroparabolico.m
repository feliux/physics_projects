function dibujatiroparabolico(phi,theta)
%Dibuja un tiro parabólico en 3D
%dibujatiroparabolico(phi,theta)
v0=5; %m/s
g=9.8; %m/s^2
t=linspace(0,2.*v0.*sind(theta)./g);
x(1)=v0.*cosd(theta).*cosd(phi).*t(1);
y(1)=v0.*cosd(theta).*sind(phi).*t(1);
z(1)=v0.*sind(theta).*t(1)-0.5.*g.*t(1).^2;
plot3(x(1),y(1),z(1),'*k')
xlabel('Eje x')
ylabel('Eje y')
zlabel('Eje z')
hold on
xlim([0 2.*sind(theta).*cosd(theta).*cosd(phi).*v0.^2./g])
ylim([0 2.*sind(theta).*cosd(theta).*sind(phi).*v0.^2./g])
zlim([0 0.5.*sind(theta).*sind(theta).*v0.^2./g])
for i=2:length(t)
    x(i)=v0.*cosd(theta).*cosd(phi).*t(i);
    y(i)=v0.*cosd(theta).*sind(phi).*t(i);
    z(i)=v0.*sind(theta).*t(i)-0.5.*g.*t(i).^2;
    pause(0.5)
    plot3(x(i),y(i),z(i),'*k')
end