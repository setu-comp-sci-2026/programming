import json
from pathlib import Path
from datetime import datetime
from bank import Bank
from bank_account import BankAccount

DATA_FILE = Path(__file__).resolve().parent / "data" / "accounts.json"
LOG_FILE = DATA_FILE.parent / "bank.log"

def save_bank(bank):
    records = []
    for account in bank.accounts:
        records.append(account.to_dict())
    DATA_FILE.parent.mkdir(parents=True, exist_ok=True)
    with open(DATA_FILE, "w", encoding="utf-8") as file:
        json.dump(records, file, indent=4)

def load_bank():
    bank = Bank()
    if not DATA_FILE.exists():
        return bank
    with open(DATA_FILE, "r", encoding="utf-8") as file:
        records = json.load(file)
    for record in records:
        account = BankAccount(record["account_no"], record["name"], record["balance"])
        if not bank.add_account(account):
            raise ValueError("Duplicate account in saved data")
    return bank

def log_event(message):
    LOG_FILE.parent.mkdir(parents=True, exist_ok=True)
    stamp = datetime.now().isoformat(timespec="seconds")
    with open(LOG_FILE, "a", encoding="utf-8") as file:
        file.write(f"{stamp} {message}\n")

