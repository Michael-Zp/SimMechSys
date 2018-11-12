run_simPT11()

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