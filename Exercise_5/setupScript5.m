clear
clc

% Exercise 7
% Group 13
% Jakob Fichtl - 29450
% Michael Zappe - 29901

p.L = 0.23e-3;      % [H]
p.cm = 23.4e-3;     % [Nm / A]
p.R = 2.4;          % [Ohm]
p.J = 0.23e-6;      % [Nm^2]
p.D = 0.4191e-5;    % [N * sec / m]

pi_p_controller

sim('pi_p_controller')

figure(1);
plot(pControler.time, pControler.signals.values, 'r', ...
piControler.time, piControler.signals.values, 'g', ...
piControlerReal.time, piControlerReal.signals.values, 'b');
xlabel("Time");
ylabel("Speed");
legend("P Controller", "PI Controller", "PI Controller real");
title("Overview")


figure(2);
plot(piControler.time, pControler.signals.values - piControler.signals.values, 'g', ...
piControlerReal.time, pControler.signals.values - piControlerReal.signals.values, 'b');
xlabel("Time");
ylabel("Speed");
legend("P - PI Controller", "P - PI Controller real");
title("P Controller compared to rest")



figure(3);
plot(pControler.time, piControler.signals.values - pControler.signals.values, 'r', ...
piControlerReal.time, piControler.signals.values - piControlerReal.signals.values, 'b');
xlabel("Time");
ylabel("Speed");
legend("PI - P Controller", "PI - PI Controller real");
title("PI Controller compared to rest")



figure(4);
plot(pControler.time, piControlerReal.signals.values - pControler.signals.values, 'r', ...
piControler.time, piControlerReal.signals.values - piControler.signals.values, 'g');
xlabel("Time");
ylabel("Speed");
legend("PI real - P Controller", "Pi real - PI Controller");
title("PI Controller real compared to rest")