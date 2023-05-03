dt = 0.001;
T = 1;
t = [0:dt:T]';
omega0 = 2*pi/T;
N = length(t);
N2 = round(N/2);
x = ones(N, 1);
x (N2 + 1:N) = -1*ones(N - N2, 1);
a(1) = 1/T*(sum(x)*dt);
xfs = a(1)*ones(size(x));
for k = 1:2:30
ck = cos(k*omega0*t);
a(k + 1) = 2/T*(sum(x.*ck)*dt);
sk = sin(k*omega0*t);
b(k + 1) = 2/T*(sum(x.*sk)*dt);
% Fourier series approximation
xfs = xfs+a(k+1)*cos(k*omega0*t)+b(k+1)*sin(k*omega0*t); plot(t, x, '-', t, xfs, 'r');
legend('desired', 'approximated');
drawnow; pause(2);
end