% System parameter for overall simulink model
% by Yi Yang
% Date: 10/25/2016
% global CoulombicFrictionON Tf 

J = 8.5*10^(-6); % rotor inertial; [kgm^2]
b = 3.7*10^-6; % viscous damping; [Nms]
Kt = 4.24*10^-2; % torque constant; [Nm/A]
% Tf = 5.6*10^-3; % Coulombic friction torque; [Nm]
Kamp = 1; % gain of driver; [A/V]
% CoulombicFrictionON = 0; % take coulombic friction into consideration
tau = 6.6;
Kff = 1;
Kpp = 2;
Kpd = 0.09;
Kpi = 0;
Np = 150;
Kvp = 25;
Kvi = 0;
Kvd = 0.2;
Nv = 100;
% tau = 0.4;
% Kff = 0;
% Kpp = 7.74737;
% Kpd = 0.111579;
% Kpi = 0.319588;
% Np = 500;
% Kvp = 1.28947;
% Kvi = 2.47423;
% Kvd = 0.025263;
% Nv = 500;