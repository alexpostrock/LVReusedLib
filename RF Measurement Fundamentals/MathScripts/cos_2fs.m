n=64 ;
% number of points

m = 10;
% number of cycles

Ac = 1;
As = 0;
% amplitudes

imbal = 0.0; %1e-6; % amplitude imbalance  (volts)
disp(['Imbalance = ' num2str(imbal) ' Volts'])

phi   = 0.0; % phase imbalance (degrees)
phirad = phi*pi/180;

t=1:n;

w=2*pi*m*t/n;

c=Ac*((Ac-imbal)/Ac)*cos(w+phirad);

s=As*sin(w)*i;

v=c+s;

vfft=fft(v,-1)/n; %FFT must be divided by n to get true Voltage value

vabs=abs(vfft); % absolute value [Xr^2 + Xi^2]^.5

%vfftReal = real(vfft)/n;
%vfftImag = imag(vfft)/n;
%vPower     = vfftReal^2 + vfftImag^2;
% both the above real^2 + imag^2 method and the below method %(vabs^2) provide the same ans
vPower = vabs.^2; % Power = Xr^2 + Xi^2
disp(['Bin ' num2str((m+1))  ' Power = ' num2str(vPower(m+1)) ' Watts'])
disp(['Bin ' num2str((n-m+1)) ' Power = ' num2str(vPower(n-m+1)) ' Watts'])

subplot(1,2,1)
plot(vPower);
xlabel('Power Watts');

%vPower(m+1)

%vdb=20*log10(vabs);

subplot(1,2,2)
vdb = 10*log10(vPower);
plot(vdb);
xlabel('Power dB');
%plot(vabs);

disp(['Bin ' num2str((m+1)) ' Result = ' num2str(vabs(m+1)) ' V'])
disp(['Bin ' num2str((n-m+1)) ' Result = ' num2str(vabs(n-m+1)) ' V'])

vImbal = 20*log10(2*vabs(n-m+1));
disp(['Voltage imbalance = ' num2str(vImbal) ' dB\n'])

disp(['Bin ' num2str((m+1)) ' Result = ' num2str(vdb(m+1)) ' V'])
disp(['Bin ' num2str((m+1)) ' Result = ' num2str(vdb(n-m+1)) ' V'])

pwrTot = vPower(m+1) + vPower(n-m+1);
disp(['Total power = ' num2str(pwrTot) ' Watts'])
pwrTotdB = 10*log10(pwrTot);
disp(['Total power = ' num2str(pwrTotdB) ' Watts'])

pwrImbal = vdb(m+1) - vdb(n-m+1);
disp(['Total power = ' num2str(pwrImbal) ' Watts'])
