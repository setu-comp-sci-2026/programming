import random

dice_rolls = [0,0,0,0,0,0,0]
for num in range(100000):
    number = random.randint(1,6)
    dice_rolls[number] +=1

print(dice_rolls)