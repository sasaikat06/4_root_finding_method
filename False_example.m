% False Position Method for Root Finding with Graph Plotting, Unique Iteration Colors, and Value-Based Legend
clc;
clear;

% Define the function f(x)
f = @(x) x.^3 - 5*x + 3;  % Example equation: f(x) = x^3 - 5x + 3=0

% Initial guesses
a = 1;  % Lower bound
b = 2;  % Upper bound

% Tolerance for stopping criteria
tol = 1e-4;

% Maximum number of iterations
max_iter = 10;

% Arrays to store iteration values and roots
iter_vals = [];
root_vals = [];
color_map = hsv(max_iter); % Create a colormap for unique colors

% False Position Method
for iter = 1:max_iter
    % Calculate the root using the False Position formula
    c = (a*f(b) - b*f(a)) / (f(b) - f(a));
    fprintf("Iteration %.f, a %.5f , b %.5f ,x  %.5f , f(x) %.5f\n ",iter, a, b, c, f(c))


    % Store iteration values for plotting
    iter_vals = [iter_vals, iter];
    root_vals = [root_vals, c];

    % Check for convergence
    if abs(f(c)) < tol
        break;
    end

    % Update the interval
    if f(c) * f(a) < 0
        b = c;  % The root is in the left subinterval
    else
        a = c;  % The root is in the right subinterval
    end
    %fprintf("Iteration %.f, a %.5f , b %.5f ,x  %.5f , f(x) %.5f\n ",iter, a, b, c, f(c))
end

% Display the root
fprintf('The root is approximately: %f\n', c);

% Plotting the function
x_vals = linspace(1, 3, 1000);  % Range around the expected root
y_vals = f(x_vals);
figure;
plot(x_vals, y_vals, 'b', 'LineWidth', 2);
hold on;

% Mark the iterations on the graph with unique colors
for i = 1:length(root_vals)
    plot(root_vals(i), f(root_vals(i)), 'o', 'MarkerSize', 8, 'MarkerFaceColor', color_map(i, :));
    text(root_vals(i), f(root_vals(i)), sprintf(' Iter %d', iter_vals(i)), ...
        'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right', 'Color', color_map(i, :));
end

% Mark the x-axis and y-axis
plot(x_vals, zeros(size(x_vals)), 'k--', 'LineWidth', 1); % x-axis
xlabel('x');
ylabel('f(x)');
title('False Position Method Root Finding');
grid on;

% Create a legend with values and corresponding colors
legend_labels = cell(1, length(root_vals));
for i = 1:length(root_vals)
    legend_labels{i} = sprintf('Iter %d (%.5f)', iter_vals(i), root_vals(i));
end
legend(legend_labels, 'Location', 'northwest');

hold off;