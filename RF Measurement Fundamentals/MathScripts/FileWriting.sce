clf(); // clears existing plots
clear; // clear variable memory

N=1024;


chdir('C:\Documents and Settings\Keith Schaub\Desktop');
noise=rand(1,N,'normal');
//noise=rand(1,N,'uniform');
noise=noise/1000;

if MSDOS then unix('del noiseFile.txt');
else unix('rm -f noiseFile.txt'); end

xr = noise;
plot(xr);
write('noiseFile.txt',xr);
xclick(); // waits for mouse click
clf(); // clear plot

X=fft(xr,-1); // forward FFT
XdB = 20*log10(2/N*abs(X));
plot(XdB);


