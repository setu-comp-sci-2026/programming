import json
from datetime import datetime

dogs = []

try:
    with open("dogs.json", "r") as file:
        dogs = json.load(file)

except FileNotFoundError as e:
    with open("errors.log", "a") as log:
        log.write(f"{datetime.now()}: dogs.json not found - {e}\n")