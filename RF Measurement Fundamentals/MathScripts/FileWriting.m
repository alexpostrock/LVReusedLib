clf % clears existing plots
clear % clear variable memory

N=1024;

noise=randn(1,N);
%noise=randn(1,N);
noise=noise/1000;

%if MSDOS
%unix('del noiseFile.txt');
%else
%unix('rm -f noiseFile.txt');
%end

xr = noise;
plot(xr);

fid = fopen('noiseFile.txt', 'w');
q=fprintf(fid, '%f\n', xr);

% waits for mouse click
clf;% clear plot

X=fft(xr,-1); % forward FFT
XdB = 20*log10(2/N*abs(X));
plot(XdB);

