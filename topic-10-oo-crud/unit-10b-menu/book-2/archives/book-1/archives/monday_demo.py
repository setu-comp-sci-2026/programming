from bank import Bank
from bank_account import BankAccount

bank = Bank()
print(bank.add_account(BankAccount("A001", "Alice", 500)))
print(bank.add_account(BankAccount("A002", "Bob", 1200)))
print(bank.add_account(BankAccount("A001", "Another Alice", 10)))
print("\nAll accounts:")
bank.list_accounts()
print("\nRename:", bank.rename_account("A002", "Robert"))
account = bank.find_account("A001")
if account is not None:
    account.deposit(50)
print("\nDelete:", bank.delete_account("A002"))
bank.list_accounts()
