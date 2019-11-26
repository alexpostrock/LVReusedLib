clf()
clear;
N=64;
n=256;

//Hamming Window
w=window('hm',N);
subplot(121);plot2d(1:N,w,style=color('blue'))
set(gca(),'grid',[1 1]*color('gray'))
subplot(122)
[W,fr]=frmag(w,n);
plot2d(fr,20*log10(W),style=color('blue'))
set(gca(),'grid',[1 1]*color('gray'))

xclick();
// Hanning Window
whan=window('hn',N);
subplot(121);plot2d(1:N,whan,style=color('green'))

subplot(122)
[Whan,fr]=frmag(whan,n);
plot2d(fr,20*log10(Whan),style=color('green'))
