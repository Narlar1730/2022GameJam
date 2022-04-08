extends Node

var arrow = preload("res://Effects/Arrow.tscn") 
var intMax = 9223372036854775806
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func shoot(xBul, yBul, xpos, ypos, enchant, vel, world, player):
	var shotSpeed = player.shotSpeed
	if enchant == "DS":
		player.shotcounter = 4
		var b  = arrow.instance()
		var b2 = arrow.instance()		

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
		b.position.x  = xpos
		b.position.y  = ypos-5
		world.add_child(b)
		###b2

		var vel2 = vel
		
		tempX = xBul*shotSpeed
		tempY = yBul*shotSpeed
		theta = 0

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
		b2.position.x  = xpos-1
		b2.position.y  = ypos-5-1
		world.add_child(b2)
	elif enchant == "DSF":
		player.shotcounter = 4
		var b  = arrow.instance()
		var b2 = arrow.instance()
		b.effect = "fire"
		b2.effect = "fire"
		

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
		b.position.x  = xpos
		b.position.y  = ypos-5
		world.add_child(b)
		###b2
		var vel2 = vel
		
		tempX = xBul*shotSpeed
		tempY = yBul*shotSpeed
		theta = 0

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
		b2.position.x  = xpos-1
		b2.position.y  = ypos-5-1
		world.add_child(b2)
	elif enchant == "TS":
		player.shotcounter = 4
		var b  = arrow.instance()
		var b2 = arrow.instance()
		var b3 = arrow.instance()

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
		b.position.x  = xpos
		b.position.y  = ypos-5
		world.add_child(b)
		###b2
		var vel2 = Vector2.ZERO
		vel2.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		vel2.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
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
		
		
#			if xBul != 0:
#				tempY += 1
#
#			if yBul != 0:
#				tempX += 1
		
		

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
		b2.position.x  = xpos
		b2.position.y  = ypos-5
		world.add_child(b2)
		#B3
		var vel3 = Vector2.ZERO
		vel3.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		vel3.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
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
		b3.position.x  = xpos
		b3.position.y  = ypos-5
		world.add_child(b3)
	elif enchant == "TSF":
		player.shotcounter = 4
		var b  = arrow.instance()
		var b2 = arrow.instance()
		var b3 = arrow.instance()
		b.effect = "fire"
		b2.effect = "fire"
		b3.effect = "fire"

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
		b.position.x  = xpos
		b.position.y  = ypos-5
		world.add_child(b)
		###b2
		var vel2 = Vector2.ZERO
		vel2.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		vel2.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
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
		
		
#			if xBul != 0:
#				tempY += 1
#
#			if yBul != 0:
#				tempX += 1
		
		

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
		b2.position.x  = xpos
		b2.position.y  = ypos-5
		world.add_child(b2)
		#B3
		var vel3 = Vector2.ZERO
		vel3.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		vel3.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
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
		b3.position.x  = xpos
		b3.position.y  = ypos-5
		world.add_child(b3)
	elif enchant == "F":
		player.shotcounter = 4
		var b = arrow.instance()
		b.effect = "fire"
		
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
			
		b.xVel = tempX*30
		b.yVel = tempY*30
		b.position.x = xpos
		b.position.y = ypos-5
		world.add_child(b)
	else:
		player.shotcounter = 4
		var b = arrow.instance()

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
			
		b.xVel = tempX*30
		b.yVel = tempY*30
		b.position.x = xpos
		b.position.y = ypos-5
		world.add_child(b)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
