%//////////////////////////////////////////////
%// Demo of Non-Coherency Effect with Windowing
%//////////////////////////////////////////////

N=128;
n=N*4;
w=2*pi;

%////////////////////////
%// All Signals Coherent
%////////////////////////
m1=10.0;  % fundamental signal (10 cycles)
m2=20.0; % 2nd harmonic
m3=30.0; % 3rd harmonic
m4=17.0;  % spur 1
m5=18.0;  % spur 2

t=0:N-1;

y_fund=cos(w*t*m1/N);
y_harm1=.003*cos(w*t*m2/N);
y_harm2=.001*cos(w*t*m3/N);
y_spur1=.0001*cos(w*t*m4/N);
y_spur2=.0003*cos(w*t*m5/N);

y_total = y_fund + y_harm1 + y_harm2 + y_spur1 + y_spur2;

yfreq=fft(y_total,-1); % -1 means FFT, 1 means IFFT

yabs=(2/N)*abs(yfreq); % take the absolute value

ypwr=20*log10(yabs); % Power

%////////////////////////
%// Spur 2 Non-Coherent
%////////////////////////

m1=10.5;  % fundamental signal (10 cycles)
m2=20.0; % 2nd harmonic
m3=30.0; % 3rd harmonic
m4=15.0;  % spur 1
m5=28.5;  % spur 2

t=0:N-1;

y_fund=cos(w*t*m1/N);
y_harm1=.03*cos(w*t*m2/N);
y_harm2=.01*cos(w*t*m3/N);
y_spur1=.005*cos(w*t*m4/N);
y_spur2=.007*cos(w*t*m5/N);

y_unwindowed = y_fund + y_harm1 + y_harm2 + y_spur1 + y_spur2;

plot(y_unwindowed); % time domain of all signals

%pause

yfreq=fft(y_unwindowed,-1); % -1 means FFT, 1 means IFFT

yabs=(2/N)*abs(yfreq); % take the absolute value

ypwr=20*log10(yabs); % Power
ypwr2=ypwr(1:N/2);

plot(ypwr2);

%pause

%Rectangular Window
wrect=rectwin(N)';
%wrect=window('re',N);
yrect=y_unwindowed.*wrect; % multiply rect window index with each y %data index
subplot(131);
plot(1:N,wrect);

%xstring(0.1,0.5,["Time Domain"]);
%xtitle('Time Domain');

%p.x_label.text="array index";
%p.y_label.text="Window Value";
[Wrect,fr] = freqz(wrect,1,n);
%[Wrect,fr] = frmag(wrect,n);
subplot(132);
plot(fr,20*log10(Wrect));
%xtitle('Freq Domain [Magnitude]');
yfreq=fft(yrect,-1); % -1 means FFT, 1 means IFFT
yabs=(2/N)*abs(yfreq); % take the absolute value
ypwr=20*log10(yabs); % Power
ypwr2=ypwr(1:N/2);
subplot(133);
plot(1:N/2,ypwr2);
%xtitle('Windowed Power Spectrum [dBm]');
%xlable('Frequency Bin');
%ylable('dBm');

%pause

%Hamming Window
wham=hamming(N)';
%wham=window('hm',N);
yham=y_unwindowed.*wham;
subplot(131);
plot(1:N,wham)
%set(gca(),'grid',[1 1]*color('gray'))
subplot(132)
[W,fr]=freqz(wham,1,n);
%[W,fr]=frmag(wham,n);
plot(fr,20*log10(W))
%set(gca(),'grid',[1 1]*color('gray'))
yfreq=fft(yham,-1); % -1 means FFT, 1 means IFFT
yabs=(2/N)*abs(yfreq); % take the absolute value
ypwr=20*log10(yabs); % Power
ypwr2=ypwr(1:N/2);
subplot(133);
plot(1:N/2,ypwr2);
%legend(["Rect" "Hamming"]);

%pause

% Hanning Window
whan=hanning(N)';
%whan=window('hn',N);
yhan=y_unwindowed.*whan;
subplot(131);
plot(1:N,whan)
subplot(132)
[Whan,fr]=freqz(whan,1,n);
%[Whan,fr]=frmag(whan,n);
plot(fr,20*log10(Whan))
yfreq=fft(yhan,-1); % -1 means FFT, 1 means IFFT
yabs=(2/N)*abs(yfreq); % take the absolute value
ypwr=20*log10(yabs); % Power
ypwr2=ypwr(1:N/2);
subplot(133);
plot(1:N/2,ypwr2);

