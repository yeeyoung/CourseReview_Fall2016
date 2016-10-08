%% SISO tool used for PD Control
% by Yi Yang
% Date: 9/29/2016
%--------------------------------------------------------------------------
close all;
clear all;
s = tf('s');
% Define plant tf
G = -51/(s^2 - 4685);
Con = tf([1 1], [1 1]);
H = 1;
F = 1;

