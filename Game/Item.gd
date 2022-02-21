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
		self.position.x = mousePos.x - 44 - (index % 10 - 1)*22 
		self.position.y = mousePos.y - 70 - (floor(index/10))*22#(index %4)*20
	else:
		self.position.x = 10 
		self.position.y = 10 


func setSprite(sprite):
	if sprite == "bow":
		$Sprite.texture = load("res://items/Bow.png")
# Called when the node enters the scene tree for the first time.

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
