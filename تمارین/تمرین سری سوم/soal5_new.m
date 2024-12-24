%Hamed Baghestani(40116143)
%soal5
%G(s) = (5*s + 10)/(s^2 + 4*s + 5)

clc;
clear all;
close all;

%%
num = [5 10];
den = [1 4 5];
sys=tf(num,den);
L=sys

%G=L/(1+L);
num1 = [5 10];
den1 = [1 9 15];
sys1=tf(num1,den1);
G=sys1

% zeros and poles for close loop
zeros1 = roots(num1);   
poles1 = roots(den1); 

% zeros and poles for open loop
zeros = roots(num);   
poles = roots(den);   

% figure of zeros and poles for close loop
figure;
plot(real(zeros1), imag(zeros1), 'o', 'MarkerFaceColor', 'g' , 'MarkerSize', 10); % صفرها
hold on;
plot(real(poles1), imag(poles1), 'x', 'MarkerFaceColor', 'r' , 'MarkerSize', 10); % قطب‌ها
xlabel('Real');
ylabel('Imaginary');
title(' نمودار صفرها و قطب‌ برای سیستم حلقه بسته');
grid on;
legend('صفرها', 'قطب‌ها');
axis equal;
ylim([-3 3]);



% figure of zeros and poles for open loop
figure;
plot(real(zeros), imag(zeros), 'o', 'MarkerFaceColor', 'g' , 'MarkerSize', 10); % صفرها
hold on;
plot(real(poles), imag(poles), 'x', 'MarkerFaceColor', 'r' , 'MarkerSize', 10); % قطب‌ها
xlabel('Real');
ylabel('Imaginary');
title('نمودار صفرها و قطب‌ برای سیستم حلقه باز');
grid on;
legend('صفرها', 'قطب‌ها');
axis equal;
ylim([-3 3]);



%%
%it is for close loop
figure;
step(G);
title('step response for close loop');
damp(G)
stepinfo(G);

%stedy state Eror
dcgain_value1 = dcgain(G);
error_ss1 = 1 / (1 + dcgain_value1);

t = 0:0.01:10;
[y1, t] = step(G, t); 
% محاسبه خطای ماندگار برای هر زمان
error1 = ones(size(t)) - y1;

figure;
% اولین نمودار: پاسخ به ورودی پله
subplot(1, 2, 1); 
plot(t, y1, 'LineWidth', 2);
title('پاسخ سیستم به ورودی پله برای سیستم حلقه بسته');
xlabel('زمان');
ylabel('خروجی');
grid on;

% دومین نمودار: خطای ماندگار
subplot(1, 2, 2); 
plot(t, error1, 'r', 'LineWidth', 2);
title('خطای ماندگار سیستم حلقه بسته');
xlabel('زمان');
ylabel('خطا');
grid on;

fprintf('خطای ماندگار برای ورودی پله برای سیستم حلقه بسته: %.2f\n', error_ss1);

%it is for open loop
figure;
step(L);
title('step response for open loop');
damp(L)
stepinfo(L);

%stedy state Eror
dcgain_value = dcgain(L);
error_ss = 1 / (1 + dcgain_value);

t = 0:0.01:10;
[y, t] = step(L, t); 
% محاسبه خطای ماندگار برای هر زمان
error = ones(size(t)) - y;

figure;
% اولین نمودار: پاسخ به ورودی پله
subplot(1, 2, 1); 
plot(t, y, 'LineWidth', 2);
title('پاسخ سیستم به ورودی  پله برای سیستم حلقه باز');
xlabel('زمان');
ylabel('خروجی');
grid on;

% دومین نمودار: خطای ماندگار
subplot(1, 2, 2); 
plot(t, error, 'r', 'LineWidth', 2);
title('خطای  ماندگار برای سیستم حلقه باز');
xlabel('زمان');
ylabel('خطا');
grid on;

fprintf('خطای ماندگار برای ورودی پله برای سیستم حلقه باز: %.2f\n', error_ss);