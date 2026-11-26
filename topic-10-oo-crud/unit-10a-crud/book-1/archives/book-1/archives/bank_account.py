class BankAccount:
    """Represents one account and protects its balance."""

    def __init__(self, account_no, name, balance=0):
        if not account_no.strip():
            raise ValueError("Account number cannot be blank")
        if not name.strip():
            raise ValueError("Holder name cannot be blank")
        if balance < 0:
            raise ValueError("Initial balance cannot be negative")
        self.account_no = account_no.strip()
        self.name = name.strip()
        self.balance = balance

    def deposit(self, amount):
        if amount <= 0:
            raise ValueError("Deposit must be positive")
        self.balance += amount

    def withdraw(self, amount):
        if amount <= 0 or amount > self.balance:
            raise ValueError("Invalid withdrawal amount")
        self.balance -= amount

    def to_dict(self):
        return {"account_no": self.account_no, "name": self.name, "balance": self.balance}

    def __str__(self):
        return f"{self.account_no}: {self.name} - €{self.balance:.2f}"
