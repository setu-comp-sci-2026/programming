"""Week 6: Dog Day Care — extended lecturer solution for exercises/challenges."""

dogs = [
    {"id": 1, "name": "Buddy", "breed": "Retriever", "age": 4, "vaccinated": True},
    {"id": 2, "name": "Luna", "breed": "Labrador", "age": 2, "vaccinated": False},
    {"id": 3, "name": "Milo", "breed": "Spaniel", "age": 6, "vaccinated": True}
]


def display_dogs(dogs):
    if len(dogs) == 0:
        print("No dogs recorded")
    for dog in dogs:
        print(dog["id"], dog["name"], dog["breed"],
              "Age:", dog["age"], "Vaccinated:", dog["vaccinated"])


def find_dog(dogs, dog_id):
    for dog in dogs:
        if dog["id"] == dog_id:
            return dog
    return None


def add_dog(dogs):
    dog_id = int(input("ID: "))
    if find_dog(dogs, dog_id) is not None:
        print("That ID already exists")
        return
    name = input("Name: ")
    breed = input("Breed: ")
    age = int(input("Age: "))
    answer = input("Vaccinated? (yes/no): ").strip().lower()
    vaccinated = answer == "yes"  # bool("no") would incorrectly be True!
    dogs.append({"id": dog_id, "name": name, "breed": breed,
                 "age": age, "vaccinated": vaccinated})
    print("Dog added")


def update_dog(dogs):
    dog_id = int(input("Dog ID to update: "))
    dog = find_dog(dogs, dog_id)
    if dog is None:
        print("Dog not found")
        return

    # Challenge 3: an empty answer keeps the current value.
    name = input("New name (Enter to keep current): ")
    if name != "":
        dog["name"] = name

    breed = input("New breed (Enter to keep current): ")
    if breed != "":
        dog["breed"] = breed

    age_text = input("New age (Enter to keep current): ")
    if age_text != "":
        dog["age"] = int(age_text)

    vaccinated_text = input("Vaccinated? yes/no (Enter to keep): ").strip().lower()
    if vaccinated_text == "yes":
        dog["vaccinated"] = True
    elif vaccinated_text == "no":
        dog["vaccinated"] = False
    elif vaccinated_text != "":
        print("Unrecognised vaccination answer; keeping current value")

    print("Dog updated")


def delete_dog(dogs):
    dog_id = int(input("Dog ID to delete: "))
    dog = find_dog(dogs, dog_id)
    if dog is None:
        print("Dog not found")
    elif input("Confirm delete? (yes/no): ").strip().lower() == "yes":
        dogs.remove(dog)
        print("Dog deleted")
    else:
        print("Delete cancelled")


def search_for_dog(dogs):
    dog_id = int(input("Dog ID to find: "))
    dog = find_dog(dogs, dog_id)
    if dog is None:
        print("Dog not found")
    else:
        print(dog["id"], dog["name"], dog["breed"], dog["age"], dog["vaccinated"])


def display_summary(dogs):
    under_two = 0
    eight_or_older = 0
    for dog in dogs:
        if dog["age"] < 2:
            under_two += 1
        if dog["age"] >= 8:
            eight_or_older += 1
    print("Total dogs:", len(dogs))
    print("Dogs under 2:", under_two)
    print("Dogs aged 8 or older:", eight_or_older)


def search_by_breed(dogs):
    breed = input("Breed to search for: ").strip().lower()
    found = False
    for dog in dogs:
        if dog["breed"].lower() == breed:
            print(dog["id"], dog["name"], dog["breed"])
            found = True
    if not found:
        print("No dogs of that breed found")


def main():
    choice = ""
    while choice != "0":
        print("\nDOG DAY CARE MANAGER — EXTENDED")
        print("1. Add dog")
        print("2. View dogs")
        print("3. Update dog")
        print("4. Delete dog")
        print("5. Find dog by ID")
        print("6. Display summary")
        print("7. Search by breed")
        print("0. Exit")
        choice = input("Choose an option: ")
        if choice == "1":
            add_dog(dogs)
        elif choice == "2":
            display_dogs(dogs)
        elif choice == "3":
            update_dog(dogs)
        elif choice == "4":
            delete_dog(dogs)
        elif choice == "5":
            search_for_dog(dogs)
        elif choice == "6":
            display_summary(dogs)
        elif choice == "7":
            search_by_breed(dogs)
        elif choice != "0":
            print("Invalid option")


if __name__ == "__main__":
    main()
