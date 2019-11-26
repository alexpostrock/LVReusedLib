% Program sinad
% Generation of a sinusoidal sequence
N = 16;
n = 0:N-1;	
f = 2/(N+0); %Changing denominator makes non-coherent
phase = 0;			

A = 1.0; %Scale the amplitude for unity output
arg = 2*pi*f*n - phase; 
x = A*cos(arg); %creates fundamental frequency

%x=x+0.1; %creates a DC offset

noise = 10^((20*log10(A)-100)/20)*randn(1,N); %Creates the noise floor
%x = x + noise;

Ah1=10^((20*log10(A)-70)/20);
harm1=Ah1*cos(2*pi*2*f*n); %creates first Harmonic 30dB down
%x = x + harm1;

Ah2=10^((20*log10(A)-100)/20);
harm2=Ah2*cos(2*pi*3*f*n); %creates second Harmonic 60dB down
%x = x + harm2;

As1=10^((20*log10(A)-100)/20);
spur1=As1*cos(2*pi*1.2*f*n); %creates spur, 100db down
%x = x + spur1;

As2=10^((20*log10(A)-110)/20);
spur2=As2*cos(2*pi*0.7*f*n); %creates spur, 110db down
%x = x + spur2;

As3=10^((20*log10(A)-90)/20);
spur3=As3*cos(2*pi*3.8*f*n); %creates spur, 80db down
%x = x + spur3;

close all;			% Clear old graph
subplot(2,1,1);
plot(n,x);		% Plot the generated sequence
axis([0 N-1 -A A]);
title('Time Domain Sequence');
xlabel('Time index n');
ylabel('Amplitude');
axis;
subplot(2,1,2);
X = fft(x);
Y = abs(X);
Z = Y/N;
%Y = 20*log10(X);
%Y = Y - max(real(Y));
plot(n,Z);		% Plot the FFT of the sequence
axis([0 N-1 min(real(Z)) max(real(Z))]);
 
title('FFT of 1023 Pt Sequence');
xlabel('Time index n');
ylabel('Amplitude in dB');
axis;
