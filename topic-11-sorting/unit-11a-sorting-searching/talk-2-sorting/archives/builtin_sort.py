# Python's built-in sort (Timsort)
from product import Product

# sort() — sorts the list in place, returns None
numbers = [3, 1, 4, 1, 5, 9]
numbers.sort()
print(numbers)          # [1, 1, 3, 4, 5, 9]

# sorted() — returns a new list, original unchanged
words = ["banana", "apple", "cherry"]
print(sorted(words))    # ['apple', 'banana', 'cherry']
print(words)            # ['banana', 'apple', 'cherry']

products = [
    Product("Butter", 3.00, 104),
    Product("Apple",  1.99, 101),
    Product("Milk",   1.20, 103),
]

# With key=
products.sort(key=lambda p: p.get_price())
print("Cheapest first:")
for p in products:
    print(" ", p)

# Reverse
products.sort(key=lambda p: p.get_price(), reverse=True)
print("Dearest first:")
for p in products:
    print(" ", p)
