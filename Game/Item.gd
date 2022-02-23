extends KinematicBody2D

onready var player = get_node("/root/World/YFirst/Player")

var index = -1

func _to_string():
	return("true")
	
func str():
	return("true")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func returnItem(string):
	var out = "sword"
	return out
	
func _process(delta):
	var mousePos = get_viewport().get_mouse_position()
	#print(mousePos)z
	if player.mouseClicked and index == player.clickedCursor:
		if index < 40:
			self.position.x = mousePos.x - 44 - (index % 10 - 1)*22 
			self.position.y = mousePos.y - 70 - (floor(index/10))*22
		else:
			self.position.x = mousePos.x - 286 - (index%2-1)*22
			self.position.y = mousePos.y - 22 - (floor((index-40)/2))*22
			#self.position.x = mousePos.x - 44 - (index % 10 - 1)*22 
			#self.position.y = mousePos.y - 70 - (floor(index/10))*22
	else:
		self.position.x = 10 
		self.position.y = 10 


func setSprite(sprite):
	if sprite == "bow":
		$Sprite.texture = load("res://items/Bow.png")
	elif sprite == "sword":
		$Sprite.texture = load("res://items/Sword.png")
	elif sprite == "IronHead":
		$Sprite.texture = load("res://items/Armour/IronHead.png")
	elif sprite == "IronChest":
		$Sprite.texture = load("res://items/Armour/IronChest.png")
	elif sprite == "IronBoots":
		$Sprite.texture = load("res://items/Armour/IronBoots.png")
# Called when the node enters the scene tree for the first time.

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
