clc
close all

h = [0, 8, 15,20, 25];
y = [30, 19, 20, 16, 12.55];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Interpolation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

phi_1 = (h.^0).';
phi_2 = (h.^1).';
phi_3 = (h.^2).';
phi_4 = (h.^3).';
phi_5 = (h.^4).';

Y = y';
P = [phi_1, phi_2, phi_3, phi_4, phi_5];

A = (inv(P) * Y).'

dx = 0.1;
x = [0:dx:25 - dx];

f = A(1) + A(2).* x + A(3) .* x.^2 + A(4) .* x.^3 + A(5) .* x.^4;

df = A(2) + 2.*A(3).*x + 3.*A(4).*x.^2 + 4.*A(5).*x.^3;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Longeur de la courbe et Angle sur chaque dx
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f_len=0;
for i=1:250
    f_seg(i)=sqrt((dx^2)+(df(i)*dx)^2);
    f_len=f_len+f_seg(i);
    f_ang(i)=atan(df(i));
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Calcul Force friction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mg=80*9.81;
u=0.625;
for i=1:250
    N(i)=mg*cos(f_ang(i));
    Ff(i)=N(i)*u;
    %F(i)=-mg*sin(f_ang(i))-Ff(i);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Calcul Travail de frottement sur chaque points
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Wf(1)=Ff(1)*f_seg(1);
for i=2:250
    Wf(i)=Wf(i-1)+(Ff(i)*f_seg(i))
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Calcul Energie cin/tique+vitesse
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m=80;
for i=1:250
    Ek(i)=mg*f(1)-mg*f(i)-Wf(i);
    v(i)=3.6*sqrt((2*Ek(i)/m));
end

rms = 0.01804;
vmax = v.* (1+rms);
vmin = v.* (1-rms);

figure
plot(1:250,v)
hold on
plot(1:250,vmax)
plot(1:250,vmin)
plot([0, 250], [45, 45])
plot([0, 250], [10, 10])
plot([0, 250], [20, 20])
plot([0, 250], [25, 25])
xlabel("Distance horizontale (cm)")
ylabel("Vitesse (km/h)")
title("Vitesse du participant sur la glissade")

vf = v(length(v))
vfmax = vmax(length(v))
vfmin = vmin(length(v))
