Lt = 3;            % m
mb = 8;            % kg
mp = 80;           % kg
vf = 21.593 / 3.6; % m/s
vb = -1;           % m/s
marge = 0.02;      % s
e = 0.8;

%% Cas G1 : e = 0
% Va' = Vb' = V_p
V_p = (mp * vf + mb * vb) / (mp + mb)
T_g1 = Lt / V_p

%% Cas G2 : e = 0.8
Va_p = (mp * vf + mb * vb - 0.8 * mb * (vf - vb)) / (mp + mb)
T_g2 = Lt / Va_p

%% Calcul de la valeur de la minuterie
tm = T_g1 + (T_g2 - T_g1) / 2   % 0.5888
marge = T_g2 - tm
