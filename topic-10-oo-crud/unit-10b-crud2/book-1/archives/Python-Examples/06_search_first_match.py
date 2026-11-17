# Expected: True, because 42 is in the list. Actual: False.
def contains_number(numbers, target):
    for number in numbers:
        if number == target:
            return True
        else:
            return False
    return False

print("Found:", contains_number([10, 20, 42], 42))
