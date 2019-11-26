close all;  % clears existing plots
clear; % clear variable memory

N=1024;
%M=38.0;
%w=2*pi;
%x=0:N-1;

noise=randn(1,N);
%noise=rand(1,N);
noise=noise/1000;

xr = noise;
subplot(1,2,1);
plot(xr);

X=fft(xr,-1); % forward FFT
XdB = 20*log10(2/N*abs(X));
subplot(1,2,2);
plot(XdB);