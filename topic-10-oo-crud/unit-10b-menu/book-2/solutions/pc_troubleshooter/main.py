from storage import load_system, load_history, save_history

def ask_questions(questions):
    answers = {}
    for question in questions:
        while True:
            answer = input(question.text + " (yes/no): ").strip().lower()
            if answer in ("yes", "no"):
                answers[question.key] = answer
                break
            print("Please enter yes or no.")
    return answers

def run_consultation(system):
    answers = ask_questions(system.questions)
    advice = system.recommend(answers)
    print("Recommendation:", advice)
    save_history(answers, advice)
    print("Consultation saved.")

def view_history():
    history = load_history()
    if not history:
        print("No consultations yet.")
    for record in history:
        print(record["time"], record["answers"], record["advice"])

def show_menu():
    print("\n=== PC TROUBLESHOOTER ===")
    print("1. Start a consultation")
    print("2. View consultation history")
    print("3. List knowledge-base questions")
    print("0. Exit")

def main():
    try:
        system = load_system()
    except (OSError, ValueError, KeyError, TypeError) as error:
        print("Cannot load knowledge:", error)
        return
    while True:
        show_menu()
        choice = input("Choose: ").strip()
        try:
            if choice == "1":
                run_consultation(system)
            elif choice == "2":
                view_history()
            elif choice == "3":
                for question in system.questions:
                    print(question)
            elif choice == "0":
                break
            else:
                print("Invalid choice")
        except (OSError, ValueError, KeyError, TypeError) as error:
            print("Operation failed:", error)

if __name__ == "__main__":
    main()

