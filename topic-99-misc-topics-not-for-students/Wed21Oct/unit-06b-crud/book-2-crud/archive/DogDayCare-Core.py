"""Week 6: Dog Day Care CRUD — core lecturer solution.

Run this file and use the menu. Assumes valid integer input, as in the lab.
"""

dogs = [
    {"id": 1, "name": "Buddy", "breed": "Retriever", "age": 4},
    {"id": 2, "name": "Luna", "breed": "Labrador", "age": 2},
    {"id": 3, "name": "Milo", "breed": "Spaniel", "age": 6}
]


def display_dogs(dogs):
    if len(dogs) == 0:
        print("No dogs recorded")
    for dog in dogs:
        print(dog["id"], dog["name"], dog["breed"], dog["age"])


def find_dog(dogs, dog_id):
    for dog in dogs:
        if dog["id"] == dog_id:
            return dog
    return None


def add_dog(dogs):
    dog_id = int(input("ID: "))
    if find_dog(dogs, dog_id) is not None:
        print("A dog with this ID already exists")
        return

    name = input("Name: ")
    breed = input("Breed: ")
    age = int(input("Age: "))
    dogs.append({"id": dog_id, "name": name, "breed": breed, "age": age})
    print("Dog added")


def update_dog(dogs):
    dog_id = int(input("Dog ID to update: "))
    dog = find_dog(dogs, dog_id)
    if dog is None:
        print("Dog not found")
    else:
        dog["age"] = int(input("New age: "))
        print("Dog updated")


def delete_dog(dogs):
    dog_id = int(input("Dog ID to delete: "))
    dog = find_dog(dogs, dog_id)
    if dog is None:
        print("Dog not found")
    else:
        confirmation = input("Are you sure? (yes/no): ").lower()
        if confirmation == "yes":
            dogs.remove(dog)
            print("Dog deleted")
        else:
            print("Delete cancelled")


def main():
    choice = ""
    while choice != "0":
        print("\nDOG DAY CARE MANAGER")
        print("1. Add dog")
        print("2. View dogs")
        print("3. Update dog")
        print("4. Delete dog")
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
        elif choice != "0":
            print("Invalid option")


if __name__ == "__main__":
    main()
