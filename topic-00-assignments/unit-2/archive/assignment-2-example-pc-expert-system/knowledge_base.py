import json

from question import Question, YesNoQuestion, ChoiceQuestion, NumericQuestion
from recommendation import Recommendation
from rule import Rule


class KnowledgeBase:

    def __init__(self, filename):
        self.filename = filename
        self.questions = []
        self.rules = []
        self.recommendations = []

    def load(self):
        """Load the knowledge base from a JSON file."""

        try:
            with open(self.filename, "r", encoding="utf-8") as file:
                data = json.load(file)

            self._create_questions(data.get("questions", []))
            self._create_rules(data.get("rules", []))
            self._create_recommendations(data.get("recommendations", []))

        except FileNotFoundError:
            print("Knowledge base file could not be found.")
        except json.JSONDecodeError:
            print("The knowledge base contains invalid JSON.")

    def _create_questions(self, question_data):
        self.questions = []

        for item in question_data:
            question_type = item.get("type")

            if question_type == "yes_no":
                question = YesNoQuestion(
                    item["id"],
                    item["text"],
                    item["category"]
                )

            elif question_type == "choice":
                question = ChoiceQuestion(
                    item["id"],
                    item["text"],
                    item["category"],
                    item["choices"]
                )

            elif question_type == "numeric":
                question = NumericQuestion(
                    item["id"],
                    item["text"],
                    item["category"]
                )

            else:
                question = Question(
                    item["id"],
                    item["text"],
                    item["category"]
                )

            self.questions.append(question)

    def _create_rules(self, rule_data):
        self.rules = []

        for item in rule_data:
            rule = Rule(
                item["id"],
                item["conditions"],
                item["recommendation"]
            )
            self.rules.append(rule)

    def _create_recommendations(self, recommendation_data):
        self.recommendations = []

        for item in recommendation_data:
            recommendation = Recommendation(
                item["id"],
                item["title"],
                item["description"]
            )
            self.recommendations.append(recommendation)

    def find_recommendation(self, recommendation_id):
        for recommendation in self.recommendations:
            if recommendation.recommendation_id == recommendation_id:
                return recommendation

        return None

    def display_questions(self):
        print("\nQUESTIONS")
        print("-" * 50)

        for question in self.questions:
            print(f"{question.question_id}: {question.text}")

    def display_rules(self):
        print("\nRULES")
        print("-" * 50)

        for rule in self.rules:
            print(
                f"{rule.rule_id}: {rule.conditions} "
                f"-> {rule.recommendation_id}"
            )

    def display_recommendations(self):
        print("\nRECOMMENDATIONS")
        print("-" * 50)

        for recommendation in self.recommendations:
            print(
                f"{recommendation.recommendation_id}: "
                f"{recommendation.title}"
            )

    def add_recommendation(self):
        recommendation_id = input("Recommendation ID: ").strip()
        title = input("Title: ").strip()
        description = input("Description: ").strip()

        recommendation = Recommendation(
            recommendation_id,
            title,
            description
        )

        self.recommendations.append(recommendation)
        self.save()
        print("Recommendation added.")

    def delete_recommendation(self):
        recommendation_id = input(
            "Enter the recommendation ID to delete: "
        ).strip()

        recommendation = self.find_recommendation(recommendation_id)

        if recommendation is None:
            print("Recommendation not found.")
            return

        self.recommendations.remove(recommendation)
        self.save()
        print("Recommendation deleted.")

    def save(self):
        """Save the current knowledge base back to JSON."""

        questions = []

        for question in self.questions:
            item = {
                "id": question.question_id,
                "text": question.text,
                "category": question.category
            }

            if isinstance(question, YesNoQuestion):
                item["type"] = "yes_no"
            elif isinstance(question, ChoiceQuestion):
                item["type"] = "choice"
                item["choices"] = question.choices
            elif isinstance(question, NumericQuestion):
                item["type"] = "numeric"
            else:
                item["type"] = "question"

            questions.append(item)

        rules = []

        for rule in self.rules:
            rules.append({
                "id": rule.rule_id,
                "conditions": rule.conditions,
                "recommendation": rule.recommendation_id
            })

        recommendations = []

        for recommendation in self.recommendations:
            recommendations.append({
                "id": recommendation.recommendation_id,
                "title": recommendation.title,
                "description": recommendation.description
            })

        data = {
            "questions": questions,
            "rules": rules,
            "recommendations": recommendations
        }

        with open(self.filename, "w", encoding="utf-8") as file:
            json.dump(data, file, indent=4)
