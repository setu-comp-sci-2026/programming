sentence = "The quick brown fox jumps over the lazy dog"
# Finding substrings
print(sentence.find("fox")) # 16 (index of first match of "fox"- index starts at 0)
print(sentence.find("cat")) # -1 (not found)
print(sentence.count("the")) # 1 (case-sensitive)
print(sentence.count("the", 0, -1, )) 
# Checking start/end
print(sentence.startswith("The")) # True
print(sentence.endswith("dog")) # True
print(sentence.startswith("the")) # False (case-sensitive)