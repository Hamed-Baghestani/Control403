clc;
clear all;
close all;

s=tf('s');
num =300*(18.32*s+1);
%num1 =5*(s+1);
den=(683.89*s+1)*(s)*(s+3)*(s^2+2*s+5);
sys=num/den;
%sys1=num1/den;
display(sys);
%display(sys1);

figure
bode(sys);
set(findall(figure(1),'type','line','linewidth',2))
title('bode with exponentioal');
margin(sys), grid
set(findall(figure(1),'type','line'),'linewidth',2)
grid on

%figure
%bode(sys1);
%set(findall(figure(1),'type','line','linewidth',2))
%title('bode without exponentioal');
%grid on
% figure
% nyquist(sys);
% set(findall(figure(2),'type','line','linewidth',2))
% title('nyquist with exponentioal');
% figure
% nyquist(sys1);
% set(findall(figure(2),'type','line','linewidth',2))
% title('nyquist without exponentioal');
% grid on