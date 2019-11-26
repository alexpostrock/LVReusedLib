clf;
clear;
N=64;
n=256;

%Hamming Window
%w=window('hm',N);
w=hamming(N);
subplot(121);
plot(1:N,w,'b')
%set(gca(),'grid',[1 1]*color('gray'))
subplot(122)
[W,fr]=freqz(w,[1],n);
%[W,fr]=frmag(w,n);
plot(fr,20*log10(W),'b')
%set(gca(),'grid',[1 1]*color('gray'))

waitforbuttonpress;

%Hanning Window
%whan=window('hn',N);
whan=hanning(N);
hold on
subplot(121);
plot(1:N,whan,'g')

subplot(122)
[Whan,fr]=freqz(whan,[1],n);
%[Whan,fr]=frmag(whan,n);
plot(fr,20*log10(Whan),'g')
hold off