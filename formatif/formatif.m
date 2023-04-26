%% #1
clc
clear all

m = 4;
h = 0.6;
k = 20000;
g = 9.81;


Epi = m * g * h;
vf  = sqrt(2 * g * h)
x   = sqrt(m * vf^2 / k)


%% #2
clc
clear all

e = 0.95;
vi = 5;
theta = 30 * pi / 180;

v1t = vi * cos(theta)
v1n = vi * sin(theta)
v2 = 0;


v1np = v1n * (1 - e) / 2

v1p = sqrt(v1np^2 + v1t^2)
v2p = e * v1n + v1np



%% #3
clc
clear all

x = [0.0,  0.1, 0.2,   0.3, 0.4,   0.5];
F = [12500, 170000, 207500, 185000, 162500, 200000];
m = 1687.5;

phi_1 = [x.^0]';
phi_2 = [x.^1]';
phi_3 = [x.^2]';
phi_4 = [x.^3]';
phi_5 = [x.^4]';
phi_6 = [x.^5]';

P2 = [phi_1, phi_2, phi_3];
P3 = [phi_1, phi_2, phi_3, phi_4];
P4 = [phi_1, phi_2, phi_3, phi_4, phi_5];
P5 = [phi_1, phi_2, phi_3, phi_4, phi_5, phi_6];

Y = F';

A2 = (inv(P2' * P2) * P2' * Y)'
A3 = (inv(P3' * P3) * P3' * Y)'
A4 = (inv(P4' * P4) * P4' * Y)'
A5 = (inv(P5' * P5) * P5' * Y)'

F2 = A2(1) + A2(2) .* x + A2(3) .* x.^2;
F3 = A3(1) + A3(2) .* x + A3(3) .* x.^2 + A3(4) .* x.^3;
F4 = A4(1) + A4(2) .* x + A4(3) .* x.^2 + A4(4) .* x.^3 + A4(5) .* x.^4;
F5 = A5(1) + A5(2) .* x + A5(3) .* x.^2 + A5(4) .* x.^3 + A5(5) .* x.^4 + A5(6) .* x.^5;


E2   = sum((F2 - F).^2);
E3   = sum((F3 - F).^2);
E4   = sum((F4 - F).^2);
E5   = sum((F5 - F).^2);
RMS2 = sqrt(1 / length(x) * E2)
RMS3 = sqrt(1 / length(x) * E3)
RMS4 = sqrt(1 / length(x) * E4)
RMS5 = sqrt(1 / length(x) * E5)


plot(x, F, "*")
hold on
plot(x, F2)
plot(x, F3)
plot(x, F4)
plot(x, F5)












