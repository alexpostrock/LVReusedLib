%////////////////////////////////////////////////////////////////////////////////////////////////
%// Demonstrates How the amplitude imbalance shows up in the bin
%// Adjust either the 'numIterations' or 'imbal_default value higher to see a more dramatic effect 
%////////////////////////////////////////////////////////////////////////////////////////////////

% number of points
N=64 ;

% number of cycles
M = 10;

% sine and cosine amplitudes
Ac = 1;
As = 1;

imbal_default = 1e-12; % amplitude imbalance  (volts)
%sprintf('Imbalance = %5.3f Volts\n', imbal)

% number of for loop iterations
numIterations = 5;

for(iter=1:numIterations)
% each iteration we are increasing the amplitude imbalance by a factor of 10
imbal=imbal_default*10^iter;

phi   = 0; % phase imbalance (degrees)
phirad = phi*pi/180; % convert to radians

t=0:N-1;

w=2*pi*M*t/N;

% c = real signal -> cosine
c=(Ac-imbal)*cos(w+phirad);

% s = imaginary signal -> sine
s=As*sin(w)*i;

% v = complex vector -> cos + j*sin
v=c+s; 

%FFT must be divided by n to get true Voltage value
vfft=fft(v)/N;

% absolute value [Xr^2 + Xi^2]^.5
vabs=abs(vfft);

vPower = vabs.^2; % Power = Xr^2 + Xi^2

sprintf('Bin %i  Power = %5.3f Watts\n',(M+1),vPower(M+1))
sprintf('Bin %i  Power = %5.3f Watts\n',(N-M+1),vPower(N-M+1))
clf;

vdb = 10*log10(vPower);
plot(vdb);
% add title to the graph
title('Power dB');

sprintf('Bin %i Result = %5.3f V\n',(M+1),vabs(M+1));
sprintf('Bin %i Result = %5.3f V\n',(N-M+1),vabs(N-M+1));
%vImbal = 20*log10(2*vabs(N-M+1));
%sprintf('Voltage imbalance = %5.3f dB\n',vImbal);


sprintf('Bin %i Result = %5.3f dB',(M+1),vdb(M+1))
sprintf('Bin %i Result = %5.3f dB',(N-M+1),vdb(N-M+1))

pwrTot = vPower(M+1) + vPower(N-M+1);
sprintf('Total power = %5.3f Watts\n',pwrTot);

pwrTotdB = 10*log10(pwrTot);
sprintf('Total power = %5.3f dB\n',pwrTotdB)

pwrImbal = vdb(N-M+1);
sprintf('Power imbalance = %5.3f dBc\n',pwrImbal)

% wait for mouse click
waitforbuttonpress; 

end;