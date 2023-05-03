clear all;
close all;
clc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%
% delta1 = input('Enter the Pass Band Ripple');
% delta2 = input('Enter the Stop Band Ripple');
% wp = input('Enter the Digital Pass Band Edge Frequency');
% ws = input('Enter the Digital Stop Band Edge Frequency');
% T = input('Enter the Sampling Time Period in Seconds');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%
%delta1 = 10^(-1.0/20.0)
%delta2 = 10^(-30.0/20.0)
delta1 = 0.90
delta2 = 0.05
wp = 0.25
ws = 0.50
T = 0.1
%Analog Frequencies Calculated using Bilinear Transformation
omegap = (2/T)*tan(wp/2);
omegas = (2/T)*tan(ws/2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%To Calculate the filter order
den = 2*log10(omegas/omegap);
delta = ((1/(delta2^2))-1);
epsi = ((1/(delta1^2))-1);
num = log10(delta/epsi);
N = ceil(num/den);
omegac = omegap/(epsi^(1/(2*N)));
wc = 2*atan(omegac/2);
[b,a] = butter(N,wc/pi);
[H,W] = freqz(b,a,1024);
plot(W/pi,20*log10(abs(H)));
grid on
xlabel('Frequency x Pi in radians per sample')
ylabel('Magnitude in dB')
title('Butterworth Filter Design using Bilinear Method')