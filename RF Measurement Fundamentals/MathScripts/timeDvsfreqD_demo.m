%%%%%%%%%%%%%%%%
% Demos Time Domain vs Frequency Domain Relationship of a simple sinusoid + noise
%%%%%%%%%%%%%%%%

clf; % clear graphic screen
clear; % clear all variables

N=256; % Number of points
M=10;  % Number of sine waves
w=2*pi; 
x=0:N-1; % array 0 to N-1

noise=random('norm',0,1, [1,N]); % Gaussian noise with amplitudes distributed from 0 to 1 Volt
noise=noise/1e6; % Make the max noise 1uV, so divide the entire array by 1e6

%%%%%%%%%%%%%%%%%%%%
% Desired Signal
%%%%%%%%%%%%%%%%%%%%
desired_signal = 1*cos(w*x*M/N); % simple 10 cycle cosine with 1V p-p amplitude

plot(desired_signal); % plot time domain of desired signal only
%set("figure_style","new");
%f=get("current_figure"); % setup graphics window for title
title('Desired Signal (Time Domain)'); % print title on window

figure;

ydesired=20*log10(2/N*abs(fft(desired_signal,-1))); % Absolute valued array of FFT of the desired signal 
plot(ydesired); % plot frequency domain of desired signal
title('Desired Signal (Frequency Domain)'); % print title on window


%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Desired Signal + Noise
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
total_signal = desired_signal + noise;

figure;
plot(total_signal); % plot time domain of total signal
title('Total Signal (Time Domain)'); % print title on window

figure;
ytotal=20*log10(2/N*abs(fft(total_signal,-1))); % Absolute valued array of FFT of the total signal 
plot(ytotal); % plot frequency domain of total signal
title('Total Signal (Frequency Domain)'); % print title on window

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Overlay Both time domain signals
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure;
plot(x',[desired_signal',total_signal']);
title('Both Signals (Time Domain)'); % print title on window

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Overlay Both freq domain signals
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure;
plot(x',[ydesired',ytotal']);
title('Both Signals (Frequency Domain)'); % print title on window
