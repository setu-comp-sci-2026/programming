from bank_account import BankAccount

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

