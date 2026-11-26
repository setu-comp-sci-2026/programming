# Python's bisect module — binary search built in
import bisect

sorted_prices = [1.20, 1.99, 2.50, 3.00, 4.50]

# Find insertion point for 2.00
idx = bisect.bisect_left(sorted_prices, 2.00)
print(idx)   # 2  ← insert at position 2

# Insert while keeping sorted
bisect.insort(sorted_prices, 2.00)
print(sorted_prices)   # [1.2, 1.99, 2.0, 2.5, 3.0, 4.5]
