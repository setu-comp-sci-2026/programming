from bank_account import BankAccount
from bank import Bank

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