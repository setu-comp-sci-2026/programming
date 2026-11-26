# Swapping two values

# 1. The classic way: a temporary variable
a = 5
b = 9
temp = a      # park a's value
a = b         # a is now 9
b = temp      # b gets the parked 5
print(a, b)   # 9 5

# 2. The Python way: x, y = y, x
a = 5
b = 9
a, b = b, a   # right side (9, 5) is built first, then unpacked
print(a, b)   # 9 5

# 3. Swapping elements in a list
data = [64, 25, 12]
data[0], data[1] = data[1], data[0]
print(data)   # [25, 64, 12]

i, j = 0, 2
data[i], data[j] = data[j], data[i]
print(data)   # [12, 64, 25]
