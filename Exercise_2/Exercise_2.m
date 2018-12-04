% Exercise 2
% Group 13
% Jakob Fichtl - 29450
% Michael Zappe - 29901

% a) is in the functions pendelum, schwinger, setinit
% b) are the two upper sub plots in all shown plots
% c) is the bottom sub plot in all shown plots
% d) We had no problems.

%% Run simulations
 
[t1, y1, p1] = pendelum(0.1, 3, 0.5, "ode45", 1);
[t2, y2, p2] = pendelum(0.2, 3, 0.5, "ode45", 2);
[t3, y3, p3] = pendelum(0.1, 6, 0.5, "ode45", 3);
[t4, y4, p4] = pendelum(0.1, 3, 1, "ode45", 4);
[t5, y5, p5] = pendelum(0.1, 3, 0.5, "ode23", 5);


%% Draw plots

showPlotWithDiff(t1, y1, t1, y1, 1, p1, p1);
showPlotWithDiff(t1, y1, t2, y2, 2, p1, p2);
showPlotWithDiff(t1, y1, t3, y3, 3, p1, p3);
showPlotWithDiff(t1, y1, t4, y4, 4, p1, p4);
showPlotWithDiff(t1, y1, t5, y5, 5, p1, p5);

%% Plot functions
function showPlot(t1, y1, plotNr, inpars)

    figure(plotNr);
    subplot(3, 1, 1);
    plot(t1, y1(:,1),'red',...
         t1, y1(:,2),'green',...
         t1, y1(:,3),'blue',...
         t1, y1(:,4),'black');
    legend('d x', 'x', 'd \phi', '\phi');
    title("Simulation " + inpars.simNr)
    ylabel("Movement");
    xlabel({"Time" ; ...
           "m = " + inpars.m + "; C = " + inpars.C + ...
           "; L0 = " + inpars.L0 + "; fnc = " + inpars.fnc });
    
    subplot(3, 1, 2);
    plot(y1(:,4), y1(:,2));
    ylabel("Movement");
    xlabel("Angle");
    
    set(gcf, 'Position', [700 100 500 750]);
end

function showPlotWithDiff(t1, y1, t2, y2, plotNr, inpars1, inpars2)
    showPlot(t2, y2, plotNr, inpars2);
    
    subplot(3, 1, 3);
    showDiffPlot(t1, y1, t2, y2, inpars1, inpars2);
end

function showDiffPlot(t1, y1, t2, y2, inpars1, inpars2)

    diff1 = y1(:,1) - interp1(t2, y2(:,1), t1);
    diff2 = y1(:,2) - interp1(t2, y2(:,2), t1);
    diff3 = y1(:,3) - interp1(t2, y2(:,3), t1);
    diff4 = y1(:,4) - interp1(t2, y2(:,4), t1);

    
    %figure(plotNr);
    plot(t1, diff1, 'red', ...
         t1, diff2, 'green', ...
         t1, diff3, 'blue', ...
         t1, diff4, 'black');
    legend('d x', 'x', 'd \phi', '\phi');
    title("Differences between simulations " + inpars1.simNr + " & " + inpars2.simNr)
    ylabel("\Delta Movement");
    xlabel({"Time" ; ...
           "m_" + inpars1.simNr + " = " + inpars1.m + " C_" + inpars1.simNr + " = " + inpars1.C + ...
           "; L0_" + inpars1.simNr + " = " + inpars1.L0 + "; fnc_" + inpars1.simNr + " = " + inpars1.fnc ; ...
           "m_" + inpars2.simNr + " = " + inpars2.m + " C_" + inpars2.simNr + " = " + inpars2.C + ...
           "; L0_" + inpars2.simNr + " = " + inpars2.L0 + "; fnc_" + inpars2.simNr + " = " + inpars2.fnc });
end



%% Simulation of pendelum
function [t1, y1, inpars] = pendelum(m, C, L0, fnc, simNr)
    p = setinit(m, C, L0);
    
    [t1, y1] = feval(fnc, @schwinger, [0 5], [0; 1; 0; pi / 4], [], p);
    inpars.m = m;
    inpars.C = C;
    inpars.L0 = L0;
    inpars.fnc = fnc;
    inpars.simNr = simNr;
end

%% Differential equations
function [dz] = schwinger(~, z, p)
    L1 = z(1);
    L0 = z(2);
    Phi1 = z(3);
    Phi0 = z(4);
    
    L2 = (p.g *  p.m * cos(Phi0) - p.C * L0 + p.C * p.L0 + p.m * L0 * Phi1^2) / p.m;
    Phi2 = - ( ( p.g * sin(Phi0) + 2 * L1 * Phi1) / L0 );
    dz = [L2;L1;Phi2;Phi1];
end

%% Init the parameter p
function [p] = setinit(m, C, L0)
    p.m = m;
    p.C = C;
    p.L0 = L0;
    p.g = 9.81;
end