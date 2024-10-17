% Newton-Raphson Method with Graph Plotting, Unique Iteration Colors, and Value-Based Legend
clc;
clear;

% Define the function f(x) and its derivative f'(x)
f = @(x) 3*x - cos(x) -1;        % Example equation: f(x) = 3x - cosx -1 = 0
df = @(x) 3 + sin(x);           % Derivative: f'(x) = 3x^2 - 3

% Initial guess
x0 = 0.5;                         % Starting point

% Tolerance for stopping criteria
tol = 1e-8;

% Maximum number of iterations
max_iter = 20;

% Array to store iteration values
iter_vals = [];
root_vals = [];
color_map = hsv(max_iter); % Create a colormap for unique colors

% Newton-Raphson method
for iter = 1:max_iter
    x1 = x0 - f(x0)/df(x0);      % Update x using Newton-Raphson formula
    fprintf("Iteration %.f, x %.6f , f(x) %.6f\n ",iter, x1, f(x1))
    % Store iteration values for plotting
    iter_vals = [iter_vals, iter];
    root_vals = [root_vals, x1];

    % Check for convergence
    if abs(f(x1)) < tol || abs(x1 - x0) < tol
        break;
    end

    % Update x0 for next iteration
    x0 = x1;
    %fprintf("Iteration %.f, x %.5f , f(x) %.5f\n ",iter, x1, f(x1))
end

% Display the root
fprintf('The root is approximately: %f\n', x1);

% Plotting the function
x_vals = linspace(x1 - 2, x1 + 2, 1000); % Range around the found root
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
title('Newton-Raphson Method Root Finding');
grid on;

% Create a legend with values and corresponding colors
legend_labels = cell(1, length(root_vals));
for i = 1:length(root_vals)
    legend_labels{i} = sprintf('Iter %d (%.5f)', iter_vals(i), root_vals(i));
end
legend(legend_labels, 'Location', 'northwest');

hold off;