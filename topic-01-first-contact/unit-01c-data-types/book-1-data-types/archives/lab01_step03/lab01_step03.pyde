size(600,400)
background(0)  #black
stroke(153)    #medium gray
strokeWeight(4) 

#Integer Data Types (whole numbers)
num1 = 130
num2 = 120
num3 = 180

line (num1, num2, num3, num2)

#Printing out the datatype to the console
print('num1 is: {}'.format(type(num1)))
print('num2 is: {}'.format(type(num2)))
print('num3 is: {}'.format(type(num3)))
