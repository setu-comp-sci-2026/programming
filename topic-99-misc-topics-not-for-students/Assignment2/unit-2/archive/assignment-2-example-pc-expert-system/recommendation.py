class Recommendation:

    def __init__(self, recommendation_id, title, description):
        self.recommendation_id = recommendation_id
        self.title = title
        self.description = description

    def display(self):
        print("\n" + "=" * 50)
        print("RECOMMENDATION")
        print("=" * 50)
        print(self.title)
        print(self.description)
