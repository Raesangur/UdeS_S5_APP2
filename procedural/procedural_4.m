clear all
clc

%% Probleme 4
e = 0.8;
Vo = -24;
theta_i = 150 * pi / 180;

Vn = Vo * cos(theta_i);
Vt = Vo * sin(theta_i);

Vnp = -0.8 * Vn
Vtp = Vt;

Vp = sqrt(Vnp^2 + Vtp^2)
theta = atan(Vnp/Vtp) * 180 / pi
