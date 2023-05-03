f = [0 0.6 0.6 1];
m = [1 1 0 0];
b1 = fir2(10,f,m);
stem(0:10,b1');
[h1,w] = freqz(b1,1)
plot(f,m,w/pi,abs(h1))
xlabel('\omega / \pi')
lgs = {'Ideal','fir2 default'};
legend(lgs)