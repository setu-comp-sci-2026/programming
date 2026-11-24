class Troubleshooter:
    def __init__(self):
        self.questions = []
        self.rules = []

    def recommend(self, answers):
        for rule in self.rules:
            if rule.matches(answers):
                return rule.advice
        return "No matching rule. Ask for further help."

