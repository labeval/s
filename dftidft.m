i=(-1)^0.5;
x = [0 1 2 3];
N = length(x);
W = exp(-1i*2*pi/N);
for k = 1:N
 X(k)=0.0;
 for n=1:N
 X(k)=X(k)+W^((n-1)*(k-1))*x(n);
 end
end
subplot(4,1,1)
stem(abs(X))
subplot(4,1,2)
stem(angle(X))
%similarly calculate idft
for n=1:N
 y(n)= 0.0;
 for k=1:N
 y(n)=y(n)+W^(-(n-1)*(k-1))*X(k);
 end
end
y = y/N;
subplot(4,1,3)
stem(abs(y))
subplot(4,1,4)
stem(angle(y))