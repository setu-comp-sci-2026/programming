movies = [
    {"title": "Jaws", "year": 1975, "rating": 5},
    {"title": "Alien", "year": 1979, "rating": 5},
    {"title": "Shrek", "year": 2001, "rating": 4}
]

# for movie in movies:
#     print(movie["title"], movie["year"])
    
# for movie in movies:
#     print(f"{movie['title']} ({movie['year']})")

# search_title = input("Enter title: ")

# for movie in movies:
#     if movie["title"].lower() == search_title.lower():
#         print("Found:", movie)
        
        # e.g. input: Shrek
        # output: Found: {'title': 'Shrek', 'year': 2001, 'rating': 4}
        
# for movie in movies:
#     if movie["rating"] >= 5:
#         print(movie["title"])

        # output: Jaws
        # output: Alien
        
# new_movie = {
#     "title": input("Title: "),
#     "year": int(input("Year: ")),
#     "rating": int(input("Rating: "))
# }

# movies.append(new_movie)

for movie in movies:
    print(movie["title"], movie["year"])
print("-----")
movies.sort(key=lambda movie: movie["title"])
for movie in movies:
    print(movie["title"], movie["year"])