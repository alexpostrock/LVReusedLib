x=linspace(0,2*pi,50);

for t=0:0.05:1
y=t*sin(x);
plot(x,y);
xax = axis;
axis([xax(1:2) -1 1])
pause(.2);
end