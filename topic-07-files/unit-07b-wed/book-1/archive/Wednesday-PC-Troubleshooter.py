"""Week 7: data-driven PC troubleshooter with persistent JSON history."""
import json
from pathlib import Path
from datetime import datetime

BASE = Path(__file__).resolve().parent

def load_knowledge(filename):
    with open(filename, "r", encoding="utf-8") as file:
        return json.load(file)

def ask_questions(questions):
    answers = {}
    for question in questions:
        while True:
            answer = input(question["text"] + " (yes/no): ").strip().lower()
            if answer in ("yes", "no"):
                answers[question["key"]] = answer
                break
            print("Please enter yes or no.")
    return answers

def matches(rule, answers):
    for key, expected in rule["when"].items():
        if answers.get(key) != expected:
            return False
    return True

def recommend(rules, answers):
    for rule in rules:
        if matches(rule, answers):
            return rule["advice"], rule.get("reason", "Rule matched.")
    return "No matching rule. Ask for further help.", "No conditions matched."

def save_history(filename, record):
    history = []
    try:
        with open(filename, "r", encoding="utf-8") as file:
            history = json.load(file)
    except FileNotFoundError:
        pass
    history.append(record)
    with open(filename, "w", encoding="utf-8") as file:
        json.dump(history, file, indent=4)

def main():
    try:
        knowledge = load_knowledge(BASE / "knowledge.json")
    except (FileNotFoundError, json.JSONDecodeError) as error:
        print("Unable to load knowledge.json:", error)
        return
    answers = ask_questions(knowledge["questions"])
    advice, reason = recommend(knowledge["rules"], answers)
    print("Recommendation:", advice)
    print("Reason:", reason)
    record = {"time": datetime.now().isoformat(timespec="seconds"),
              "answers": answers, "advice": advice, "reason": reason}
    try:
        save_history(BASE / "history.json", record)
        print("Session saved.")
    except (OSError, json.JSONDecodeError) as error:
        print("Could not save history:", error)

if __name__ == "__main__":
    main()
