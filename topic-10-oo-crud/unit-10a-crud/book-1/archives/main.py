from bank_account import BankAccount
from storage import load_bank, save_bank


def display_menu():
    print("\nBANK ACCOUNT MANAGER")
    print("1. Add account")
    print("2. List accounts")
    print("3. Find account")
    print("4. Rename account")
    print("5. Delete account")
    print("6. Deposit")
    print("7. Withdraw")
    print("8. Save")
    print("0. Save and quit")


def main():
    try:
        bank = load_bank()
    except (OSError, ValueError, KeyError, TypeError) as error:
        print("Could not load account data:", error)
        print("Existing data will not be overwritten. Fix the file and restart.")
        return

    running = True
    while running:
        display_menu()
        choice = input("Choose an option: ").strip()
        try:
            if choice == "1":
                number = input("Account number: ").strip()
                name = input("Holder name: ").strip()
                balance = float(input("Opening balance: "))
                if bank.add_account(BankAccount(number, name, balance)):
                    print("Account added")
                else:
                    print("Account number already exists")
            elif choice == "2":
                bank.list_accounts()
            elif choice == "3":
                account = bank.find_account(input("Account number: ").strip())
                print(account if account is not None else "Not found")
            elif choice == "4":
                number = input("Account number: ").strip()
                name = input("New name: ")
                print("Updated" if bank.rename_account(number, name) else "Not found or invalid name")
            elif choice == "5":
                number = input("Account number: ").strip()
                print("Deleted" if bank.delete_account(number) else "Not found")
            elif choice == "6" or choice == "7":
                account = bank.find_account(input("Account number: ").strip())
                if account is None:
                    print("Not found")
                else:
                    amount = float(input("Amount: "))
                    if choice == "6":
                        account.deposit(amount)
                    else:
                        account.withdraw(amount)
                    print(account)
            elif choice == "8" or choice == "0":
                save_bank(bank)
                print("Saved")
                if choice == "0":
                    running = False
            else:
                print("Choose a valid option")
        except ValueError as error:
            print("Invalid input:", error)
        except OSError as error:
            print("Could not save:", error)


if __name__ == "__main__":
    main()
