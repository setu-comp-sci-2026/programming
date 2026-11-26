# Searching sorted objects
import bisect
from product import Product
from binary_search import binary_search

# (On the slide this list comes from shop.get_all_products())
all_products = [
    Product("Butter", 3.00, 104),
    Product("Apple",  1.99, 101),
    Product("Milk",   1.20, 103),
    Product("Bread",  2.50, 105),
]

# Sort by price first — binary search needs sorted data
products = sorted(all_products, key=lambda p: p.get_price())


def find_by_price(products: list, target_price: float):
    prices = [p.get_price() for p in products]
    idx = binary_search(prices, target_price)
    if idx != -1:
        return products[idx]
    return None


print(find_by_price(products, 2.50))   # 105: Bread (General) €2.50
print(find_by_price(products, 9.99))   # None

# Or use bisect
prices = [p.get_price() for p in products]
idx = bisect.bisect_left(prices, 2.50)
if idx < len(prices) and prices[idx] == 2.50:
    print(products[idx])               # 105: Bread (General) €2.50
