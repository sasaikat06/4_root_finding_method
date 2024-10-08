function bisection_method()
%  BISECTION_METHOD Define the function
    f = @(x) x^3 - x - 1;
    
    % Initial guesses
    a1 = 1; % Initial guess 1
    b1 = 2; % Initial guess 1
    a2 = 0; % Initial guess 2
    b2 = 1; % Initial guess 2
    a3 = -1; % Initial guess 3
    b3 = 0; % Initial guess 3
    
    % Tolerance level
    tol = 1e-4;
    
    % Calculate roots using Bisection Method for each pair of guesses
    root1 = bisection(f, a1, b1, tol);
    root2 = bisection(f, a2, b2, tol);
    root3 = bisection(f, a3, b3, tol);
    
    % Display the results
    fprintf('Root found between [%f, %f]: %f\n', a1, b1, root1);
    fprintf('Root found between [%f, %f]: %f\n', a2, b2, root2);
    fprintf('Root found between [%f, %f]: %f\n', a3, b3, root3);
    
    % Plotting the function
    x = linspace(-2, 3, 100);
    y = f(x);
    
    figure;
    plot(x, y, 'b-', 'LineWidth', 2);
    hold on;
    plot(root1, f(root1), 'ro', 'MarkerSize', 8, 'DisplayName', 'Root 1');
    plot(root2, f(root2), 'go', 'MarkerSize', 8, 'DisplayName', 'Root 2');
    plot(root3, f(root3), 'mo', 'MarkerSize', 8, 'DisplayName', 'Root 3');
    yline(0, 'k--', 'LineWidth', 1); % x-axis
    xlabel('x');
    ylabel('f(x)');
    title('Bisection Method for Finding Roots');
    legend;
    grid on;
    hold off;
end
function root = bisection(f, a, b, tol)
    if f(a) * f(b) >= 0
        error('Function must have opposite signs at endpoints a and b');
    end
    
    while (b - a) / 2 > tol
        c = (a + b) / 2; % Midpoint
        if f(c) == 0 % Check if midpoint is a root
            break;
        elseif f(a) * f(c) < 0 % Root lies in left half
            b = c;
        else % Root lies in right half
            a = c;
        end
    end
    
    root = (a + b) / 2; % Approximate root
end