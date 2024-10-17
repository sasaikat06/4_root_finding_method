% False Position Method for Root Finding with Graph Plotting
	clc;
	clear;
	
	% Define the function f(x)
	f = @(x) x.^3 - 5*x + 3;  % Example equation: f(x) = x^3 - 5x + 3 = 0=0
	
	% Initial guesses
	a = 2;  % Lower bound
	b = 3;  % Upper bound
	
	% Tolerance for stopping criteria
	tol = 1e-5;
	
	% Maximum number of iterations
	max_iter = 5;
	
	% Arrays to store iteration values and roots
	iter_vals = [];
	root_vals = [];
	
	% False Position Method
	for iter = 1:max_iter
	% Calculate the root using the False Position formula
	c = b - (f(b) * (a - b)) / (f(a) - f(b));
    fprintf('Iteration %f , Root is %f \n',iter_vals,root_vals)
	
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
	end
	
	% Display the root
	fprintf('The root is approximately: %f\n', c);
	
	% Plotting the function
	x_vals = linspace(1, 4, 1000);  % Range around the expected root
	y_vals = f(x_vals);
	figure;
	plot(x_vals, y_vals, 'b', 'LineWidth', 2);
	hold on;
	
	% Mark the iterations on the graph
	for i = 1:length(root_vals)
	plot(root_vals(i), f(root_vals(i)), 'ro', 'MarkerSize', 8,'MarkerFaceColor', 'r');
	text(root_vals(i), f(root_vals(i)), sprintf(' Iter %d', iter_vals(i)), ...
	'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
	end
	
	% Mark the x-axis and y-axis
	plot(x_vals, zeros(size(x_vals)), 'k--', 'LineWidth', 1); % x-axis
	xlabel('x');
	ylabel('f(x)');
	title('False Position Method Root Finding');
	grid on;
	hold off;