clc
clear 
close all

t=1:4;
x=sin(t);
T=2*pi;

for k=1:10
    xk(k,:)=sin(t+k*T)
end

plot(t,k);
% periodic or not 
% run check the cmd
%if 
