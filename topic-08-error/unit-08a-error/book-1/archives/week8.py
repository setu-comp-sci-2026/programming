def get_valid_age():
    valid_age = False

    while not valid_age:
        try:
            age = int(input("Age (0–25): "))

            if 0 <= age <= 25:
                return age
            else:
                print("Out of range")
        except Exception:
            print("What")
        except ValueError:
            print("Whole numbers only")


dog_age = get_valid_age()
print("Accepted:", dog_age)