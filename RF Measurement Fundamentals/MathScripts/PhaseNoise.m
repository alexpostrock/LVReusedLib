% number of points
n=64;

% number of cycles
m = 2;

noise=random('norm',1,n);
noise=noise/10000;

Ac = 1;

%phi   = 0.0; % phase imbalance (degrees)
%phirad = phi*pi/180;

t=1:n;

w=2*pi*m*t/n;

c=Ac*cos(w);

v=c;
plot(v);
waitforbuttonpress;
clf;

vfft=fft(v)/n; %FFT must be divided by n to get true Voltage value

vabs=abs(vfft); % absolute value [Xr^2 + Xi^2]^.5

vPower = vabs.^2; % Power = Xr^2 + Xi^2
%sprintf('Bin %i  Power = %5.3f Watts\n',(m+1),vPower(m+1));
%sprintf('Bin %i  Power = %5.3f Watts\n',(n-m+1),vPower(n-m+1));

%title('Power Watts');
%clf;

vdb = 10*log10(vPower);
plot(vdb);

%sprintf('Bin %i Result = %5.3f V\n',(m+1),vabs(m+1))
%sprintf('Bin %i Result = %5.3f V\n',(n-m+1),vabs(n-m+1))
%vImbal = 20*log10(2*vabs(n-m+1));
%sprintf('Voltage imbalance = %5.3f dB\n',vImbal)


%sprintf('Bin %i Result = %5.3f dB\n',(m+1),vdb(m+1));
%sprintf('Bin %i Result = %5.3f dB\n',(n-m+1),vdb(n-m+1));

%pwrTot = vPower(m+1) + vPower(n-m+1);
%sprintf('Total power = %5.3f Watts\n',pwrTot);
%pwrTotdB = 10*log10(pwrTot);
%sprintf('Total power = %5.3f dB\n',pwrTotdB);

%pwrImbal = vdb(m+1) - vdb(n-m+1);
%printf('Power imbalance = %5.3f dBc\n',pwrImbal);

waitforbuttonpress;

%//////////////////////////////////////
w=2*pi*m*t/n + noise;
c=Ac*cos(w);

v=c;

vfft=fft(v)/n; %FFT must be divided by n to get true Voltage value

vabs=abs(vfft); % absolute value [Xr^2 + Xi^2]^.5

vPower = vabs.^2; % Power = Xr^2 + Xi^2
vdb = 10*log10(vPower);
plot(vdb);
%title('Power dB');
