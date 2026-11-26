# Default sorting, sort fields, key= and lambda
from product import Product

# 1. Default sorting — no key needed
print(sorted([64, 25, 12, 22, 11]))       # [11, 12, 22, 25, 64]
print(sorted(["banana", "fig", "apple"]))  # ['apple', 'banana', 'fig']
print(sorted([3, 1, 2], reverse=True))    # [3, 2, 1]
print(sorted(["banana", "Cherry"]))       # ['Cherry', 'banana']  capitals first!

# 2. Sorting objects — which field?
products = [
    Product("Butter", 3.00, 104),
    Product("Apple",  1.99, 101),
    Product("Milk",   1.20, 103),
]

try:
    s = sorted(products)
except TypeError as e:
    print("TypeError:", e)


# 3. key= — a function that returns the sort field
def get_price_of(p):
    return p.get_price()


for p in sorted(products, key=get_price_of):
    print(p)                               # Milk, Apple, Butter

words = ["banana", "fig", "apple"]
print(sorted(words, key=len))              # ['fig', 'apple', 'banana']

# 4. The same with lambdas — just change the sort field
for p in sorted(products, key=lambda p: p.get_price()):
    print(p)                               # Milk, Apple, Butter
for p in sorted(products, key=lambda p: p.get_name()):
    print(p)                               # Apple, Butter, Milk

print(sorted(words, key=lambda word: len(word)))  # ['fig', 'apple', 'banana']

nums = [-7, 3, -1, 5]
print(sorted(nums, key=lambda n: abs(n)))  # [-1, 3, 5, -7]
