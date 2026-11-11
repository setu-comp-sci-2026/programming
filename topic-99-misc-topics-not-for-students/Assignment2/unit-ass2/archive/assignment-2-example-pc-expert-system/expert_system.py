class ExpertSystem:

    def __init__(self, knowledge_base):
        self.knowledge_base = knowledge_base
        self.answers = {}

    def consult(self):
        print("\n" + "=" * 50)
        print("PC TROUBLESHOOTING EXPERT")
        print("=" * 50)

        self.answers = {}

        for question in self.knowledge_base.questions:
            answer = question.ask()
            self.answers[question.question_id] = answer

        matching_rules = self.evaluate_rules()

        if len(matching_rules) == 0:
            print("\nNo exact recommendation was found.")
            print("You may need to seek further technical advice.")
            return

        # For this simple example, display the first matching rule.
        best_rule = matching_rules[0]

        recommendation = self.knowledge_base.find_recommendation(
            best_rule.recommendation_id
        )

        if recommendation is not None:
            recommendation.display()
            self.explain(best_rule)

    def evaluate_rules(self):
        matching_rules = []

        for rule in self.knowledge_base.rules:
            if rule.matches(self.answers):
                matching_rules.append(rule)

        return matching_rules

    def explain(self, rule):
        print("\nWHY?")
        print("-" * 50)
        print(f"Your answers matched {rule.rule_id}.")

        for question_id, expected_answer in rule.conditions.items():
            question = self.find_question(question_id)

            if question is not None:
                print(
                    f"- {question.text} "
                    f"Your answer: {self.answers[question_id]}"
                )

    def find_question(self, question_id):
        for question in self.knowledge_base.questions:
            if question.question_id == question_id:
                return question

        return None
