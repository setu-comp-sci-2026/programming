class VendingMachine:
    VALID_COINS = [10, 20, 50, 100, 200]     # in cent

    def __init__(self):
        self._prices = {}         # item name -> price in cent
        self._quantities = {}     # item name -> number left
        self._credit = 0          # cent inserted so far

    @property
    def credit(self):
        return self._credit       # read-only

    def add_item(self, name, price, quantity):
        if not name.strip():
            raise ValueError("Item name cannot be empty")
        if price <= 0:
            raise ValueError("Price must be positive")
        if quantity < 0:
            raise ValueError("Quantity cannot be negative")
        self._prices[name] = price
        self._quantities[name] = quantity

    def insert_coin(self, coin):
        if coin not in VendingMachine.VALID_COINS:
            raise ValueError(f"Coin not accepted: {coin}c")
        self._credit += coin

    def buy(self, name):
        if name not in self._prices:
            raise ValueError(f"No such item: {name}")
        if self._quantities[name] == 0:
            raise ValueError(f"{name} is sold out")
        price = self._prices[name]
        if self._credit < price:
            raise ValueError(f"Insert {price - self._credit}c more")
        self._quantities[name] -= 1
        change = self._credit - price
        self._credit = 0
        return change

    def cancel(self):
        refund = self._credit
        self._credit = 0
        return refund

    def __str__(self):
        lines = [f"Credit: €{self._credit / 100:.2f}"]
        for name in self._prices:
            lines.append(f"  {name:<10} €{self._prices[name] / 100:.2f}  ({self._quantities[name]} left)")
        return "\n".join(lines)
    
vm = VendingMachine()
vm.add_item("Soda", 150, 10)
vm.add_item("Chips", 100, 5)
print(vm)
