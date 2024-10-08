% Bisection Method for solving x^3 - x - 1 = 0

% Define the function
f = @(x) x^3 - x - 1;

% Initial values
a = 1;  % Lower bound
b = 2;  % Upper bound

% Maximum number of iterations
max_iterations = 9;

% Tolerance (optional for stopping criteria)
tol = 1e-6;

% Preallocate arrays for storing iterations
x_values = zeros(max_iterations, 1);
f_values = zeros(max_iterations, 1);

% Bisection method iterations
for n = 1:max_iterations
    % Calculate midpoint
    x_mid = (a + b) / 2;
    
    % Store values for plotting
    x_values(n) = x_mid;
    f_values(n) = f(x_mid);
    
    % Check the sign of f(a) * f(midpoint)
    if f(a) * f(x_mid) < 0
        b = x_mid;  % Root is in the left half
    else
        a = x_mid;  % Root is in the right half
    end
    
    % Check if the solution has converged (optional)
    if abs(f(x_mid)) < tol
        break;
    end
end

% Plot the function and the root approximations
x_plot = linspace(0, 2, 1000);  % Values for x-axis
y_plot = f(x_plot);  % Corresponding y-values

figure;
plot(x_plot, y_plot, 'b-', 'LineWidth', 2);  % Plot f(x)
hold on;

% Mark the approximated root points
plot(x_values, f_values, 'ro', 'MarkerSize', 8, 'LineWidth', 2);

% Plot horizontal and vertical lines for reference
yline(0, 'k--', 'LineWidth', 1.5);  % y = 0 (x-axis)
xline(0, 'k--', 'LineWidth', 1.5);  % x = 0 (y-axis)

% Add labels and title
xlabel('x');
ylabel('f(x)');
title('Bisection Method for f(x) = x^3 - x - 1');

% Show the root approximations
legend('f(x)', 'Bisection Points', 'Location', 'Best');
grid on;

% Print the final root approximation
fprintf('After %d iterations, the root is approximately %.6f\n', n, x_mid);
