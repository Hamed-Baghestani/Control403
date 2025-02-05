clc;
clear all;
close all;

% define Controller
s=tf('s');
Cs1=0.05;
Cs2=0.05+0.1*s;
Cs3=0.05+0.2*s;
Cs4=0.05+0.3*s;
Cs5=0.05+0.4*s;
Cs6=0.05+0.5*s;

% define SYS
num1=Cs1*200;
num2=Cs2*200;
num3=Cs3*200;
num4=Cs4*200;
num5=Cs5*200;
num6=Cs6*200;
%num1 =5*(s+1);
den=s*(s+1)*(s+10);
sys1=num1/den;
sys2=num2/den;
sys3=num3/den;
sys4=num4/den;
sys5=num5/den;
sys6=num6/den;
%sys1=num1/den;




figure
hold on
bode(sys1);
bode(sys2);
bode(sys3);
bode(sys4);
bode(sys5);
bode(sys6);

legend('0','0.1','0.2','0.3','0.4','0.5');
% set(findall(figure(1),'type','line','linewidth',2))
% title('bode with exponentioal');
%margin(sys), grid
%set(findall(figure(1),'type','line'),'linewidth',2)
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