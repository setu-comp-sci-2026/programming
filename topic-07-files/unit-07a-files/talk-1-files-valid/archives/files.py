with open("journal.txt", "w", encoding="utf-8") as file:
    file.write("I am learning Python.\n")
    file.write("I am learning about files.\n")

with open("journal.txt", "r", encoding="utf-8") as file:
    for line in file:
         print(line)
          
    
another_entry = input("What did you do next? ")
with open("journal.txt", "a", encoding="utf-8") as file:
    file.write(another_entry + "\n")

with open("journal.txt", "r", encoding="utf-8") as file:
    for line in file:
         print(line)    