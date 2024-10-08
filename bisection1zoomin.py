import numpy as np
import matplotlib.pyplot as plt

# Function definition
def f(x):
    return x**3 - x - 1

# Bisection method implementation
def bisection_method(f, a, b, tol=1e-6, max_iterations=9):
    if f(a) * f(b) >= 0:
        print("Bisection method fails. f(a) and f(b) must have opposite signs.")
        return None
    
    iteration_data = []  # Store data for plotting
    for n in range(max_iterations):
        mid = (a + b) / 2
        iteration_data.append((mid, f(mid)))
        
        if f(mid) == 0 or (b - a) / 2 < tol:
            return mid, iteration_data
        
        if f(a) * f(mid) < 0:
            b = mid
        else:
            a = mid
            
    return mid, iteration_data

# Initial guesses
a = 1
b = 2

# Call the bisection method
root, iteration_data = bisection_method(f, a, b)

# Print the result after 9 iterations
print(f"After 9 iterations, the root is approximately {root:.6f}")

# Prepare data for plotting the function
x_values = np.linspace(0, 2, 400)
y_values = f(x_values)

# Plot the function
plt.plot(x_values, y_values, 'b-', label=r'$f(x) = x^3 - x - 1$')
plt.axhline(0, color='black',linewidth=0.5)
plt.axvline(0, color='black',linewidth=0.5)

# Plot the points from the bisection method with different colors
colors = plt.cm.viridis(np.linspace(0, 1, len(iteration_data)))  # Different colors for each iteration

for i, (x_mid, f_mid) in enumerate(iteration_data[:-1]):
    plt.plot(x_mid, f_mid, 'o', color=colors[i], label=f'Iteration {i+1}')  # Different colors

# Highlight the final point in red
final_x, final_f = iteration_data[-1]
plt.plot(final_x, final_f, 'ro', markersize=10, label=f'Final Result: {final_x:.6f}')

# Write the final result on the graph
plt.text(final_x, final_f, f'  Root ≈ {final_x:.6f}', color='red', fontsize=12, verticalalignment='bottom')

# Set y-axis limits to zoom in
plt.ylim([-0.1, 0.3])  # Zoom in on the y-axis

# Labels and title
plt.title('Bisection Method for $f(x) = x^3 - x - 1$ (Zoomed)')
plt.xlabel('x')
plt.ylabel('f(x)')
plt.grid(True)

# Show legend
plt.legend()

# Show the plot
plt.show()
