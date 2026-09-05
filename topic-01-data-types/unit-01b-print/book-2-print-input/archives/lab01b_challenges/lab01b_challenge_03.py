# Lab 01b Challenge 03
celsius = float(input("Enter temperature in Celsius: "))
fahrenheit = (celsius * 9/5) + 32
kelvin = celsius + 273.15

print(f"{celsius:.2f} °C  =  {fahrenheit:.2f} °F")
print(f"{celsius:.2f} °C  =  {kelvin:.2f} K")


# Example run
# Enter temperature in Celsius: 100
# 100.00 °C  =  212.00 °F
# 100.00 °C  =  373.15 K