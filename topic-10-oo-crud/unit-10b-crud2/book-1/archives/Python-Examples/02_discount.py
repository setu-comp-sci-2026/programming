# Expected final price: 45.0. Actual: 55.0.
def apply_discount(price, percent):
    discount = price * percent / 100
    return price + discount

print("Final price:", apply_discount(50, 10))
