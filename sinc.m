% plot sin(at)/t for different values of 'a' as 0.5,1,2.5
t=-12:0.05:12;%this creates a vector
 %with values of t from -12 to 12 in steps of 0.05;
s1=sin(0.5*(t+eps))./(t+eps); %eps is a small
 %number, and it is used to avoid warning
 %from MATLAB that a division with zero
s2=sin(t+eps)./(t+eps);
s3=sin(2.5*(t+eps))./(t+eps);
plot(t,s1,'r');
hold on;
plot(t,s2,'b');
hold on;
plot(t,s3,'g');
grid on;
xlabel('t');
ylabel(‘sin(at)/t');