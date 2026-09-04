xCoord = 300
yCoord = 300

def setup():
   size(600,600)
   background(0)   #black
   strokeWeight(2) 

def draw():
   stroke(255,0,0) #red
   line (xCoord, yCoord, mouseX, mouseY)
   stroke(255,255,0) #yellow
   line (xCoord , yCoord, mouseX - 100, mouseY - 100)
