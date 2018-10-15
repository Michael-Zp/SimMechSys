clc

a = [2; 0; 5];
b = [4; 2; 1];
c = [0; 1; 0];

A = [2 5 2;...
    4 34 8;...
    4 5 2];

B = [2 4 0;...
    3 2 0;...
    6 2 0];

fprintf('%s\n', "A)")

disp(a * transpose(b))
disp(a + b)
disp(A * b)
disp(transpose(A) * c)
disp(abs(A))
disp(abs(B))
disp(inv(A))
disp(inv(B))


fprintf('%s\n', "B)")

fprintf('%s\n\n', "Was on a workshop, I dont have any exercises yet")


fprintf('%s\n', "C)")

steps = 0:0.05:2*pi;
sinValues = sin(steps);
cosValues = cos(steps);
tanValues = tan(steps);
arcsinValues = asin(steps);
arctanValues = atan(steps);

plot(steps, sinValues, "r",...
     steps, cosValues, "g",...
     steps, tanValues, "b")

title("PlotsPlots")
xlabel("Step")
ylabel("MyValues")

%plot(steps, arcsinValues, "c")
%plot(steps, arctanValues, "m")