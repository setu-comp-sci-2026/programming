# The actual file is data/students.json.
# Debug the path before deciding how to handle the exception.
import json
from pathlib import Path

folder = Path(__file__).resolve().parent
file_path = folder / "data" / "student.json"  # Spot the typo!
print("Trying:", file_path)
with open(file_path, "r", encoding="utf-8") as file:
    students = json.load(file)
print("Students loaded:", len(students))
