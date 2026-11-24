import json
from pathlib import Path
from datetime import datetime
from question import Question
from rule import Rule
from troubleshooter import Troubleshooter

BASE_FOLDER = Path(__file__).resolve().parent
KNOWLEDGE_FILE = BASE_FOLDER / "knowledge.json"
HISTORY_FILE = BASE_FOLDER / "data" / "history.json"

def load_system():
    with open(KNOWLEDGE_FILE, "r", encoding="utf-8") as file:
        knowledge = json.load(file)
    system = Troubleshooter()
    for item in knowledge["questions"]:
        system.questions.append(Question(item["key"], item["text"]))
    for item in knowledge["rules"]:
        system.rules.append(Rule(item["when"], item["advice"]))
    return system

def load_history():
    try:
        with open(HISTORY_FILE, "r", encoding="utf-8") as file:
            return json.load(file)
    except FileNotFoundError:
        return []

def save_history(answers, advice):
    history = load_history()
    history.append({"time": datetime.now().isoformat(timespec="seconds"),
                    "answers": answers, "advice": advice})
    HISTORY_FILE.parent.mkdir(parents=True, exist_ok=True)
    with open(HISTORY_FILE, "w", encoding="utf-8") as file:
        json.dump(history, file, indent=4)

