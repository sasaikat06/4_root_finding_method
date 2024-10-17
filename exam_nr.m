	% MATLAB code for Newton-Raphson Method
% Newton-Raphson Method with Graph Plotting
clc;
clear;

% Define the function f(x) and its derivative f'(x)
f = @(x) x.^3 - 3*x - 5;        % Example equation: f(x) = x^3 - 3x - 5
df = @(x) 3*x.^2 - 3;           % Derivative: f'(x) = 3x^2 - 3

% Initial guess
x0 = 2;                         % Starting point

% Tolerance for stopping criteria
tol = 1e-5;

% Maximum number of iterations
max_iter = 20;

% Array to store iteration values
iter_vals = [];
root_vals = [];

% Newton-Raphson method
for iter = 1:max_iter
x1 = x0 - f(x0)/df(x0);      % Update x using Newton-Raphson formula

% Store iteration values for plotting
iter_vals = [iter_vals, iter];
root_vals = [root_vals, x1];

% Check for convergence
if abs(f(x1)) < tol || abs(x1 - x0) < tol
break;
end

% Update x0 for next iteration
x0 = x1;
end

% Display the root
fprintf('The root is approximately: %f\n', x1);

% Plotting the function
x_vals = linspace(x1 - 2, x1 + 2, 1000); % Range around the found root
y_vals = f(x_vals);
figure;
plot(x_vals, y_vals, 'b', 'LineWidth', 2);
hold on;

% Mark the iterations on the graph
for i = 1:length(root_vals)
plot(root_vals(i), f(root_vals(i)),'ro', 'MarkerSize', 8, 'MarkerFaceColor','r');
text(root_vals(i), f(root_vals(i)), sprintf(' Iter %d', iter_vals(i)),'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
end

% Mark the x-axis and y-axis
plot(x_vals, zeros(size(x_vals)), 'k--', 'LineWidth', 1); % x-axis
xlabel('x');
ylabel('f(x)');
title('Newton-Raphson Method Root Finding');
grid on;
hold off;
