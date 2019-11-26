close all;
clear;

N=128;
NON=N;
M=1.0;
w=2*pi;
f1=312.5e3;
fs=20e6;
x=0:N-1;
numSignals = 8;

alpha=zeros(1,N);
betta=zeros(1,N);
noise=randn(1,N'); 															% generate normal distributed noise
%noise=noise/10000;
for j =1:N,
 r=rand(1);
 if r<.5 
 alpha(j)=-1;
 else 
 alpha(j)=1;
 end
 r=rand(1);
 if r<.5 
 betta(j)=-1;
 else
 betta(j)=1;
 end
end

for fsChange=1:1
close all;
newfs = fs - (fsChange-1)*1e4;											% adjust fs to see what happens 
xTot =zeros(1,N);

for i=1:numSignals
xr = alpha(i)*cos(i*2*pi*(f1/newfs)*x*M);  						% real part
xi = (betta(i)*sin(i*2*pi*(f1/newfs)*x*M)); % imaginary part
xTot = complex( xr + xTot + xi);															 			% sum up all the waves
end

%xTot = xTot + noise; 																			% add noise to the final signal

plot(abs(xTot));
%xclick();
pause
close all;

y=20*log10(1/N*abs(fft(xTot,-1)));
plot(y);
'fs = ' (newfs/1e6) ' MHz (delta =  '   (fs-newfs)/1e3) ' KHz'
pause

end