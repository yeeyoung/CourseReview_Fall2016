% Driver circuit experimental data fitting
data = xlsread('driver_circuit_data.xlsx');
f1 = fit(data(:,1), data(:,2)/1000, 'poly1')
u = linspace(0,2.5,101);
i = 0.2177*u;
figure;
% plot(data(:,1), data(:,2)/1000, 'k.');
hold on;
plot(f1, data(:,1), data(:,2)/1000);
plot(u,i,'b');
legend('measured output', 'fit curve', 'theoretical curve','Location', 'NorthWest');
xlabel('Input Voltage (V)');
ylabel('EM Current (A)');
