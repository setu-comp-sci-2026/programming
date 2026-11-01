def check_valid_age(age):
    if age < 0 or age > 120:
        return False
    else:
        return True
    
def get_valid_age():
    age = int(input("Enter age: "))
    while not check_valid_age(age):
        print("Invalid age. Please enter a valid age between 0 and 120.")
        age = int(input("Enter age: "))
    return age  

print("age:", get_valid_age())