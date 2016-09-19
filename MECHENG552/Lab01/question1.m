%% This program is used for comparing theoretical bode plots and experiments bode plots
% by - Yi Yang, Feng Zhou, Fan Bu, all rights reserved
% date: 9/18/2016
%-------------------------------------------------------------------------------------
% Theoretical plot
s = tf('s');
Gth = (1 + 0.1 * s) * (1 + 5 * s)/(1 + 0.01 * s) * (1 + 10 * s);
[MagTh, PhaseTh, FreqTh] = bode(Gth, {0.001, 2 * pi * 500});
Mag = zeros(length(MagTh), 1);
Phase = zeros(length(PhaseTh), 1);
for i = 1:length(MagTh)
    Mag(i, 1) = MagTh(1, 1, i);
    Mag(i, 1) = 20 * log10(Mag(i, 1));
    Phase(i, 1) = PhaseTh(1, 1, i);
end
% Experimental plot
% We decide to plot theoretical curves and experimental curves
data = xlsread('data1.xlsx');
freq = data(:, 3) * 2 * pi;
amp = data(:, 1);
phase = data(:, 2);
amp = 20*log10(amp); % transform to decibel
figure(1);
handle1 = subplot(2, 1, 1);
hold on;
semilogx(FreqTh, Mag, 'r');
semilogx(freq, amp , '-o');
xlabel('Frequency (rad/s)');
ylabel('Magnitude (dB)');
title('Bode Amplitude: Experimental vs Theoretical');
set(handle1,'XMinorTick','on');
set(handle1,'XScale','log');
legend('the', 'exp')
hold off;
handle2 = subplot(2, 1, 2);
hold on;
semilogx(FreqTh, Phase, 'r');
semilogx(freq, phase, '-o');
xlabel('Frequency (rad/s)');
ylabel('Phase (deg)');
title('Bode Phase: Experimental vs Theoretical');
set(handle2, 'XMinorTick', 'on');
set(handle2, 'Xscale', 'log');
legend('the', 'exp')
hold off;
