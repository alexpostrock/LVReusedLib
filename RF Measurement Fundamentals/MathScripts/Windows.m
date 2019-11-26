clf;
clear;
N=64;
n=256;
%Rectangular Window
noise=randn(1,N);
noise=noise/100000;
%wrect=zeros(1:n);
wrect=ones(1:N);
for i=1:N
 if(i<N+1)
   wrect(i)=1.0;
 else
   wrect(i)=0.0;
 end
end
wrect = wrect + noise;
[Wrect,fr] = freqz(wrect,[1],n);
subplot(321);
plot(1:N,wrect,'r')
subplot(322);
plot(fr,20*log10(Wrect),'r')

%Hamming Window
w=hamming(N);
subplot(323);plot(1:N,w,'b')
%set(gca(),'grid',[1 1]*color('gray'))
subplot(324)
[W,fr]=freqz(w,n);
plot(fr,20*log10(W),'b')
%set(gca(),'grid',[1 1]*color('gray'))

% Hanning Window
whan=hann(N);
subplot(325);plot(1:N,whan,'g')

subplot(326)
[Whan,fr]=freqz(whan,[1],n);
plot(fr,20*log10(Whan),'g')