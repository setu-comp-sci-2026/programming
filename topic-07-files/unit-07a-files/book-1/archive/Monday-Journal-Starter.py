"""Monday live-coding starter: text-file persistence."""

def add_note():
    note = input("Write a note: ")
    with open("journal.txt", "a", encoding="utf-8") as file:
        file.write(note + "\n")

def view_notes():
    try:
        with open("journal.txt", "r", encoding="utf-8") as file:
            for line in file:
                print(line.strip())
    except FileNotFoundError:
        print("No notes saved yet")

def main():
    while True:
        choice = input("1 Add note | 2 View notes | 0 Exit: ")
        if choice == "1": add_note()
        elif choice == "2": view_notes()
        elif choice == "0": break
        else: print("Choose 1, 2 or 0")

if __name__ == "__main__": main()
