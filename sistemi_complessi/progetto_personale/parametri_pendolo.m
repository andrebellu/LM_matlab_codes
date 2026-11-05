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

theta0 = pi/6;   % angolo iniziale: 30 gradi, in radianti
omega0 = 0;      % velocita angolare iniziale [rad/s]