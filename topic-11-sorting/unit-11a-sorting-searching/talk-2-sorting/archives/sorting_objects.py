# Sorting objects with key=
from product import Product

products = [
    Product("Butter", 3.00, 104, "Dairy"),
    Product("Apple",  1.99, 101, "Fruit"),
    Product("Milk",   1.20, 103, "Dairy"),
    Product("Banana", 0.99, 102, "Fruit"),
]

# By price
by_price = sorted(products, key=lambda p: p.get_price())
print("By price:")
for p in by_price:
    print(" ", p)

# By name
by_name = sorted(products, key=lambda p: p.get_name())
print("By name:")
for p in by_name:
    print(" ", p)

# Multiple criteria: first by category, then by price
products.sort(key=lambda p: (p.get_category(), p.get_price()))
print("By category, then price:")
for p in products:
    print(" ", p)
