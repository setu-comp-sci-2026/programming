# Expected: 12. Actual: 0.
stock = {"pens": 12, "pencils": 8}
item = "pens"
quantity = stock.get("pen", 0)
print("Quantity of", item, ":", quantity)
