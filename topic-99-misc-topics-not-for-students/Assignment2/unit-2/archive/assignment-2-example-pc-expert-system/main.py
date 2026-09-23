from knowledge_base import KnowledgeBase
from expert_system import ExpertSystem


def display_main_menu():
    print("\n" + "=" * 50)
    print("PC EXPERT SYSTEM")
    print("=" * 50)
    print("1. Start consultation")
    print("2. Manage knowledge base")
    print("0. Exit")


def display_knowledge_menu():
    print("\nKNOWLEDGE BASE MANAGEMENT")
    print("-" * 50)
    print("1. View questions")
    print("2. View rules")
    print("3. View recommendations")
    print("4. Add recommendation")
    print("5. Delete recommendation")
    print("0. Return")


def manage_knowledge_base(knowledge_base):
    choice = ""

    while choice != "0":
        display_knowledge_menu()
        choice = input("Choose an option: ").strip()

        if choice == "1":
            knowledge_base.display_questions()
        elif choice == "2":
            knowledge_base.display_rules()
        elif choice == "3":
            knowledge_base.display_recommendations()
        elif choice == "4":
            knowledge_base.add_recommendation()
        elif choice == "5":
            knowledge_base.delete_recommendation()
        elif choice == "0":
            print("Returning to main menu.")
        else:
            print("Invalid option.")


def main():
    knowledge_base = KnowledgeBase("data/knowledge_base.json")
    knowledge_base.load()

    expert_system = ExpertSystem(knowledge_base)

    choice = ""

    while choice != "0":
        display_main_menu()
        choice = input("Choose an option: ").strip()

        if choice == "1":
            expert_system.consult()
        elif choice == "2":
            manage_knowledge_base(knowledge_base)
        elif choice == "0":
            print("Goodbye.")
        else:
            print("Invalid option.")


if __name__ == "__main__":
    main()
