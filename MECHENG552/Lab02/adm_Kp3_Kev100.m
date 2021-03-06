%% Experiemnt data demonstration
% by Yi Yang
% Date: 9/30/2016
% data set: adm_Kp-3_Kev100
%--------------------------------------------------------------------------
struct = importdata('test/20160927111226_adm_Kp=-3_Kimg=100.txt');
data = struct.data(:,:);
timeStamp = data(:, 1);
LoadCellForceA = data(:, 2);
MotorOutputA = data(:, 3);
RevPosA = data(:, 4);
RevPosB = data(:, 5);
CurrentA = data(:, 6);

% Admittance theoretical model
s = tf('s');
dataID = sysID();
Z_h = dataID.M * s + dataID.B; % the inherent impedance of haptic devices
Kve = 100; % [N/m], virtual environment spring constant
Z_ve = Kve/s; % impedance of virtual environment
C = -3; % portional control law
Z_padm = (dataID.n * C * Z_ve + Z_h)/(dataID.n * C + 1);

% Model constructed by experiment data
format long;
Ts=(timeStamp(end)-timeStamp(1))/(length(timeStamp)-1)/(10^6);
LinTime = timeStamp(1)/(10^6):Ts:timeStamp(end)/(10^6);
% Resample_RevPosB = interp1(timeStamp(1:end-1)/(10^6), RevPosB(1:end-1), LinTime);
% Fuser = k * (Resample_RevPosB)/1000.0; % [N] ([N/m]*[m])
% Uo_sea = lsim(1/Z_psea, Fuser, LinTime);
Resample_RevPosA = interpl(timeStamp(1:end)/(10^6), RevPosA(1:end), LinTime);
% First order Euler backward difference methods to approximate velocity
V = diff([0; Resample_RevPosA])./diff([LinTime(1) - Ts; LinTime]);
figure(1);
plot(LinTime, LoadCellForceA, LinTime, Resample_RevPosA, LinTime, V);
legend('Force', 'pos', 'velo');
% figure(4);
% hold on;
% plot(LinTime, Fuser, 'b--');
% plot(LinTime, Uo, 'r');
% legend('Force', 'Velocity');
% title('Simulation');
% grid on;
% box on;
% hold off;