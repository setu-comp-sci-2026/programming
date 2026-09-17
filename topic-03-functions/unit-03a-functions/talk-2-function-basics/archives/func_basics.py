
def draw_line():
    print("-" * 30)  # 30 hyphens

def print_header(title):
    draw_line()
    print(title)
    draw_line()

print_header("Student Report") # prints ---- Student Report ----

# Ex 2
# def greet(name):
#     print(f"Hello, {name}!")

# result = greet("Alice")     # prints Hello, Alice!
# print(result)               # None
# print(type(result))         # <class 'NoneType'>

# Ex3 
def add(a, b):
    print(a + b)    # prints but does NOT return

result = add(3, 4)      # prints 7
# doubled = result * 2    # TypeError: NoneType * int