% Hamed Baghestani
% 40116143
% Final_Project

clc;
clear all;
close all;
%% section1

load('G:\دانشگاه\سیستمهای کنترل خطی\پروژه\Data (1).mat');
whos

my_phase=Data.phase;
my_magnitude=Data.magnitude;
my_frequency=Data.omega;

figure;
subplot(2,1,1);
semilogx(my_frequency, 20*log10(my_magnitude), 'b', 'LineWidth', 1.5);
grid on;
xlabel('Frequency (rad/s)');
ylabel('Magnitude (dB)');
title('Bode Plot - Magnitude Response');

subplot(2,1,2);
semilogx(my_frequency, my_phase, 'r', 'LineWidth', 1.5);
grid on;
xlabel('Frequency (rad/s)');
ylabel('Phase (degrees)');
title('Bode Plot - Phase Response');



%% section2


%% section3

s=tf('s');
num=0.032*s-0.064;
den=s^3+0.6*s^2+9*s;
sys=num/den;
figure;
bode(sys);

% systemIdentification
% tf1


%% section4

% -28.125 < K < 0

%% section 5

% sys1=tf1;
s=tf('s');
num1=0.1*s -0.2;
den1=s^3+0.9*s^2+9*s;
sys1=num1/den1;
figure;
rlocus(sys1);
hold on
rlocus(-sys1,'--');
set(findall(figure(1),'type','line') , 'linewidth', 2);
hold off

% sadesazy baraye mohasebe noghte jodaii
syms x

g = 0.1*(x^3 + 0.9*x^2 + 9*x) - (0.1*x - 0.2)*(3*x^2 + 1.8*x + 9);  
g_simplified = simplify(g);  
disp(g_simplified);  


% PD Controller

% z<0
num2=(s+10)*num1;
den2=den1;
sys2=num2/den2;
figure;
rlocus(sys2);
hold on
rlocus(-sys2,'--');
set(findall(figure(1),'type','line') , 'linewidth', 2);
hold off

% z=0
num3=s*num1;
den3=den1;
sys3=num3/den3;
figure;
rlocus(sys3);
hold on
rlocus(-sys3,'--');
set(findall(figure(1),'type','line') , 'linewidth', 2);
hold off

% z>0
num4=(s-10)*num1;
den4=den1;
sys4=num4/den4;
figure;
rlocus(sys4);
hold on
rlocus(-sys4,'--');
set(findall(figure(1),'type','line') , 'linewidth', 2);
hold off

% PI Controller

% z<0
num5=(s+10)*num1;
den5=den1*s;
sys5=num5/den5;
figure;
rlocus(sys5);
hold on
rlocus(-sys5,'--');
set(findall(figure(1),'type','line') , 'linewidth', 2);
hold off

% z>0
num6=(s-10)*num1;
den6=den1*s;
sys6=num6/den6;
figure;
rlocus(sys6);
hold on
rlocus(-sys6,'--');
set(findall(figure(1),'type','line') , 'linewidth', 2);
hold off


%% section6

G3s=0.1/(s^2+0.9*s+9);
figure;
step(G3s);
sys7=G3s;

figure
bode(sys7);
set(findall(figure(10),'type','line','linewidth',2))
title('bode with exponentioal');
margin(sys7), grid
set(findall(figure(10),'type','line'),'linewidth',2)
grid on


% C(s)=K

k=85.49;
sys8=k*sys7;
figure
bode(sys8);
set(findall(figure(11),'type','line','linewidth',2))
title('bode with exponentioal');
margin(sys8), grid
set(findall(figure(11),'type','line'),'linewidth',2)
grid on

% C(s) = lead Controller

Cs=(85.49*(0.45*s+1))/(0.09*s+1);
sys9=Cs*sys7;
figure
bode(sys9);
set(findall(figure(12),'type','line','linewidth',2))
title('bode with exponentioal');
margin(sys9), grid
set(findall(figure(12),'type','line'),'linewidth',2)
grid on

% step response
figure
step(sys9);

% C(s) = lag Controller

C2s=(1*(1.2*s+1))/(2.6*s+1);
sys10=C2s*sys9;
figure
bode(sys10);
set(findall(figure(14),'type','line','linewidth',2))
title('bode with exponentioal');
margin(sys10), grid
set(findall(figure(14),'type','line'),'linewidth',2)
grid on

% step response
figure
step(sys10);

%% section7

% 7.1  (ramp response)
k1=-2250;
sys11=k1*sys1;
figure;
step(tf(1,[1,0])*sys11);
title('ramp response');

k2=-2500;
sys12=k2*sys1;
figure;
step(tf(1,[1,0])*sys12);
title('ramp response');

C4s=(-4.3692*(1+1.3*s)*(1+5.6*s))/(s^2);
sys13=(C4s*sys1)/(1+C4s*sys1);
figure
step(sys13);
figure
step(tf(1,[1,0])*sys13);
title('ramp response');

% 7.2
Td=(-0.5*(s-2))/((s+1)^3);
Sd=(s^3+3*s^2+3.5*s)/((s+1)^3);
C3s=Td/(Sd*sys1);
my_gain=1.15;
LG=my_gain*C3s*sys1; % LoopGain
CL=feedback(LG,1);
figure
step(CL);
information=stepinfo(CL);
undershoot=information.Undershoot;
disp('undershoot is :');
disp(undershoot);
ts=information.SettlingTime;
disp('Settling Time is :');
disp(ts);
figure
step(tf(1,[1,0])*CL);
title('ramp response');