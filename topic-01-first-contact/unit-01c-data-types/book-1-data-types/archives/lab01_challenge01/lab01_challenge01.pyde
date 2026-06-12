xCoord = 300
yCoord = 300

def setup():
   size(600,600)
   background(0)   #black
   stroke(255,0,0) #red
   strokeWeight(2) 

def draw():
   line (xCoord, yCoord, mouseX, mouseY)
