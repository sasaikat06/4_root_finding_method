function root = newton_raphson(f, df, x0, tol, max_iter)

for i = 1:max_iter
    x1 = x0 - f(x0) / df(x0);
    if abs(x1 - x0) < tol
        root = x1;
        return;
    end
    x0 = x1;
end

error('Newton-Raphson method did not converge.');
end

% Define the function and its derivative
f = @(x) 3*x - cos(x) - 1;
df = @(x) 3 + sin(x);

% Initial guesses
x0_values = [0.5, 1.0, 1.5];

% Find roots for each initial guess
roots = [];
for x0 = x0_values
    root = newton_raphson(f, df, x0, 1e-6, 100);
    roots = [roots, root];
    fprintf('Root found for x0 = %.2f: %.6f\n', x0, root);
end

% Plot the function and the roots
x = linspace(-2, 2, 100);
y = f(x);

figure;
plot(x, y);
xlabel('x');
ylabel('f(x)');
title('Newton-Raphson Method for 3x - cos(x) - 1 = 0');

hold on;
for root = roots
    plot([root, root], [f(root), 0], 'r--');
end
hold off;

legend('f(x)', 'Roots');
grid on;