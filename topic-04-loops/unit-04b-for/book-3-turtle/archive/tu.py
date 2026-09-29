import turtle

screen = turtle.Screen()
t = turtle.Turtle()
t.speed(0)

length = 5

for line in range(60):
    t.forward(length)
    t.right(90)
    length += 5

turtle.done()