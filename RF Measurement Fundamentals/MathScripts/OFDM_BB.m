clear;
close all;

subplot(2,2,1);
N=64;
m1=1;
m2=2;
m3=3;
w=2*pi;
t=0:63;
% Create sub-carrier f1
f1_r=cos(w*t*m1/N);
f1_i=sin(w*t*m1/N);
% Create sub-carrier f2
f2_r=cos(w*t*m2/N);
f2_i=sin(w*t*m2/N);
% Create sub-carrier f3
f3_r=cos(w*t*m3/N);
f3_i=sin(w*t*m3/N);
plot(f1_r);
plot(f1_i);
plot(f2_r);
plot(f2_i);
plot(f3_r);
plot(f3_i);
% Place Data on f1
s1_r=3*f1_r;
s1_i=2*f1_i;
s1p= s1_r + s1_i; % for graphical understanding only
s1 = s1_r + s1_i;
% Place Data on f2
s2_r=0*f2_r;
s2_i=0*f2_i;
s2p= s2_r + s2_i; % for graphical understanding only
s2 = s2_r + i*s2_i;
% Place Data on f3
s3_r=0*f3_r;
s3_i=0*f3_i;
s3p= s3_r + s3_i; % for graphical understanding only
s3 = s3_r + i*s3_i;

subplot(2,2,2);
spTot=s1p+s2p+s3p; % for graphical understanding only
plot(spTot);
subplot(2,2,3);
% Build Symbol
sTot = s1 + s2 + s3;
RecWv = fft(sTot,-1)/64;
Rr=real(RecWv);
Ir=imag(RecWv);
plot(Rr);
subplot(2,2,4);
plot(Ir);
