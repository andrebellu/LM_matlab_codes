clear;
clc;

% Asta sottile e omogenea
m = 1;           % massa [kg]
L = 1;           % lunghezza totale [m]
ell = L/2;       % distanza perno-baricentro [m]
I = m*L^2/3;     % momento d'inerzia al perno [kg*m^2]
u = 0;           % coppia del motore

g = 9.81;        % accelerazione di gravita [m/s^2]
b = 0.2;         % coefficiente di attrito [N*m*s/rad]

theta0 = pi - 0.01;   % angolo iniziale
omega0 = 0;      % velocita angolare iniziale [rad/s]

J_basso = [0 1; -(m*g*ell)/I -b/I];

eigs_basso = eig(J_basso);

theta = pi;
J_alto = [0 1; -((m*g*ell)/I)*cos(theta) -b/I];

eigs_alto = eig(J_alto);

