clf
clear;
N=64;
n=256;

%Hamming Window
w=hamming(N);
subplot(121);
plot(1:N,w,'b');
subplot(122)
[W,fr]=freqz(w,[1],n);
plot(fr,20*log10(W),'b')
hold
%xclick
% Hanning Window
whan=hann(N);
subplot(121);
plot(1:N,whan,'g')

subplot(122)
[Whan,fr]=freqz(whan,[1],n);
plot(fr,20*log10(Whan),'g')
hold off;