class BankAccount:
    def __init__(self, account_no, name, initial_balance=0):
        self._account_no = account_no
        self._name = name
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


class Bank:
    def __init__(self):
        self.accounts = []

    def list_accounts(self):
        for account in self.accounts:
            print(account)

    def find_account(self, account_no):
        for account in self.accounts:
            if account.account_no == account_no:
                return account
        return None

    def add_account(self, account):
        if self.find_account(account.account_no) is not None:
            return False
        self.accounts.append(account)
        return True

    def rename_account(self, account_no, new_name):
        account = self.find_account(account_no)
        if account is None or not new_name.strip():
            return False
        account.name = new_name.strip()  # property setter validates
        return True

    def delete_account(self, account_no):
        account = self.find_account(account_no)
        if account is None:
            return False
        self.accounts.remove(account)
        return True

    def count_accounts(self):
        return len(self.accounts)


bank = Bank()
alice = BankAccount("A001", "Alice", 500)
bob = BankAccount("A002", "Bob", 1200)
charlie = BankAccount("A003", "Charlie", 250)

print(bank.add_account(alice))    # True
print(bank.add_account(bob))      # True
print(bank.add_account(charlie))  # True
print(bank.add_account(alice))    # False

alice.balance = alice.balance + 25
print(bank.accounts[0].balance)  # 525

found = bank.find_account("A002")
if found is not None:
    print(found.name)            # Bob

print(bank.find_account("A999"))           # None
print(bank.rename_account("A002", "Robert"))  # True
print(bank.rename_account("A001", "  "))      # False
print(bank.delete_account("A003"))            # True
print(bank.delete_account("A003"))            # False
print(bank.count_accounts())                   # 2
bank.list_accounts()
