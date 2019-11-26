clf
clear;
N=256;
noise=random('norm',1,N)/1000000;
winLength=8;
for(i=1:N)
 if i<winLength+1
   winTime(i)=1;
 else winTime(i)=0;
end;
end;

winTime=winTime + noise;
win=20*log10(abs(1/N*fft(winTime)));
plot(win);
