clc;
clear;
close all;

% Causal Signal (t >= 0)
t = 0:0.1:5;
x = t .* exp(-t);
figure, plot(t, x)
title('Causal Signal')
xlabel('t')
ylabel('x(t)')
grid on

% Anti-Causal Signal (t <= 0)
t = -5:0.1:0;
x = t .* exp(-t);
figure, plot(t, x)
title('Anti-Causal Signal')
xlabel('t')
ylabel('x(t)')
grid on


% Non-Causal Signal: x(t) = t*exp(-t) for t from -5 to 5
t = -5:0.1:5;
x = t .* exp(-t);
figure, plot(t, x)
title('Non-Causal Signal')
xlabel('t')
ylabel('x(t)')
grid on