mb = 8;
mp = 80;
kf = 0.95;
b  = 47;
h  = 10;
g  = 9.81;
vf = 1;

%% Vitesse d'impact

% Calcul de l'énergie potentielle
E = mp * g * h;   % 7848 J

% Calcul de la vitesse d'impact
vi = sqrt(2 * E / mp);


%% Bassin

v0 = sqrt(m * g * (1 - kf) / b)   % 0.9137

K = -g*(1 - kf)/v0^2 - b/m        % -1.175
C = g*(1-kf)/v0 - b*v0/m          % presque 0

z = (log(vi - v0) - log(vf - v0)) / K    % -4.2743
