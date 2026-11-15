import json
def load_knowledge(filename):
  with open(filename, "r", encoding="utf-8") as file:
   return json.load(file)

def ask_questions(questions):
 answers = {}
 for question in questions:
   key = question["key"]
   answer = input(question["text"] + " (yes/no): ")
   answers[key] = answer.strip().lower()
 return answers

def matches(rule, answers):
 for key, expected in rule["when"].items():
   if answers.get(key) != expected:
     return False
 return True

def recommend(rules, answers):
 
 for rule in rules:
     if matches(rule, answers):
        return rule["advice"]
 return "No matching rule. Ask for further help."


knowledge = load_knowledge("knowledge.json")
# print(knowledge)
#print("Questions:", knowledge["questions"])
print("Rules:", knowledge["rules"])
# answers = ask_questions(knowledge["questions"])
# advice = recommend(knowledge["rules"], answers)
# print("Recommendation:", advice)