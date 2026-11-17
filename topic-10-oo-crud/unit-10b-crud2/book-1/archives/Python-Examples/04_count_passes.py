# Expected: 3 passes. Actual: 2.
marks = [40, 50, 75, 32]
passes = 0
for mark in marks:
    if mark > 40:
        passes += 1
print("Passes:", passes)
