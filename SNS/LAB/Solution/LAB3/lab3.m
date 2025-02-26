clc;
clear;
close all;

t1 = 0:0.1:5;
x1 = t1.*exp(-t1);
plot(t1,x1)
title('Causal')

figure
t2 = 1:0.1:5;
x2 = t2.*exp(t2);
plot(t2,x2)
title('Non Causal')