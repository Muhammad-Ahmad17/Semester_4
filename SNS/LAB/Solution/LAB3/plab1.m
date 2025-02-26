clc
clear
close all

% a
t= 0:0.1:20;
x=t.*exp(-0.1*t).*cos(t);
%plot(t,x)
%title('orignal')


%extra
figure

% plot(-t,x)
% title('flip')

% b  even = (x(t)+x(-t))/2
x_e=0.5*(x+flip(x));
x_o=0.5*(x-flip(x));
x_eo=x_e+x_o;


subplot(221)
plot(t,x)
title(' signal x(t)');

subplot(222)
plot(t,x_e)
title('even decomposition x_even(t) of x(t)');

subplot(223)
plot(t,x_o)
title('odd decomposition x_odd(t) of x(t)');

subplot(224)
plot(t,x_eo)
title('x_even(t) + x_odd(t)');

% plot (t,x)   VS  plot (x)
%length(x)
% matalb me 0 index ni hota
