[t1, y1] = pendelum(0.1, 3, 0.5, "ode45");

showPlot(t1, y1, 1);
showPlot(t1, y1, 2);


function showPlot(t1, y1, plotNr)

    figure(plotNr);
    subplot(2, 1, 1);
    plot(t1, y1(:,1),'red',...
         t1, y1(:,2),'green',...
         t1, y1(:,3),'blue',...
         t1, y1(:,4),'black');
    legend('d x', 'x', 'd \phi', '\phi');
    
    subplot(2, 1, 2);
    plot(y1(:,4), y1(:,2));
end





function [t1, y1] = pendelum(m, C, L0, fnc)
    p = setinit(m, C, L0);
    
    [t1, y1] = feval(fnc, @schwinger, [0 5], [0; 1; 0; pi / 4], [], p);
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