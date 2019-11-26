% Program RECT
% Generation of a rectangular sequence
N = 1001;
n = (ceil(-N/2):floor(N/2));

width = 101;
x=[zeros(1,N/2-width/2) ones(1,width) zeros(1,N/2-width/2)];


close all;			% Clear old graph
subplot(2,1,1);
plot(n,x);		% Plot the generated sequence
axis([-N/2 N/2 -0.5 1.5]);

title(['Rectangular Pulse, 2*T = ',num2str(width)] );
%xlabel('Time index n');
ylabel('Amplitude');
axis;

subplot(2,1,2);
X = fft(x);
X = abs(X);
%X = X/length(n);
X = fftshift(X);
%Y = 10*log(X);
plot(n,real(X));		% Plot the FFT of the sequence
axis([-N/2 N/2 min(X) max(X)]);
 
title(['DFT of ',num2str(N), 'Pt Sequence']);
xlabel('Time index n');
ylabel('Amplitude');
axis;
