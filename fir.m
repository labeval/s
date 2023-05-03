%low pass
clc;
clear all;
n=31;
wr=bartlett(n);
%wr=boxcar(n);
%wr=hanning(n);
%wr=blackman(n);
%wr=hamming(n);
wp=0.5;
b=fir1(30,wp,wr);
[h,o]=freqz(b,1,1024);
m=20*log10(abs(h));
subplot(2,2,1);
plot(o/pi,m);
ylabel("gain in db:");
xlabel('(a) Normalized frequency');
%high pass
b=fir1(30,wp,'high',wr);
[h,o]=freqz(b,1,1024);
m=20*log10(abs(h));
subplot(2,2,2);
plot(o/pi,m);
ylabel("gain in db:");
xlabel('(b) Normalized frequency');
%band pass
b=fir1(30,[0.3,0.8],wr);
[h,o]=freqz(b,1,1024);
m=20*log10(abs(h));
subplot(2,2,3);
plot(o/pi,m);
ylabel("gain in db:");
xlabel('(c) Normalized frequency');
%band stop
b=fir1(30,wp,'stop',wr);
[h,o]=freqz(b,1,1024);
m=20*log10(abs(h));
subplot(2,2,4);
plot(o/pi,m);
ylabel("gain in db:");
xlabel('(d) Normalized frequency');