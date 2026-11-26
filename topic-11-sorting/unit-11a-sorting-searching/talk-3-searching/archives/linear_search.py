# Linear Search: check each item in turn — works on any list
from product import Product


def linear_search(lst: list, target) -> int:
    """Return index of target, or -1 if not found."""
    for i, item in enumerate(lst):
        if item == target:
            return i
    return -1


numbers = [15, 8, 3, 42, 7, 19]
print(linear_search(numbers, 42))    # 3
print(linear_search(numbers, 100))   # -1


# Searching objects
def find_product_by_name(products: list, name: str):
    for p in products:
        if p.get_name().lower() == name.lower():
            return p
    return None


products = [
    Product("Butter", 3.00, 104),
    Product("Apple",  1.99, 101),
    Product("Milk",   1.20, 103),
]
print(find_product_by_name(products, "apple"))   # 101: Apple (General) €1.99
print(find_product_by_name(products, "bread"))   # None
