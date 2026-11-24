class Rule:
    def __init__(self, conditions, advice):
        self.conditions = conditions
        self.advice = advice

    def matches(self, answers):
        for key, expected in self.conditions.items():
            if answers.get(key) != expected:
                return False
        return True

