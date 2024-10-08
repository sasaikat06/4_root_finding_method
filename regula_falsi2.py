import numpy as np
import matplotlib.pyplot as plt

# Define the function f(x) = x^3 - 3x - 5
def f(x):
    return x**3 - 3*x - 5

# Implementing the Regula Falsi method with a limit of 6 iterations
def regula_falsi(f, a, b, max_iter=6):
    if f(a) * f(b) >= 0:
        raise ValueError("f(a) and f(b) must have opposite signs")
    
    iteration_data = []  # To store iteration points

    for n in range(max_iter):
        # Apply the formula for the false position
        x = a - (f(a) * (b - a)) / (f(b) - f(a))
        iteration_data.append((n, x))

        # Update either a or b
        if f(a) * f(x) < 0:
            b = x
        else:
            a = x
    
    return x, iteration_data

# Initial guesses for the root
a = 2
b = 3

# Call the Regula Falsi method (limited to 6 iterations)
root, iteration_data = regula_falsi(f, a, b)

# Print the result after 6 iterations
print(f"Approximate root after 6 iterations: {root:.6f}")

# Prepare data for plotting the function
x_values = np.linspace(1.5, 3.5, 400)
y_values = f(x_values)

# Plot the function f(x)
plt.plot(x_values, y_values, 'b-', label=r'$f(x) = x^3 - 3x - 5$')
plt.axhline(0, color='black', linewidth=0.5)  # Line y = 0
plt.axvline(0, color='black', linewidth=0.5)  # Line x = 0

# Plot the points from the iterations
colors = plt.cm.plasma(np.linspace(0, 1, len(iteration_data)))

for i, (n, x_val) in enumerate(iteration_data):
    plt.plot(x_val, f(x_val), 'o', color=colors[i], label=f'Iteration {n}')  # Different colors

# Highlight the final point in red
final_x = iteration_data[-1][1]
plt.plot(final_x, f(final_x), 'ro', markersize=10, label=f'Final Result: {final_x:.6f}')

# Write the final result on the graph
plt.text(final_x, f(final_x), f'  Root ≈ {final_x:.6f}', color='red', fontsize=12, verticalalignment='bottom')

# Set y-axis limits to zoom in around the root
plt.ylim([-10, 10])  # Adjust this range to zoom in around the y=0 region

# Labels and title
plt.title('Regula Falsi Method for $x^3 - 3x - 5 = 0$ (6 Iterations)')
plt.xlabel('x')
plt.ylabel('f(x)')
plt.grid(True)

# Show legend
plt.legend()

# Show the plot
plt.show()
