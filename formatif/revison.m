clear all;

x = [0,     0.1,    0.2,    0.3,    0.4,    0.5];
F = [12500, 170000, 207500, 185000, 162500, 200000];
m = 1687.5;

Y = F';

phi0 = [x.^0]';
phi1 = [x.^1]';
phi2 = [x.^2]';
phi3 = [x.^3]';
phi4 = [x.^4]';
phi5 = [x.^5]';



P3 = [phi0, phi1, phi2];
P4 = [phi0, phi1, phi2, phi3];
P5 = [phi0, phi1, phi2, phi3, phi4];
P6 = [phi0, phi1, phi2, phi3, phi4, phi5];

A3 = pinv(P3) * Y;
A4 = pinv(P4) * Y;
A5 = pinv(P5) * Y;
A6 = pinv(P6) * Y;

xx = [0: 0.01: 0.5];

g3  = A3(1) + A3(2).*x  + A3(3).*x.^2;
gg3 = A3(1) + A3(2).*xx + A3(3).*xx.^2;
g4  = A4(1) + A4(2).*x  + A4(3).*x.^2  + A4(4).*x.^3;
gg4 = A4(1) + A4(2).*xx + A4(3).*xx.^2 + A4(4).*xx.^3;
g5  = A5(1) + A5(2).*x  + A5(3).*x.^2  + A5(4).*x.^3  + A5(5).*x.^4;
gg5 = A5(1) + A5(2).*xx + A5(3).*xx.^2 + A5(4).*xx.^3 + A5(5).*xx.^4;
g6  = A6(1) + A6(2).*x  + A6(3).*x.^2  + A6(4).*x.^3  + A6(5).*x.^4  + A6(6).*x.^5;
gg6 = A6(1) + A6(2).*xx + A6(3).*xx.^2 + A6(4).*xx.^3 + A6(5).*xx.^4 + A6(6).*xx.^5;

plot(x, F, 'LineWidth', 2);
hold on;
plot(xx, gg3);
plot(xx, gg4);
plot(xx, gg5);
plot(xx, gg6);

gamma = sum(F) / length(F)
rden  = sum((F - gamma).^2)

E3   = sum((g3 - F).^2);
rms3 = sqrt(E3 / length(g3))
r3   = sum((g3 - gamma).^2) / rden

E4   = sum((g4 - F).^2);
rms4 = sqrt(E4 / length(g4))
r4   = sum((g4 - gamma).^2) / rden

E5   = sum((g5 - F).^2);
rms5 = sqrt(E5 / length(g5))
r5   = sum((g5 - gamma).^2) / rden

E6   = sum((g6 - F).^2);
rms6 = sqrt(E6 / length(g6))
r6   = sum((g6 - gamma).^2) / rden
