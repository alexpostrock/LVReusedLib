
clear;

N=256;
M=4.0;
w=2*pi;
x=0:N-1;
numSignals = 32;

noise=randn(1,N);
noise=noise/10000;

xTot =zeros(1,N);
for i=1:numSignals
xr = cos(i*w*x*M/N);
xTot = xr + xTot + noise;
end
subplot(2,1,1);
plot(xTot);
title('Linear');
%xclick();

y=20*log10(2/N*abs(fft(xTot,-1)));

subplot(2,1,2);
plot(y);
title('in dB');