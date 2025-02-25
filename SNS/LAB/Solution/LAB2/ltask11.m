clc
clear 
% Define the time vector
t = -1:0.01:1;

% Create the unit impulse function
delta = t == 0;

% Plot the unit impulse function
figure;
stem(t, delta, 'LineWidth', 2);
title('Unit Impulse Function');
xlabel('Time (t)');
ylabel('\delta(t)');
grid on;
