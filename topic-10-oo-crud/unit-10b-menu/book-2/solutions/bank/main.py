from bank_account import BankAccount
from storage import load_bank, save_bank, log_event

def show_menu():
    print("\n=== BANK ===")
    print("1. List accounts")
    print("2. Find account")
    print("3. Add account")
    print("4. Rename account")
    print("5. Delete account")
    print("6. Save accounts")
    print("0. Exit")

def main():
    try:
        bank = load_bank()
    except (OSError, ValueError, KeyError, TypeError) as error:
        print("Cannot load accounts:", error)
        return
    while True:
        show_menu()
        choice = input("Choose: ").strip()
        try:
            if choice == "1":
                bank.list_accounts()
            elif choice == "2":
                account = bank.find_account(input("Account number: ").strip())
                print(account if account is not None else "Not found")
            elif choice == "3":
                number = input("Account number: ").strip()
                if not number:
                    raise ValueError("Account number cannot be blank")
                name = input("Name: ")
                balance = float(input("Balance: "))
                if bank.add_account(BankAccount(number, name, balance)):
                    print("Added")
                    log_event("INFO Account added")
                else:
                    print("Duplicate account")
                    log_event("WARNING Duplicate account rejected")
            elif choice == "4":
                success = bank.rename_account(input("Account number: ").strip(), input("New name: "))
                print("Renamed" if success else "Rename failed")
                if success:
                    log_event("INFO Account renamed")
            elif choice == "5":
                success = bank.delete_account(input("Account number: ").strip())
                print("Deleted" if success else "Not found")
                if success:
                    log_event("INFO Account deleted")
            elif choice in ("6", "0"):
                save_bank(bank)
                print("Accounts saved")
                log_event("INFO Accounts saved")
                if choice == "0":
                    break
            else:
                print("Invalid choice")
        except (ValueError, OSError) as error:
            print("Operation error:", error)

if __name__ == "__main__":
    main()

