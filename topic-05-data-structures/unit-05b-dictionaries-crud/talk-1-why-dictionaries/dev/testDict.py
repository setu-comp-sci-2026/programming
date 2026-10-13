student = {
    "name": "Ava",
    "age": 19,
    "course": "Computing",
    "mark": 82
}


for key, value in student.items():
    print(key, value) 


# print(student.keys()) #
# print(student.values())
# print(student.items())
# print(student[0])

# print(student["course"])

# movie = {
#     "title": "Jaws",
#     "year": 1975,
#     "rating": 5
# }


# # print(movie["title"]) # Jaws
# # print(movie["year"]) # 1975
# # print(movie["rating"]) # 5  


# print(movie.get("title")) # Jaws    
# print(movie.get("title", "Unknown Title")) # Jaws

# print(movie.get("director")) # None
# print(movie.get("director", "Unknown director"))#


# movie["rating"] = 5 # Add a new key-value pair
# movie["year"] = 1976 # Update an existing key

# print(movie) 