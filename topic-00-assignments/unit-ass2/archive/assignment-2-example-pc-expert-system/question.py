class Question:
    """Base class for questions used by the expert system."""

    def __init__(self, question_id, text, category):
        self.question_id = question_id
        self.text = text
        self.category = category

    def ask(self):
        """Subclasses provide their own version of this method."""
        raise NotImplementedError("Subclasses must implement ask()")


class YesNoQuestion(Question):

    def ask(self):
        while True:
            answer = input(f"{self.text} (yes/no): ").strip().lower()

            if answer == "yes" or answer == "no":
                return answer

            print("Please enter yes or no.")


class ChoiceQuestion(Question):

    def __init__(self, question_id, text, category, choices):
        super().__init__(question_id, text, category)
        self.choices = choices

    def ask(self):
        print(self.text)

        for number, choice in enumerate(self.choices, start=1):
            print(f"{number}. {choice}")

        while True:
            try:
                selection = int(input("Choose an option: "))

                if 1 <= selection <= len(self.choices):
                    return self.choices[selection - 1].lower()

                print("Please choose one of the listed options.")

            except ValueError:
                print("Please enter a number.")


class NumericQuestion(Question):

    def ask(self):
        while True:
            try:
                return float(input(f"{self.text}: "))
            except ValueError:
                print("Please enter a number.")
