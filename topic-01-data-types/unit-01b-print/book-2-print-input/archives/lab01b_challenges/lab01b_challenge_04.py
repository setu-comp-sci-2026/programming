print("Please enter the following information:")
first_name = input("First name:    ")
last_name = input("Last name:     ")
year_of_birth = int(input("Year of birth: "))
current_year = 2026
print(21 * "-")
print(f"Full name: {first_name} {last_name}")
print(f"Initials: {first_name[0]}.{last_name[0]}.")
print(f"Age: {current_year - year_of_birth}")
print(21 * "-") 


#Example run:
# First name:    Alice
# Last name:     Murphy
# Year of birth: 2004
# ----------------------------
# Full name: Alice Murphy
# Initials:  A.M.
# Age:       20
# ----------------------------