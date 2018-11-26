[t1, y1, p1] = pendelum(0.1, 3, 0.5, "ode45", 1);
[t2, y2, p2] = pendelum(0.2, 3, 0.5, "ode45", 2);
[t3, y3, p3] = pendelum(0.1, 6, 0.5, "ode45", 3);
[t4, y4, p4] = pendelum(0.1, 3, 1, "ode45", 4);
[t5, y5, p5] = pendelum(0.1, 3, 0.5, "ode23", 5);



showPlotWithDiff(t1, y1, t1, y1, 1, p1, p1);
showPlotWithDiff(t1, y1, t2, y2, 2, p1, p2);
showPlotWithDiff(t1, y1, t3, y3, 3, p1, p3);
showPlotWithDiff(t1, y1, t4, y4, 4, p1, p4);
showPlotWithDiff(t1, y1, t5, y5, 5, p1, p5);


function showPlot(t1, y1, plotNr, inpars)

    figure(plotNr);
    subplot(3, 1, 1);
    plot(t1, y1(:,1),'red',...
         t1, y1(:,2),'green',...
         t1, y1(:,3),'blue',...
         t1, y1(:,4),'black');
    legend('d x', 'x', 'd \phi', '\phi');
    title("Simulation " + inpars.simNr)
    ylabel("Time");
    xlabel("m = " + inpars.m + "; C = " + inpars.C + ...
           "; L0 = " + inpars.L0 + "; fnc = " + inpars.fnc);
    
    subplot(3, 1, 2);
    plot(y1(:,4), y1(:,2));
    ylabel("Movement");
    
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
    ylabel("\Delta Time");
    xlabel({"m_" + inpars1.simNr + " = " + inpars1.m + " C_" + inpars1.simNr + " = " + inpars1.C + ...
           "; L0_" + inpars1.simNr + " = " + inpars1.L0 + "; fnc_" + inpars1.simNr + " = " + inpars1.fnc ; ...
           "m_" + inpars2.simNr + " = " + inpars2.m + " C_" + inpars2.simNr + " = " + inpars2.C + ...
           "; L0_" + inpars2.simNr + " = " + inpars2.L0 + "; fnc_" + inpars2.simNr + " = " + inpars2.fnc });
end




function [t1, y1, inpars] = pendelum(m, C, L0, fnc, simNr)
    p = setinit(m, C, L0);
    
    [t1, y1] = feval(fnc, @schwinger, [0 5], [0; 1; 0; pi / 4], [], p);
    inpars.m = m;
    inpars.C = C;
    inpars.L0 = L0;
    inpars.fnc = fnc;
    inpars.simNr = simNr;
end

function [dz] = schwinger(~, z, p)
    L1 = z(1);
    L0 = z(2);
    Phi1 = z(3);
    Phi0 = z(4);
    
    L2 = (p.g *  p.m * cos(Phi0) - p.C * L0 + p.C * p.L0 + p.m * L0 * Phi1^2) / p.m;
    Phi2 = - ( ( p.g * sin(Phi0) + 2 * L1 * Phi1) / L0 );
    dz = [L2;L1;Phi2;Phi1];
end

function [p] = setinit(m, C, L0)
    p.m = m;
    p.C = C;
    p.L0 = L0;
    p.g = 9.81;
end
     

%{
function [] = simdg11()
    p = setpar();
    tend = 10;
    p.D = 1.0;
    [t1, y1] = ode23(@masseDg1, [0 tend], [p.v0; p.x0], [], p);
    p.D = 1.5;
    [t2, y2] = ode23(@masseDg1, [0 tend], [p.v0; p.x0], [], p);
    
    diffy = y1(:,2) - interp1(t2, y2(:,2), t1);
    
    subplot(1, 2, 1);
    plot(t1, y1(:,2), "b-", t2, y2(:,2), "k-.", t1, diffy, "m--");
    
    xlabel("t [sec]"); ylabel('x [m]');
    legend("x_1 D = 1.0", "x_2 D = 1.5", "x_1 - x_2");
    
    subplot(1, 2, 2);
    plot(y1(:,1), y1(:,2), "b-", y2(:,1), y2(:,2), "k-.");
    xlabel("v [m/s]"); ylabel("x [m]");
end

function [p] = setpar()
    p.C = 20.0;
    p.D = 2;
    p.m = 3.0;
    p.F = 10;
    p.x0 = 0.0;
    p.v0 = 0.0;
end

function [dz] = masseDg1(t, z, p)
    v = z(1);
    x = z(2);
    dv = (1 / p.m) * ( -p.C * x - p.D * v + p.F);
    dx = v;
    dz = [dv;dx];
end
%}

%{
function minimal_example()
    [t,y] = ode23(@dg1, [0 10], [2]);
    plot(t, y(:,1));
    xlabel('t [sec]');
end

function [dy] = dg1(t, y)
    T = 3.0;
    K = 4.0;
    dy = 1 / T * (K - y);
end
%}


%{
function run_simPT11()
    global p
    p.T = 5; p.K = 4;
    [t1, z1] = ode23(@mydg1xx, [0 30], [0]);
    p.T = 8; p.K = 4;
    [t2, z2] = ode23(@mydg1xx, [0 30], [0]);
    plot(t1, z1(:,1), t2, z2(:,1));
    legend('T = 5', 'T = 8');
end


function [dz] = mydg1xx(t, z)
    u = 1;
    y = z(1);
    dy = 1 / p.T * (p.K * u - y);
    dz = [dy];
end
%}