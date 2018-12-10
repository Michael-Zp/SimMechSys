clear
clc
p.TSim = 10;
p.K = 5;
p.T = 4;

sim('exercise_3b', [0 p.TSim]);

showPlot(scope0T, scope0D, "Clock", 1);
showPlot(scope1T, scope1D, "Sinus", 2);
showPlot(scope2T, scope2D, "Random Number", 3);
showPlot(scope3T, scope3D, "Repeating Sequence Stair", 4);
showPlot(scope4T, scope4D, "Step", 5);
showPlot(scope5T, scope5D, "Signal Generator", 6);

function showPlot(scopeT, scopeD, name, plotNr)
    figure(plotNr);

    y1 = scopeT;
    subplot(2,1,1)
    plot(y1.time, y1.signals(2).values,'b', ...
         y1.time, y1.signals(1).values,'r');
    
    title(name + " - transfer function");
    legend('K=5','T=4');
    xlabel("t[sec]");

    y2 = scopeD;
    subplot(2,1,2)
    plot(y2.time, y2.signals(2).values,'b', ...
         y2.time, y2.signals(1).values,'r');
    
    title(name + " - differential equation");
    legend('K=5','T=4');
    xlabel("t[sec]");
end