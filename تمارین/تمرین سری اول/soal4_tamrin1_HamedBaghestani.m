%HamedBaghestani_40116143_soal4_tamrin1
%T1 , T2 har do baham barabarand va hamzaman mohasebe shodehand
clc;
clear all;
close;

s = zpk('s');
G1=1/s;
G2=2*s+1;
G3=1/(s^2 + 1);
G4=s/(s+1);
H1=3/s;
H2=(s-1)/(s+3);
H3=s/(s^2 + 3*s + 1);
H4=1/(s+2);


%T2=Y5/Y1
systemnames= 'G1 G2 G3 G4 H1 H2 H3 H4';
inputvar='[Y1]';
outputvar='[G3-H4]';
input_to_G1='[Y1-H1-H3]';
input_to_G2='[G1]';
input_to_G3='[G2+G4-H2]';
input_to_G4='[Y1-H1-H3]';
input_to_H1='[G1]';
input_to_H2='[G3-H4]';
input_to_H3='[G3-H4]';
input_to_H4='[G3-H4]';
sysoutname = 'TF2';
cleanupsysic = 'yes';
sysic;
TF2.InputName=('Y1');
TF2.OutputName=('Y5');

TF2 = minreal(TF2)
disp("قطب های سیستم عبارتند از");
p = pole(TF2)
%% 


%T1=Y5/Y2
systemnames= 'G1 G2 G3 G4 H1 H2 H3 H4';
inputvar='[Y2]';
outputvar='[G3-H4]';
input_to_G1='[Y2]';
input_to_G2='[G1]';
input_to_G3='[G2+G4-H2]';
input_to_G4='[Y2]';
input_to_H1='[G1]';
input_to_H2='[G3-H4]';
input_to_H3='[G3-H4]';
input_to_H4='[G3-H4]';
sysoutname = 'TF1';
cleanupsysic = 'yes';
sysic;
TF1.InputName=('Y2');
TF1.OutputName=('Y5');

TF1 = minreal(TF1)
p = pole(TF1)


