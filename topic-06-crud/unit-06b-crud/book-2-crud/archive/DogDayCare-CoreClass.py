"""Week 6 – Building a CRUD Application: Dog Day Care Manager.

Complete example to accompany the lecture slides.
Pseudocode is included as comments immediately before each section.
"""
dogs = []

def populate_dogs(dogs):
# PSEUDOCODE: STORE each dog's ID, name, breed and age in a dictionary.
# ADD each dictionary to a list of dogs.
    dogs.append({"id": 1, "name": "Buddy", "breed": "Golden Retriever", "age": 4})
    dogs.append({"id": 2, "name": "Luna", "breed": "Labrador", "age": 2, "vax": "Fully Vaccinated"})



def display_dogs(dogs):
    # PSEUDOCODE:
    # RECEIVE the list of dogs.
    # IF the list is empty, DISPLAY a message and STOP.
    # FOR EACH dog in the list, DISPLAY its ID, name, breed and age.
    if len(dogs) == 0:
        print("No dogs to display")
        return

    for dog in dogs:
        print(dog["id"], dog["name"], dog["breed"], dog["age"], dog.get("vax", "NOT RECORDED"))


def find_dog(dogs, dog_id):
    # PSEUDOCODE:
    # RECEIVE the list of dogs and an ID to search for.
    # FOR EACH dog in the list:
    #     IF its ID matches, RETURN the dog dictionary.
    # RETURN None if no dog matches.
    for dog in dogs:
        if dog["id"] == dog_id:
            return dog
    return None


def add_dog(dogs):
    # PSEUDOCODE:
    # ASK for the new dog's ID.
    # SEARCH for that ID using find_dog().
    # IF the ID already exists, DISPLAY a message and STOP.
    # OTHERWISE ASK for name, breed and age.
    # CREATE a dictionary containing those details.
    # ADD the dictionary to the dogs list.
    dog_id = int(input("ID: "))

    existing = find_dog(dogs, dog_id)
    if existing is not None:
        print("That ID already exists")
        return

    name = input("Name: ")
    breed = input("Breed: ")
    age = int(input("Age: "))

    dog = {
        "id": dog_id,
        "name": name,
        "breed": breed,
        "age": age,
    }
    dogs.append(dog)
    print("Dog added")


def update_dog(dogs):
    # PSEUDOCODE:
    # ASK for the ID of the dog to update.
    # SEARCH for the dog using find_dog().
    # IF the dog exists, ASK for its new age and CHANGE the age.
    # OTHERWISE DISPLAY "Dog not found".
    dog_id = int(input("Dog ID: "))
    dog = find_dog(dogs, dog_id)

    if dog is not None:
        dog["age"] = int(input("New age: "))
        print("Dog updated")
    else:
        print("Dog not found")


def delete_dog(dogs):
    # PSEUDOCODE:
    # ASK for the ID of the dog to delete.
    # SEARCH for the dog using find_dog().
    # IF the dog exists, REMOVE it from the list.
    # OTHERWISE DISPLAY "Dog not found".
    dog_id = int(input("Dog ID: "))
    dog = find_dog(dogs, dog_id)

    if dog is not None:
        dogs.remove(dog)
        print("Dog deleted")
    else:
        print("Dog not found")


def main():
    populate_dogs(dogs)
    # PSEUDOCODE:
    # SET choice to an empty string.
    # WHILE choice is not "0":
    #     DISPLAY the menu.
    #     ASK the user to choose an option.
    #     IF choice is "1", ADD a dog.
    #     ELSE IF choice is "2", DISPLAY the dogs.
    #     ELSE IF choice is "3", UPDATE a dog.
    #     ELSE IF choice is "4", DELETE a dog.
    #     ELSE IF choice is not "0", DISPLAY an invalid option message.
    # END when the user chooses "0".
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

    print("Goodbye!")


# Run the menu when this file is executed directly.
if __name__ == "__main__":
    main()
