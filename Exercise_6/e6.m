clear
clc

% Exercise 6
% Group 13
% Jakob Fichtl - 29450
% Michael Zappe - 29901


%% a 

% Code in Outputs
% speed[0]=xC[0];

% Code in Derivatives
% dx[0] = (u0[0] - xC[1] * R[0] - xC[0] * cm[0]) / L[0];
% dx[1] = (xC[1] * cm[0] - xC[0] * D[0]) / J[0];

%% b/c

no_func_model

p.L = 0.23e-3;      % [H]
p.cm = 23.4e-3;     % [Nm / A]
p.R = 2.4;          % [Ohm]
p.J = 0.23e-6;      % [Nm^2]
p.D = 0.4191e-5;    % [N * sec / m]

sim("no_func_model")

figure(1)
subplot(2,1,1)
plot(Scope.time, Scope.signals(1).values, "b" ...
     , Scope.time, Scope.signals(2).values, "r");
title("Open loop simulation");
legend("Model", "S-Function");
xlabel("Time");
ylabel("Speed");
 
subplot(2,1,2)
plot(Scope.time, abs(Scope.signals(1).values - Scope.signals(2).values), "b");
title("Difference between model and S-Function");
xlabel("Time");
ylabel("\Delta Speed");

%% d

% sfundemos % Crashed our Matlab