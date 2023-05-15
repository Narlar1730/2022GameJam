extends Node

var arrow = preload("res://Effects/Arrow.tscn") 
var bomb  = preload("res://Effects/WorldBomb.tscn")
onready var player = get_node("/root/World/YFirst/Player")
#onready var world  = get_node("/root/World")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var shotSpeed = 5
var intMax = 9223372036854775807

func bomb(xpos, ypos, xvel, yvel, world):
	var b = bomb.instance()
	b.position.x = xpos
	b.position.y = ypos
	b.dir.x = xvel
	b.dir.y = yvel
	world.add_child(b)

func tragger(xBul, yBul, xPos, yPos, world, pressVec):
	var life = 20
	var b  = arrow.instance()
	b.spec = "tragger"
	b.life = life
	var b2 = arrow.instance()
	b2.spec = "tragger"
	b2.life = life
	var b3 = arrow.instance()
	b3.spec = "tragger"
	b3.life = life
	
	var vel = Vector2.ZERO
	vel.x = pressVec.x
	vel.y = pressVec.y
	vel = vel.normalized()

	var tempX : float = xBul*shotSpeed
	var tempY : float = yBul*shotSpeed
	var theta : float = 0
	
	if tempX != 0 and tempY != 0:
		tempX = tempX / sqrt(2)
		tempY = tempY / sqrt(2)
		
	tempX = tempX + vel.x
	tempY = tempY + vel.y
	
	if tempX != 0:
		if tempX > 0:
			theta = atan(tempY/tempX)
		else:
			theta = PI + atan(tempY/tempX)
	elif tempY > 0:
		theta = atan(intMax)
	elif tempY < 0:
		theta = atan(-intMax)
		
	#theta = (theta*PI/180)
	
	#print(theta)
	b.rotate(theta)
		
	b.xVel  = tempX*30
	b.yVel  = tempY*30
	b.position.x  = xPos
	b.position.y  = yPos-5
	world.add_child(b)
	###b2
	var vel2 = Vector2.ZERO
	vel2.x = pressVec.x
	vel2.y = pressVec.y
	vel2 = vel2.normalized()
	
	tempX = xBul*shotSpeed
	tempY = yBul*shotSpeed
	theta = 0
	
	if xBul > 0 and yBul > 0:
		tempX += 1
		tempY -= 1
	if xBul > 0 and yBul < 0:
		tempX += 1
		tempY += 1
	if xBul < 0 and yBul > 0:
		tempY += 1
		tempX += 1
	if xBul < 0 and yBul < 0:
		tempX += 1
		tempY -= 1
	if xBul > 0 and yBul == 0:
		tempY += 1
		tempX += 1
	if xBul < 0 and yBul == 0:
		tempY += 1
		tempX -= 1
	if xBul == 0 and yBul < 0:
		tempX += 1
		tempY -= 1
	if xBul == 0 and yBul > 0:
		tempX += 1
		tempY += 1

	if tempX != 0 and tempY != 0:
		tempX = tempX / sqrt(2)
		tempY = tempY / sqrt(2)
		
	tempX = tempX + vel2.x
	tempY = tempY + vel2.y
	
	if tempX != 0:
		if tempX > 0:
			theta = atan(tempY/tempX)
		else:
			theta = PI + atan(tempY/tempX)
	elif tempY > 0:
		theta = atan(intMax)
	elif tempY < 0:
		theta = atan(-intMax)
		
	#theta = (theta*PI/180)
	
	#print(theta)
	b2.rotate(theta)
		
	b2.xVel  = tempX*30
	b2.yVel  = tempY*30
	b2.position.x  = xPos
	b2.position.y  = yPos-5
	world.add_child(b2)
	#B3
	var vel3 = Vector2.ZERO
	vel3.x = pressVec.x
	vel3.y = pressVec.y
	vel3 = vel3.normalized()
	
	tempX = xBul*shotSpeed
	tempY = yBul*shotSpeed
	theta = 0

	if xBul > 0 and yBul > 0:
		tempX -= 1
		tempY += 1
	if xBul > 0 and yBul < 0:
		tempX -= 1
		tempY -= 1
	if xBul < 0 and yBul > 0:
		tempY -= 1
		tempX -= 1
	if xBul < 0 and yBul < 0:
		tempX -= 1
		tempY += 1
	if xBul > 0 and yBul == 0:
		tempY -= 1
		tempX += 1
	if xBul < 0 and yBul == 0:
		tempY -= 1
		tempX -= 1
	if xBul == 0 and yBul < 0:
		tempY -= 1
		tempX -= 1
	if xBul == 0 and yBul > 0:
		tempY += 1
		tempX -= 1

	if tempX != 0 and tempY != 0:
		tempX = tempX / sqrt(2)
		tempY = tempY / sqrt(2)
		
	tempX = tempX + vel3.x
	tempY = tempY + vel3.y
	
	if tempX != 0:
		if tempX > 0:
			theta = atan(tempY/tempX)
		else:
			theta = PI + atan(tempY/tempX)
	elif tempY > 0:
		theta = atan(intMax)
	elif tempY < 0:
		theta = atan(-intMax)
		
	#theta = (theta*PI/180)
	
	#print(theta)
	b3.rotate(theta)
		
	b3.xVel  = tempX*30
	b3.yVel  = tempY*30
	b3.position.x  = xPos
	b3.position.y  = yPos-5
	world.add_child(b3)

	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
