clf(); // clear graph
clear; // clear all variables

N=64;
m1=1; // 1 cycle
m2=2; // 2 cycles
m3=3; // 3 cycles
w=2*%pi;
t=0:N-1;

// Create sub-carrier f1
f1_r=cos(w*t*m1/N); // real
f1_i=sin(w*t*m1/N); // imag
// Create sub-carrier f2
f2_r=cos(w*t*m2/N); // real
f2_i=sin(w*t*m2/N); // imag
// Create sub-carrier f3
f3_r=cos(w*t*m3/N); // real
f3_i=sin(w*t*m3/N); // imag
plot(f1_r);
plot(f1_i);
plot(f2_r);
plot(f2_i);
plot(f3_r);
plot(f3_i);
f=get("current_figure"); // setup graphics window for title
f.figure_name="Overlayed Sinusoides (Time Domain)"; // print title on window

xclick(); // wait for mouse click
clf();    // clear graph

M=1.0;
w=2*%pi;
x=0:N-1;
numSignals = 8; // number of sub-carriers

noise=rand(1,N,'normal'); // random gaussian noise 
noise=noise/1e6;          // peak noise = 1 uV

xTot =zeros(1:N);         // initialize xTot array to all 0's
for i=1:numSignals
xr = cos(i*w*x*M/N);      
xTot = xr + xTot;         // add up all of the sin waves

plot(xTot);               // plot the added sine waves as we add them on
f.figure_name="Summed Sinusoides (Time Domain)"; // print title on window
xclick();                 // pause for mouse click
clf();                    // clear graph
end

y=20*log10(2/N*abs(fft(xTot,-1)));
plot(y);
f.figure_name="Summed Sinusoides (Freq Domain)"; // print title on window

