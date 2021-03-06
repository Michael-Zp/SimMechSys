clear
clc

% Exercise 4
% Group 13
% Jakob Fichtl - 29450
% Michael Zappe - 29901

%% a)

p.L = 0.23e-3;      % [H]
p.cm = 23.4e-3;     % [Nm / A]
p.R = 2.4;          % [Ohm]
p.J = 0.23e-6;      % [Nm^2]
p.D = 0.4191e-5;    % [N * sec / m]

exercise_4_openLoop

%% b)

p.L = 0.23e-6;      % [H]
p.cm = 23.4e-3;     % [Nm / A]
p.R = 20.4;         % [Ohm]
p.J = 0.23e-8;      % [Nm^2]
p.D = 0.4191e-6;    % [N * sec / m]


%% c)

p.L = 0.23e-3;      % [H]
p.cm = 23.4e-3;     % [Nm / A]
p.R = 2.4;          % [Ohm]
p.J = 0.23e-6;      % [Nm^2]
p.D = 0.4191e-5;    % [N * sec / m]

% Nonstiff
% Current
figure(1)
out1 = sim('exercise_4_openLoop', 'Solver', 'ode45');

out2 = sim('exercise_4_openLoop', 'Solver', 'ode23');

out3 = sim('exercise_4_openLoop', 'Solver', 'ode113');

plot(out1.MotorCurrent.time, out1.MotorCurrent.signals.values, 'r--', ...
	out2.MotorCurrent.time, out2.MotorCurrent.signals.values, 'b--', ...
	out3.MotorCurrent.time, out3.MotorCurrent.signals.values, 'g--');

title("Nonstiff solvers")
xlabel("Time")
ylabel("Motor current")
legend("ode45", "ode23", "ode113")

% Speed
figure(2)
plot(out1.ScopeData.time, out1.ScopeData.signals.values, 'r--', ...
	out2.ScopeData.time, out2.ScopeData.signals.values, 'b--', ...
	out3.ScopeData.time, out3.ScopeData.signals.values, 'g--');

title("Nonstiff solvers")
xlabel("Time")
ylabel("Motor speed")
legend("ode45", "ode23", "ode113")

% Stiff
% Current
figure(3)
out1 = sim('exercise_4_openLoop', 'Solver', 'ode15s');

out2 = sim('exercise_4_openLoop', 'Solver', 'ode23s');

out3 = sim('exercise_4_openLoop', 'Solver', 'ode23t');

out4 = sim('exercise_4_openLoop', 'Solver', 'ode23tb');

plot(out1.MotorCurrent.time, out1.MotorCurrent.signals.values, 'r--', ...
    out2.MotorCurrent.time, out2.MotorCurrent.signals.values, 'b--', ...
    out3.MotorCurrent.time, out3.MotorCurrent.signals.values, 'g--', ...
    out4.MotorCurrent.time, out4.MotorCurrent.signals.values, 'm--');

title("Stiff solvers")
xlabel("Time")
ylabel("Motor current")
legend("ode15s", "ode23s", "ode23t", "ode23tb")

% Speed
figure(4)
plot(out1.ScopeData.time, out1.ScopeData.signals.values, 'r--', ...
    out2.ScopeData.time, out2.ScopeData.signals.values, 'b--', ...
    out3.ScopeData.time, out3.ScopeData.signals.values, 'g--', ...
    out4.ScopeData.time, out4.ScopeData.signals.values, 'm--');

title("Stiff solvers")
xlabel("Time")
ylabel("Motor speed")
legend("ode15s", "ode23s", "ode23t", "ode23tb")