def equation(x):
    return x**4 + 2*x**3 - x - 1

def find_root(accuracy):
    left = 0
    right = 1

    while right -left > accuracy:
        mid = (left + right) / 2
        if equation(mid) * equation(left) >= 0:
            left = mid
        else:
           right = mid

    root = (left + right) / 2
    return root
accuracy_values = [0.001, 0.0001, 0.00001, 0.000001, 0.0000001, 0.00000001]
for accuracy in accuracy_values:
    root = find_root(accuracy)
    print(f"Root with accuracy {accuracy}: {root}")
