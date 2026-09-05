
item = input("Enter product name:   ")
price = float(input("Enter product price per unit:    £"))
qty = int(input("Enter product quantity:         "))

print(21 * "-")
print(f"Item:     {item}")
print(f"Price:    €{price:.2f}")
print(f"Qty:      {qty}")
print(21 * "-")
total = price * qty
print(f"Total:    €{total:.2f}")
print(21 * "=")



# Example receipt
# =============================
#          RECEIPT
# =============================
# Item:     Coffee
# Price:    €3.50
# Qty:      4
# -----------------------------
# Total:    €14.00
# =============================
