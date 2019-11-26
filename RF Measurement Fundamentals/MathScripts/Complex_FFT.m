% Program sinad
% Generation of a sinusoidal sequence
N = 2048;
n = 0:N-1;	
f = 200/(N+0); %Changing denominator makes non-coherent
phase = 0;	
phase2 = (2*pi/360)*.001;

A = 1.0000; %Scale the amplitude for unity output
B = 1.;
arg = 2*pi*f*n - phase; 
arg2 = 2*pi*f*n - phase2;
x = A*sin(arg); %creates fundamental frequency
y = B*cos(arg2); %creates sinusoid 90degrees out of phase
core = j*ones(1,N);
yi = y .*core;
x = yi + x;

%x=x+0.1; %creates a DC offset

noise = 10^((10*log10(A)-75)/10)*randn(1,N); %Creates the noise floor
noiseimag = j*10^((10*log10(A)-75)/10)*randn(1,N);
x = x + noise+noiseimag;

Ah1=10^((10*log10(A)-70)/10);
harm1=Ah1*cos(2*pi*2*f*n); %creates first Harmonic 30dB down
%x = x + harm1;

Ah2=10^((10*log10(A)-100)/10);
harm2=Ah2*cos(2*pi*3*f*n); %creates second Harmonic 60dB down
%x = x + harm2;

As1=10^((10*log10(A)-100)/10);
spur1=As1*cos(2*pi*1.2*f*n); %creates spur, 100db down
%x = x + spur1;

As2=10^((10*log10(A)-110)/10);
spur2=As2*cos(2*pi*0.7*f*n); %creates spur, 110db down
%x = x + spur2;

As3=10^((10*log10(A)-90)/10);
spur3=As3*cos(2*pi*3.8*f*n); %creates spur, 80db down
%x = x + spur3;

clf;			% Clear old graph
subplot(1,2,1)
plot(n,x,'-o',n,y,'-d');		% Plot the generated sequence
axis([0 11 -A-.3 A+.3]);
title('Time Domain Sequence');
xlabel('Time index n');
ylabel('Amplitude');
axis;

X = fft(x);
Y = abs(X); %Complex to Magnitude
Y = Y/N;    %Scale results to 1/N
Y = 10*log10(Y);
Y = Y - max(Y);
subplot(1,2,2)
plot((0:length(X)-1),Y);		% Plot the FFT of the sequence
axis([0 (length(X)-1) -100 max(Y)]);
 
title('FFT of 2048 Pt Complex Sequence, .001 deg Phase Imbalance');
xlabel('Freq index n');
ylabel('Amplitude in dB');
axis;