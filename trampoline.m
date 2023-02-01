h0 = 5;         % m
g  = 9.81;      % m/s^2
k  = 6000;      % N/m
mp = 80;        % kg
mb = 8;         % kg
m  = mb + mp;   % kg

% Calcul de l'energie totale dans le systeme
E_pg = m * g * h0;
E_total = E_pg                          % 4316.4

% Calcul de la vitesse d'impact;
% verification de l'energie
vi  = sqrt(2 * E_total / m)             % 9.9045
E_c = m * vi^2 / 2                      % 4316.4

% Calcul de la hauteur de deplacement du trampoline;
% verification du travail
h = roots([k / 2, m * g, -E_total])     % [-1.3520, 1.0642]
W = k * h.^2 / 2 + m * g * h            % 4316.4
