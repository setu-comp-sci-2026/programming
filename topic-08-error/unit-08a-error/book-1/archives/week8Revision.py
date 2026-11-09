import json
from pathlib import Path

def get_data_path(filename):
    # Find the directory containing this Python file
    script_dir = Path(__file__).resolve().parent

    # Create a data folder if it doesn't exist
    data_dir = script_dir / "data"
    data_dir.mkdir(exist_ok=True)

    # Return the full path to the requested file
    return data_dir / filename


dogs = ["Buddy", "Max", "Bella"]

# Save data
with open(get_data_path("dogs.json"), "w") as file:
    json.dump(dogs, file, indent=4)

# Load data
with open(get_data_path("dogs.json"), "r") as file:
    dogs = json.load(file)

print(dogs)
