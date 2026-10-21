"""Optional Challenge 4 — Book Manager, with CRUD and search."""
books = [
    {"isbn": "9780001", "title": "Python Basics", "author": "A. Writer", "available": True},
    {"isbn": "9780002", "title": "Computing Today", "author": "B. Author", "available": False}
]


def find_book(books, isbn):
    for book in books:
        if book["isbn"] == isbn:
            return book
    return None


def display_books(books):
    for book in books:
        print(book["isbn"], book["title"], book["author"], book["available"])


def add_book(books):
    isbn = input("ISBN: ")
    if find_book(books, isbn) is not None:
        print("ISBN already exists")
        return
    title = input("Title: ")
    author = input("Author: ")
    available = input("Available? (yes/no): ").strip().lower() == "yes"
    books.append({"isbn": isbn, "title": title, "author": author, "available": available})
    print("Book added")


def update_book(books):
    isbn = input("ISBN to update: ")
    book = find_book(books, isbn)
    if book is None:
        print("Book not found")
    else:
        book["available"] = input("Available? (yes/no): ").strip().lower() == "yes"
        print("Availability updated")


def delete_book(books):
    isbn = input("ISBN to delete: ")
    book = find_book(books, isbn)
    if book is None:
        print("Book not found")
    else:
        books.remove(book)
        print("Book deleted")


def search_book(books):
    isbn = input("ISBN to search for: ")
    book = find_book(books, isbn)
    if book is None:
        print("Book not found")
    else:
        print(book)


def main():
    choice = ""
    while choice != "0":
        print("\nBOOK MANAGER")
        print("1. Add book  2. View books  3. Update availability")
        print("4. Delete book  5. Find book  0. Exit")
        choice = input("Choose: ")
        if choice == "1":
            add_book(books)
        elif choice == "2":
            display_books(books)
        elif choice == "3":
            update_book(books)
        elif choice == "4":
            delete_book(books)
        elif choice == "5":
            search_book(books)
        elif choice != "0":
            print("Invalid option")


if __name__ == "__main__":
    main()
