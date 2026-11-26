# Type hints: describing parameter and return types

def total_price(price: float, quantity: int) -> float:
    return price * quantity


def greet(name: str) -> None:        # returns nothing
    print(f"Hello, {name}")


def is_adult(age: int) -> bool:
    return age >= 18


def average(marks: list) -> float:
    return sum(marks) / len(marks)


print(total_price(1.99, 3))   # 5.97
greet("Ada")                  # Hello, Ada
print(is_adult(17))           # False
print(average([60, 70, 80]))  # 70.0

# Python does NOT enforce hints — this still runs:
print(total_price("ab", 3))   # ababab  (no error!)
