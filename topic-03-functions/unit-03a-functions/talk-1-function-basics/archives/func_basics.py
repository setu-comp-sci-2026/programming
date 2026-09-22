

# Example 1
def draw_line():
    print("-" * 30)  # 30 hyphens

def print_header(title):#
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

# # Ex3 
# def add(a, b):
#     print(a + b)    # prints but does NOT return

# result = add(3, 4)      # prints 7
# # doubled = result * 2    # TypeError: NoneType * int


# def celsius_to_fahrenheit(celsius):
#     """Convert Celsius to Fahrenheit."""
#     return (celsius * 9 / 5) + 32

# def fahrenheit_to_celsius(fahrenheit):
#     """Convert Fahrenheit to Celsius."""
#     return (fahrenheit - 32) * 5 / 9

# boiling_c = 100
# boiling_f = celsius_to_fahrenheit(boiling_c)
# print(f"{boiling_c}°C = {boiling_f}°F")     # 100°C = 212.0°F

# freezing_f = 32
# freezing_c = fahrenheit_to_celsius(freezing_f)
# print(f"{freezing_f}°F = {freezing_c}°C")   # 32°F = 0.0°C


# #Example 4
def get_student_data():
    """Prompt user for student name and score."""
    name = input("Student name: ")
    score = float(input("Score (0-100): "))
    return name, score

def calculate_grade(score):
    """Return letter grade for a numeric score."""
    if score >= 90: return "A"
    if score >= 80: return "B"
    if score >= 70: return "C"
    if score >= 60: return "D"
    return "F"

def print_result(name, score, grade):
    """Print formatted student result."""
    print(f"\n{name}: {score:.1f} → Grade {grade}")
    
# Main program
name, score = get_student_data()
grade = calculate_grade(score)
print_result(name, score, grade)