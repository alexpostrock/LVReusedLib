////////////////////////////////////////////////////////////////////////////////////////////////
// Demonstrates How the phase imbalance shows up in the bin
// Adjust either the 'numIterations' or 'phi_imbal_default value higher to see a more dramatic effect 
////////////////////////////////////////////////////////////////////////////////////////////////

N=64 ;
// number of points

M = 10;
// number of cycles

Ac = 1;
As = 1;
// sine and cosine amplitudes

phi_imbal_default = .001 // degrees

numIterations = 5;
// number of for loop iterations

for(iter=1:numIterations)
phirad = phi_imbal_default*10^(iter-1)*%pi/180
// convert to radians
// each iteration we are increasing the phase imbalance by a factor of 10

t=0:N-1;

w=2*%pi*M*t/N;

c=Ac*cos(w+phirad);
// c = real signal -> cosine

s=As*sin(w)*%i;
// s = imaginary signal -> sine

v=c+s; 
// v = complex vector -> cos + j*sin

vfft=fft(v,-1)/N;
//FFT must be divided by n to get true Voltage value

vabs=abs(vfft);
// absolute value [Xr^2 + Xi^2]^.5

vPower = vabs^2; // Power = Xr^2 + Xi^2

printf('Bin %i  Power = %5.3f Watts\n',(M+1),vPower(M+1));
printf('Bin %i  Power = %5.3f Watts\n',(N-M+1),vPower(N-M+1));
clf();

vdb = 10*log10(vPower);
xtitle(['Power dB']);
// add title to the graph
plot(vdb);

printf('Bin %i Result = %5.3f V\n',(M+1),vabs(M+1));
printf('Bin %i Result = %5.3f V\n',(N-M+1),vabs(N-M+1));
//vImbal = 20*log10(2*vabs(N-M+1));
//printf('Voltage imbalance = %5.3f dB\n',vImbal);


printf('Bin %i Result = %5.3f dB\n',(M+1),vdb(M+1));
printf('Bin %i Result = %5.3f dB\n',(N-M+1),vdb(N-M+1));

pwrTot = vPower(M+1) + vPower(N-M+1);
printf('Total power = %5.3f Watts\n',pwrTot);

pwrTotdB = 10*log10(pwrTot);
printf('Total power = %5.3f dB\n',pwrTotdB);

pwrImbal = vdb(N-M+1);
printf('Power imbalance = %5.3f dBc\n',pwrImbal);

xclick(); 
// wait for mouse click

end;



