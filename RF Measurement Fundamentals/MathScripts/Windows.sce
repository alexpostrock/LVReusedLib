clf()
clear;
N=64;
n=256;
//Rectangular Window
noise=rand(1,N,'normal');
noise=noise/100000;
//wrect=zeros(1:n);
wrect=ones(1:N);
for(i=1:N),
 if(i<N+1) then
   wrect(i)=1.0;
 else
   wrect(i)=0.0;
 end,
end,
wrect = wrect + noise;
[Wrect,fr] = frmag(wrect,n);
subplot(121);plot2d(1:N,wrect,style=color('red'))
subplot(122);plot2d(fr,20*log10(Wrect),style=color('red'))
xclick();

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
