% generates the figures for part 1 that we care about

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% compares the purely theoretical radiance fraction with the actual
% observed data

rbeam = 2.3650; % units in mm
rbeam = 1.6706; % only fitting estimateRbeam
rblock = 6.350;

rbeam = 2.0665; %fitting both
rblock = 5.0095; 

% actual data follows
displacement = [3.64; 4.23; 4.77; 5.07; 5.29; 5.40; 5.59; 6.09; 6.43; 7.39; 8.52];
VoltageFraction = [0.201; 0.301; 0.404; 0.493; 0.597; 0.696; 0.783; 0.849; 0.924; 0.965; 0.985];

[D, IR] = irradianceSweep(rbeam, rblock);

hold on;
plot(displacement, VoltageFraction, 'k.');
legend('Theoretical Ratio', 'Measured Ratio', 'Location', 'NorthWest');
hold off;