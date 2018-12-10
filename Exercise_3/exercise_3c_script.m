clear
clc

p.TSim = 10;
p.F = 10;         % [N] inital force 
p.m = 10;         % [kg] mass 
p.D = 3;          % [N sec/m]damping 
p.C = 100;        % [N/m] spring constant
runThis(p, 1)

p.F = 40;         % [N] inital force 
runThis(p, 2)

p.F = 10;         % [N] inital force 
p.m = 20;         % [kg] mass 
runThis(p, 3)

p.m = 10;         % [kg] mass 
p.D = 0.1;        % [N sec/m]damping 
runThis(p, 4)


p.D = 3;          % [N sec/m]damping 
p.C = 1337;       % [N/m] spring constant
runThis(p, 5)


p.F = 1;         % [N] inital force 
p.m = 10;         % [kg] mass 
p.D = -3;          % [N sec/m]damping 
p.C = 100;        % [N/m] spring constant
runThis(p, 6)

p.F = 10;         % [N] inital force 
p.m = 5;         % [kg] mass 
p.D = 5;          % [N sec/m]damping 
p.C = -2;        % [N/m] spring constant
runThis(p, 7)

function runThis(p, plotNr)
    sim('exercise_3c', [0 p.TSim]);


    figure(plotNr)
    y1 = scope;
    plot(y1.time, y1.signals(1).values,'r', ...
         y1.time, y1.signals(2).values,'g', ...
         y1.time, y1.signals(3).values,'b', ...
         y1.time, y1.signals(4).values,'black', ...
         y1.time, y1.signals(5).values,'m');

    title("Moving mass model");
    legend("Initial force", "Current force", "Acceleration", "Velocity", "Distance");
    str = "F = " + p.F + "; m = " + p.m + "; p.D = " + p.D + "; p.C = " + p.C;
    xlabel({"t[sec]";str});
end