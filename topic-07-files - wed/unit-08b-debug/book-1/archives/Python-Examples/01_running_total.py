# Expected total: 60. Actual: 30.
def calculate_total(prices):
    total = 0
    for price in prices:
        total = price
    return total

print("Total:", calculate_total([10, 20, 30]))
