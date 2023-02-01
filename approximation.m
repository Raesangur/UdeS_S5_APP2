o = [0 : 10 : 100];
c = [0.87, 0.78, 0.71, 0.61, 0.62, 0.51, 0.51, 0.49, 0.46, 0.48, 0.46];

% phi_n(x) = x^(n-1)
phi_1 = [o.^0].';
phi_2 = [o.^1].';
phi_3 = [o.^2].';

% Calcul des coefficients
P = [phi_1, phi_2, phi_3]
Y = c';
A = (inv(P.' * P) * P.' * Y).'

% Fonction g(x) approximant la courbe
f = A(1) + A(2) .* o + A(3) .* o.^ 2;

figure
plot(o, c, "*")
hold on
plot(o, f)
xlabel("Ouverture de la valve")
ylabel("Coefficient de friction")
title("Approximation du coefficient de friction selon l'ouverture de la valve")

% Calcul de l'erreur
E = sum((f - c).^2);
RMS = sqrt(1/length(c) .* E)

y = 1/length(c) * sum(c);
R = sqrt(sum((f - y).^2) ./ sum((c - y).^2))
