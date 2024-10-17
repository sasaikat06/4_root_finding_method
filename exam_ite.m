	% Iterative Method for Root Finding with Graph Plotting
	clc;
	clear;
	
	% Define the function f(x)
	f = @(x) x.^3 - 2*x.^2 - 4;  % Example equation: f(x) = x^3 - 2x^2 - 4
	
	% Define the iterative function g(x)
	g = @(x) sqrt(2*x^2 + 4);      % Rearranged to x = g(x)
	
	% Initial guess
	x0 = 3;                         % Starting point, can be adjusted
	
	% Tolerance for stopping criteria
	tol = 1e-5;
	
	% Maximum number of iterations
	max_iter = 10;
	
	% Array to store iteration values
	iter_vals = [];
	root_vals = [];
	
	% Iterative method
	for iter = 1:max_iter
	x1 = g(x0);  % Update x using iterative formula
	
	% Store iteration values for plotting
	iter_vals = [iter_vals, iter];
	root_vals = [root_vals, x1];
	
	% Check for convergence
	if abs(x1 - x0) < tol
	break;
	end
	
	% Update x0 for next iteration
	x0 = x1;
	end
	
	% Display the root
	fprintf('The root is approximately: %f\n', x1);
	
	% Plotting the function
	x_vals = linspace(1, 4, 1000);  % Range around the expected root
	y_vals = f(x_vals);
	figure;
	plot(x_vals, y_vals, 'b', 'LineWidth', 2);
	hold on;
	
	% Mark the iterations on the graph
	for i = 1:length(root_vals)
	plot(root_vals(i), f(root_vals(i)), 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
	text(root_vals(i), f(root_vals(i)), sprintf(' Iter %d', iter_vals(i)), ...
	'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
	end
	
	% Mark the x-axis and y-axis
	plot(x_vals, zeros(size(x_vals)), 'k--', 'LineWidth', 1); % x-axis
	xlabel('x');
	ylabel('f(x)');
	title('Iterative Method Root Finding');
	grid on;
	hold off;