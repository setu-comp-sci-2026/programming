import pytest
from bank_account import BankAccount
from bank import Bank
from rule import Rule
from troubleshooter import Troubleshooter

def test_deposit():
    account = BankAccount('A001', 'Alice', 100)
    account.deposit(50)
    assert account.balance == 150

def test_withdraw_entire_balance():
    account = BankAccount('A001', 'Alice', 100)
    account.withdraw(100)
    assert account.balance == 0

def test_overdraw():
    account = BankAccount('A001', 'Alice', 100)
    with pytest.raises(ValueError):
        account.withdraw(101)
    assert account.balance == 100

def test_blank_name():
    account = BankAccount('A001', 'Alice', 100)
    with pytest.raises(ValueError):
        account.name = '   '
    assert account.name == 'Alice'

def test_duplicate_account():
    bank = Bank()
    account = BankAccount('A001', 'Alice', 100)
    assert bank.add_account(account) is True
    assert bank.add_account(account) is False
    assert len(bank.accounts) == 1

def test_rule_matches():
    rule = Rule({'power_on':'yes','display_on':'no'}, 'Check monitor')
    assert rule.matches({'power_on':'yes','display_on':'no'}) is True

def test_rule_missing_answer():
    rule = Rule({'power_on':'yes','display_on':'no'}, 'Check monitor')
    assert rule.matches({'power_on':'yes'}) is False

def test_recommendation():
    system = Troubleshooter()
    system.rules.append(Rule({'power_on':'no'}, 'Check cable'))
    assert system.recommend({'power_on':'no'}) == 'Check cable'
