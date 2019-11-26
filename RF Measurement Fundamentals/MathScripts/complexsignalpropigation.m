clear;
N = 128;
t = N-1:-1:0;
w = 2*pi;
M = 5;

xr = cos(w*t*M/N);
xi = sin(w*t*M/N);

plot(t,xr,'b',t,xi,'r');
%plot2d(t',[xr',xi'],style=[3,5]);
waitforbuttonpress;
clf;

%xi = imult(sin(w*t2*M/N));

%plot(xr);
%plot(xi);

%xttemp = [xr'  xi']; % cos(wt) + jsin(wt)
figure(1);

plot3(xr,xi,t); % spiral of cos(wt) + jsin(wt)
xlabel('Real');
ylabel('Imaginary');
zlabel('Time');

%set("figure_style","new");
%f=get("current_figure");
%f.figure_name="Spiral propigation z(t) = cos(t) + jsin(t)";
%e=gce(); // gets the parent name of the current plot
%e.line_style=1;
%e.thickness=2; // thickens the curve
%e.foreground=2; // blue
%b=get("current_axes");
%b.x_location = "top";
%b.y_location = "left";
%b.data_bounds = [-3,-3,-3;3,3,N-1];


waitforbuttonpress;  %wait for mouse click
%[x,y]=geom3d(xr, xi, t);
%xpoly(x,y,"lines")

N = 128;
t = N-1:-1:0;
w = 2*pi;
M = 5;

xr = cos(w*t*M/N);% real part
xi = sin(w*t*M/N);% imag part

for i = 1:N,
 iar(i) = -2;
 end;
iar = iar';

plot3(xr,iar,t); %draws the projection of %Xr (red)
title('Projection of Real part');
xlabel('Real');
ylabel('Imaginary');
zlabel('Time');
waitforbuttonpress;
%param3d(xr,iar,t,46,4,"Real@Imag@Time"); %draws the projection of %Xr (red)
%set("figure_style","new");
%f=get("current_figure");
%f.figure_name="Projection of Real part";
%e=gce();
%e.thickness=1; // thickens the curve
%e.line_style=2; // type of line
%e.foreground=5; // color of line


plot3(iar,xi,t); 
%param3d(iar,xi,t,46,4,"Real@Imag@Time");
%set("figure_style","new");
%f=get("current_figure");
title('Projection of Imaginary part');
xlabel('Real');
ylabel('Imaginary');
zlabel('Time');
%e=gce();
%e.thickness=1; // thickens the curve
%e.line_style=3;
%e.foreground=3;



