%///////////////////////////////////////
%// Demo of Non-Coherency Effect
%//////////////////////////////////////

clf;  % clear graphs
clear; % clear any data and/or variables

N=128;
w=2*pi;

%//////////////////////
% All Signals Coherent
%//////////////////////
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
plot(y_total); % time domain of all signals
waitforbuttonpress;
clf;


yfreq=fft(y_total);
yabs=(2/N)*abs(yfreq); % take the absolute value

ypwr=20*log10(yabs); % Power

plot(ypwr);
waitforbuttonpress;
clf;

%//////////////////////
% Spur 2 Non-Coherent
%%////////////////////
m1=10.0;  % fundamental signal (10 cycles)
m2=20.0; % 2nd harmonic
m3=30.0; % 3rd harmonic
m4=17.0;  % spur 1
m5=18.5;  % spur 2

t=0:N-1;

y_fund=cos(w*t*m1/N);
y_harm1=.003*cos(w*t*m2/N);
y_harm2=.001*cos(w*t*m3/N);
y_spur1=.0001*cos(w*t*m4/N);
y_spur2=.0003*cos(w*t*m5/N);

y_total = y_fund + y_harm1 + y_harm2 + y_spur1 + y_spur2;
plot(y_total); % time domain of all signals
waitforbuttonpress;
clf;

yfreq=fft(y_total);

yabs=(2/N)*abs(yfreq); % take the absolute value

ypwr=20*log10(yabs); % Power

plot(ypwr);

