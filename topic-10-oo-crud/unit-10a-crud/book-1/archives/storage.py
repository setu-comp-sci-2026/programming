import json
from pathlib import Path
from bank import Bank
from bank_account import BankAccount

DATA_FILE = Path(__file__).resolve().parent / "data" / "accounts.json"


def save_bank(bank):
    DATA_FILE.parent.mkdir(exist_ok=True)
    data = [account.to_dict() for account in bank.accounts]
    with open(DATA_FILE, "w", encoding="utf-8") as file:
        json.dump(data, file, indent=2)


def load_bank():
    bank = Bank()
    if not DATA_FILE.exists():
        return bank
    with open(DATA_FILE, "r", encoding="utf-8") as file:
        data = json.load(file)
    if not isinstance(data, list):
        raise ValueError("The accounts file must contain a list")
    for row in data:
        account = BankAccount(row["account_no"], row["name"], row["balance"])
        if not bank.add_account(account):
            raise ValueError("Duplicate account number in saved file")
    return bank
