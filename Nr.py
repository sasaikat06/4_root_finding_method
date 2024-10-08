import numpy as np
import matplotlib.pyplot as plt

def f(x):
    return 3*x - np.cos(x) - 1

def df(x):
    return 3 + np.sin(x)

def newton_raphson(x0, tol=1e-6, max_iter=100):
    """
    Finds the root of f(x) using Newton's method.

    Args:
        x0: Initial guess for the root.
        tol: Tolerance for the root.
        max_iter: Maximum number of iterations.

    Returns:
        The root of f(x).
    """

    for i in range(max_iter):
        x1 = x0 - f(x0) / df(x0)
        if abs(x1 - x0) < tol:
            return x1
        x0 = x1
    raise ValueError("Newton's method did not converge.")

# Initial guesses
x0_values = [0.5, 1.0, 1.5]

# Find roots for each initial guess
roots = []
for x0 in x0_values:
    root = newton_raphson(x0)
    roots.append(root)
    print(f"Root found for x0={x0}: {root}")

# Plot the function and the roots
x = np.linspace(-2, 2, 100)
y = f(x)

plt.figure()
plt.plot(x, y, label="f(x)")
plt.xlabel("x")
plt.ylabel("f(x)")
plt.title("Newton's Method for 3x - cos(x) - 1 = 0")

# Mark the roots on the graph
for root in roots:
    plt.axvline(x=root, color='r', linestyle='--', label=f"Root: {root:.6f}")

plt.legend()
plt.grid(True)
plt.show()