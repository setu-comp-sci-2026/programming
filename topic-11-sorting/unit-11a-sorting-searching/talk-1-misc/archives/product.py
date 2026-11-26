class Product:
    """A minimal Product class used by the sorting examples."""

    def __init__(self, name: str, price: float, product_id: int, category: str = "General"):
        self.__name = name
        self.__price = price
        self.__product_id = product_id
        self.__category = category

    def get_name(self) -> str:
        return self.__name

    def get_price(self) -> float:
        return self.__price

    def get_product_id(self) -> int:
        return self.__product_id

    def get_category(self) -> str:
        return self.__category

    def __str__(self) -> str:
        return f"{self.__product_id}: {self.__name} ({self.__category}) €{self.__price:.2f}"
