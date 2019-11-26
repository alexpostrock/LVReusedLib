clf; % clear graph
N=64;
t=0:N-1;
w=2*pi*t/N;
noise=rand(1,N)/1e6;
subplot(4,2,1);
data = noise + i*noise;  % initialize the data array to all 0's
m=zeros(3);
% sub-carrier one
m(1)=12;
% sub-carrier two
m(2)=24;
% sub-carrier three
m(3)=48;

% insert data onto sub-carrier one
% I=1, Q=1
data(m(1)) = 1 + i*1;

% insert data onto sub-carrier two
% I=2, Q=-2
data(m(2)) = 2 + i*(-2);

% insert data onto sub-carrier three
% I=-3, Q=3
data(m(3)) = -3 + i*3;

x=data; % sub-carriers
plot(real(x)); % plot the real part = I (1, 2, -3)
%f=get("current_figure"); % setup graphics window for title
title('I data (Freq Domain)'); % print title on window
%clf;
subplot(4,2,2);
plot(imag(x));
title('Q data (Freq Domain)'); % print title on windowxclick();
%clf;

y=(N/2)*fft(x,32); % IFFT the complex array
yreal=abs(real(y));
subplot(4,2,3);
plot(yreal);
title('I data (Time Domain)'); % print title on window

%clf;

yimag=abs(imag(y));
subplot(4,2,4);
plot(yimag);
title('Q data (Time Domain)'); % print title on window

%clf;

% Transmit I&Q
% Receiver captures waveform, downconverts and splits into I&Q time domain waveform
% FFT recevied waveform
% Frequency Spectrum
yfreq = 20*log10((2/N)*abs(fft(y,[],1))); % FFT time domain received data
subplot(4,2,5);
plot(yfreq);
title('Magnitude Frequency Spectrum'); % print title on window

%clf;

yfreal = (2/N)*real(fft(y,[],-1));
yfimag = (2/N)*imag(fft(y,[],-1));
subplot(4,2,6);
plot(yfreal);
title('Received (I) data'); % print title on window

%clf;

subplot(4,2,7);
plot(yfimag);
title('Received (Q) data'); % print title on window



