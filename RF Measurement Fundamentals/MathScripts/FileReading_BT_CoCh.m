clf; % clears existing plots
clear; % clear variable memory

N=8428; % hard coded number of rows of file

current_directory = pwd; % print current directory
%chdir(current_directory); % change to current directory

%I=read('bt_des.txt',-1,2); // read I column = 2 of file (-1 -> reads to EOF)
%BT_File=read('bt_coCho.txt',-1,3); // reads 3 columns = 3 of file (-1 -> reads to EOF)
fid=fopen('bt_coCho.txt');
BT_File=fscanf(fid, '%f', [3,inf]);
BT_File=BT_File'; % reads 3 columns = 3 of file (-1 -> reads to EOF)
fclose(fid);
plot(BT_File); % plot I&Q
title('Bluetooth I&Q (Time Domain)'); % print title on window

I = BT_File(1:N,2); % fill up I array
Q = BT_File(1:N,3); % fill up Q array


y_time = I + Q*i;   % add I + jQ

y_freq=20*log10(1/N*abs(fft(y_time,-1))); % Absolute valued array of FFT of the time signal 
% since signal is complex we multiply by 1/N instead of 2/N

y_freq = fftshift(y_freq);

figure;
plot(y_freq); % plot frequency domain of signal
title('Bluetooth Signal (Frequency Domain)'); % print title on window


