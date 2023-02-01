%% Probleme 3
e = 0.75;
Va = 6;
Vb = 10;
theta = 150 * pi / 180;

Vbn = Vb * cos(theta);
Vbt = Vb * sin(theta);

Van = Va;
Vat = 0;

Van_p = (Van + Vbn - e * (Van - Vbn)) / 2
Vbn_p = Van + Vbn - Van_p

Vbt_p = Vbt;

Vb_p = sqrt(Vbn_p^2 + Vbt_p^2);

theta_p = atan(Vbt_p / Vbn_p) * 180 / pi
