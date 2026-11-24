class BankAccount:
    def __init__(self, account_no, name, initial_balance=0):
        self._account_no = account_no
        self.name = name
        self._balance = 0
        self.balance = initial_balance

    @property
    def account_no(self):
        return self._account_no

    @property
    def name(self):
        return self._name

    @name.setter
    def name(self, value):
        if not value.strip():
            raise ValueError("Name cannot be blank")
        self._name = value.strip()

    @property
    def balance(self):
        return self._balance

    @balance.setter
    def balance(self, value):
        if value < 0:
            raise ValueError("Balance cannot be negative")
        self._balance = value

    def deposit(self, amount):
        if amount <= 0:
            raise ValueError("Deposit must be positive")
        self.balance = self.balance + amount

    def withdraw(self, amount):
        if amount <= 0 or amount > self.balance:
            raise ValueError("Invalid withdrawal")
        self.balance = self.balance - amount

    def __str__(self):
        return f"{self.account_no}: {self.name} - €{self.balance:.2f}"

    def to_dict(self):
        return {"account_no": self.account_no,
                "name": self.name, "balance": self.balance}

