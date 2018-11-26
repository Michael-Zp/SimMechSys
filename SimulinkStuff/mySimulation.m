clear
p.T = 15;       %[sec] time constant
p.K = 2;        %[] Gain
p.TStep = 4;    %[sec] step time
p.TSim = 20;    %[sec] simulation time
p.y0 = 5;       %[] initial value for state


sim('model', [0 p.TSim]);
y1 = scope;

p.T = 5;

sim('model',[0 p.TSim])
y2 = scope;
plot(y1.time, y1.signals(2).values,'b--',...
     y2.time, y2.signals(2).values,'r-');
 
legend('T=15','T=5');
xlabel('time [sec]');grid;