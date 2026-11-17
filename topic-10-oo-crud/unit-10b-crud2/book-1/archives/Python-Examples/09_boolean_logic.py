# Expected: no discount for a 16-year-old without membership.
# Actual: discount applied.
age = 16
member = False
if age >= 18 or not member:
    print("Discount applies")
else:
    print("No discount")
