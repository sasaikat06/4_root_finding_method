% Bisection Method with Graph Plotting, Unique Iteration Colors, and Value-Based Legend
clc;
clear;

% Define the function f(x) you want to find the root for
f = @(x) 2*x.^3 - 3*x - 6; % Example equation: x^3 - 3x - 5 = 0

% Define the initial interval [a, b]
a = 1;
b = 2;

% Tolerance for stopping criteria
tol = 1e-3;

% Maximum number of iterations
max_iter = 20;

% Array to store iteration values
iter_vals = [];
root_vals = [];
color_map = hsv(max_iter); % Create a colormap for unique colors

% Bisection method
for iter = 1:max_iter
    % Midpoint
    c = (a + b) / 2;

    % Store iteration values for plotting
    iter_vals = [iter_vals, iter];
    root_vals = [root_vals, c];

    % Check the function value at the midpoint
    if abs(f(c)) < tol || (b - a)/2 < tol
        break;
    end

    % Update the interval based on the sign of f(a)*f(c)
    if f(a) * f(c) < 0
        b = c;
    else
        a = c;
    end
end

% Display the root
fprintf('The root is approximately: %.5f\n', c);

% Plotting the function
x_vals = linspace(a-1, b+1, 1000);
y_vals = f(x_vals);
figure;
plot(x_vals, y_vals, 'b', 'LineWidth', 2);
hold on;

% Mark the iterations on the graph with unique colors
for i = 1:length(root_vals)
    plot(root_vals(i), f(root_vals(i)), 'o', 'MarkerSize', 8, 'MarkerFaceColor', color_map(i, :));
    text(root_vals(i), f(root_vals(i)), sprintf(' Iter %d', iter_vals(i)), 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right', 'Color', color_map(i, :));
end

% Mark the x-axis and y-axis
plot(x_vals, zeros(size(x_vals)), 'k--', 'LineWidth', 1); % x-axis
xlabel('x');
ylabel('f(x)');
title('Bisection Method Root Finding');
grid on;

% Create a legend with values and corresponding colors
legend_labels = cell(1, length(root_vals));
for i = 1:length(root_vals)
    legend_labels{i} = sprintf('Iter %d (%.5f)', iter_vals(i), root_vals(i));
end
legend(legend_labels, 'Location', 'northwest');

hold off;