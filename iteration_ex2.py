import numpy as np
import matplotlib.pyplot as plt

# Define the function for the iteration (rearranged equation)
def f(x):
    return (np.cos(x) + 3) / 2

# Iterative method function with a minimum of 10 iterations
def iterative_method_min_10(x0, tol=1e-6, min_iter=10, max_iter=100):
    x_prev = x0
    iterations = [x0]  # Store the first guess
    for i in range(max_iter):
        x_next = f(x_prev)
        iterations.append(x_next)
        if abs(x_next - x_prev) < tol and i >= min_iter - 1:  # Ensure at least 10 iterations
            break
        x_prev = x_next
    return iterations

# Initial guess
x0 = 1

# Apply iterative method with at least 10 iterations
iterations = iterative_method_min_10(x0)

# Display the first 10 iterations and the final converged value
print("First 10 Iterations: ", iterations[:10])
print("Converged Root: ", iterations[-1])

# Plotting the graph of 2x = cos(x) + 3 along with iteration points
x = np.linspace(-2, 2, 400)
y = 2 * x - np.cos(x) - 3

plt.plot(x, y, label=r'$2x - \cos(x) - 3$')
plt.axhline(0, color='black',linewidth=0.5)
plt.axvline(0, color='black',linewidth=0.5)
plt.scatter(iterations[:10], np.zeros(10), color='red', zorder=5, label='First 10 Iterations')
plt.scatter(iterations[-1], 0, color='blue', zorder=5, label=f'Converged Root at x = {iterations[-1]:.4f}')
plt.title(r'Graph of $2x = \cos(x) + 3$ with Iterations')
plt.xlabel('x')
plt.ylabel('y')
plt.legend()
plt.grid(True)
plt.show()