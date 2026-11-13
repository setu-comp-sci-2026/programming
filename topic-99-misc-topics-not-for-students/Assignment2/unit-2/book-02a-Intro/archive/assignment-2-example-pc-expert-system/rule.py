class Rule:

    def __init__(self, rule_id, conditions, recommendation_id):
        self.rule_id = rule_id
        self.conditions = conditions
        self.recommendation_id = recommendation_id

    def matches(self, answers):
        """Return True when every condition in this rule is satisfied."""

        for question_id, expected_answer in self.conditions.items():

            if question_id not in answers:
                return False

            actual_answer = answers[question_id]

            if str(actual_answer).lower() != str(expected_answer).lower():
                return False

        return True
