# Writing functions that take a function as a parameter
from product import Product


def show_all(items: list, key) -> None:
    for item in items:
        print(item, "→", key(item))    # call whatever function we were given


show_all(["banana", "fig"], key=len)
show_all([-7, 3], key=lambda n: abs(n))


def linear_search_by(lst: list, target, key) -> int:
    """Return index of first item where key(item) == target, or -1."""
    for i, item in enumerate(lst):
        if key(item) == target:
            return i
    return -1


products = [
    Product("Butter", 3.00, 104),
    Product("Apple",  1.99, 101),
    Product("Milk",   1.20, 103),
]

idx = linear_search_by(products, "Apple", key=lambda p: p.get_name())
print(idx)    # 1
idx = linear_search_by(products, 103, key=lambda p: p.get_product_id())
print(idx)    # 2
idx = linear_search_by(products, "Bread", key=lambda p: p.get_name())
print(idx)    # -1
