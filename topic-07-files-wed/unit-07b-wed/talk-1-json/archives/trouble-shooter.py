import json
def load_knowledge(filename):
   with  open(filename, "r", encoding="utf-8") as file:
       return json.load(file)

# knowledge = load_knowledge("knowledge.json")
import os

print(os.getcwd())