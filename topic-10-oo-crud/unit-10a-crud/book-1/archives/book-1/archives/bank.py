class Bank:
    """Manages a collection of BankAccount objects."""

    def __init__(self):
        self.accounts = []

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
        account.name = new_name.strip()
        return True

    def delete_account(self, account_no):
        account = self.find_account(account_no)
        if account is None:
            return False
        self.accounts.remove(account)
        return True

    def list_accounts(self):
        for account in self.accounts:
            print(account)
