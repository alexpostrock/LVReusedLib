clf;
clear;

N=256;
M=5.0;
w=2*pi;
x=0:N-1;

Gain   =  8.0;   % Linear Gain
alpha2 =   .01;  % 2nd order non-linear term
alpha3 =   .03;  % 3rd order non-linear term

noise=random('norm',1,N); % Gaussian Noise
noise=noise/1e4;          % keep the noise small
%noise=0;
bt1 = 20;
bt2 = 23;
tone1 = 1*cos(w*x*bt1/N);
tone2 = 1*cos(w*x*bt2/N);

xr = tone1 + tone2; % two tones
plot(xr); % plot time domain of two tones
title('Two Tone (Time Domain)');
waitforbuttonpress;
clf;

y=20*log10(2/N*abs(fft(xr)));
plot(y)
title('Two Tone Linear Power');
waitforbuttonpress;
clf

xnonL = Gain*(tone1+tone2) + alpha2.^2*(tone1+tone2).^2 + alpha3.^3*(tone1+tone2).^3; % non-Linear time domain
ynonL = 20*log10(2/N*abs(fft(xnonL))); % non-linear frequency domain
plot(ynonL); % plot frequency domain
title('Two Tone Non-Linear Power');

% calculate IP3 products
ip3_2l = ynonL(bt1+1) + (ynonL(bt1+1)-ynonL(bt1-(bt2-bt1)+1))/2;
ip3_1  = ynonL(bt2+1) + (ynonL(bt2+1)-ynonL(bt1-(bt2-bt1)+1))/2;
ip3_2u = ynonL(bt2+1) + (ynonL(bt2+1)-ynonL(bt2+(bt2-bt1)+1))/2;
ip3_2  = ynonL(bt1+1) + (ynonL(bt1+1)-ynonL(bt2+(bt2-bt1)+1))/2;

sprintf('Begin')
sprintf('IP3 = %5.3f dBm', ip3_2l)
sprintf('IP3 = %5.3f dBm', ip3_1)
sprintf('IP3 = %5.3f dBm', ip3_2u)
sprintf('IP3 = %5.3f dBm', ip3_2)


	
