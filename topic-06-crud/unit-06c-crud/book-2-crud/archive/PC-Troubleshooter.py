"""Week 6 PC Troubleshooter


"""

questions = [
    {"id": 1, "text": "Does the computer turn on?"},
    {"id": 2, "text": "Is the power cable connected?"},
    {"id": 3, "text": "Is the power indicator light on?"}
]

recommendations = [
    {"id": 1, "title": "Check the power cable"},
    {"id": 2, "title": "Check the power supply"},
    {"id": 3, "title": "Check the monitor"}
]

rules = [
    {"id": 1, "question_id": 1, "expected_answer": "no", "recommendation_id": 1},
    {"id": 2, "question_id": 3, "expected_answer": "no", "recommendation_id": 2}
]


def display_questions(questions):
    for question in questions:
        print(question["id"], question["text"])


def find_question(questions, question_id):
    for question in questions:
        if question["id"] == question_id:
            return question
    return None


def add_question(questions, question_id, text):
    if find_question(questions, question_id) is not None:
        print("Question ID already exists")
    else:
        questions.append({"id": question_id, "text": text})
        print("Question added")


def update_question(questions, question_id, new_text):
    question = find_question(questions, question_id)
    if question is None:
        print("Question not found")
    else:
        question["text"] = new_text
        print("Question updated")


def delete_question(questions, question_id):
    question = find_question(questions, question_id)
    if question is None:
        print("Question not found")
    else:
        questions.remove(question)
        print("Question deleted")


def display_recommendations(recommendations):
    for recommendation in recommendations:
        print(recommendation["id"], recommendation["title"])


def show_rule_data(rules):
    for rule in rules:
        print("Rule ID:", rule["id"])
        print("Expected answer:", rule["expected_answer"])
        print("Recommendation ID:", rule["recommendation_id"])


def main():
    print("PC TROUBLESHOOTER — WEEK 6")
    print("Questions:")
    display_questions(questions)
    print("\nRecommendations:")
    display_recommendations(recommendations)
    print("\nRule data:")
    show_rule_data(rules)

    choice = ""
    while choice != "5":
        print("\nQUESTION MANAGER")
        print("1. Display questions")
        print("2. Add a question")
        print("3. Update a question")
        print("4. Delete a question")
        print("5. Exit")
        choice = input("Choose an option: ")
        if choice == "1":
            display_questions(questions)
        elif choice == "2":
            question_id = int(input("Question ID: "))
            text = input("Question text: ")
            add_question(questions, question_id, text)
        elif choice == "3":
            question_id = int(input("Question ID: "))
            text = input("New question text: ")
            update_question(questions, question_id, text)
        elif choice == "4":
            question_id = int(input("Question ID: "))
            delete_question(questions, question_id)
        elif choice != "5":
            print("Invalid option")


if __name__ == "__main__":
    main()
