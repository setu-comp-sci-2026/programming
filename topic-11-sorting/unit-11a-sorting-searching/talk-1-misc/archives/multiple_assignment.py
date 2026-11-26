# Multiple assignment and tuple unpacking

x, y = 1, 2
print(x, y)            # 1 2

low, high = 0, len([5, 8, 13]) - 1
print(low, high)       # 0 2

name, price = ("Apple", 1.99)    # unpacking a tuple
print(name, price)     # Apple 1.99

# You've already seen this with enumerate
for i, item in enumerate(["a", "b", "c"]):
    print(i, item)

# The number of names must match the number of values:
# a, b = 1, 2, 3    # ValueError: too many values to unpack
