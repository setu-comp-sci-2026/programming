# Lambda functions and key=

# 1. Passing a named function as key= (no brackets!)
def get_length(word):
    return len(word)

words = ["banana", "fig", "apple"]
print(sorted(words, key=get_length))            # ['fig', 'apple', 'banana']

# 2. The same thing with a lambda
print(sorted(words, key=lambda word: len(word)))  # ['fig', 'apple', 'banana']

# 3. Sort by absolute value
nums = [-7, 3, -1, 5]
print(sorted(nums, key=lambda n: abs(n)))       # [-1, 3, 5, -7]

# 4. A lambda can be stored in a variable and called like any function
square = lambda x: x * x
print(square(4))                                # 16

# 5. With objects: sort Products by price
from product import Product

products = [
    Product("Butter", 3.00, 104),
    Product("Apple",  1.99, 101),
    Product("Milk",   1.20, 103),
]
products.sort(key=lambda p: p.get_price())
for p in products:
    print(p)
