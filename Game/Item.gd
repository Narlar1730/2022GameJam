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


func setSprite(sprite, colour):
	#print(sprite)
	if sprite == "sword":
		$Sprite.texture = load("res://items/Sword.png")
	elif sprite == "IronHead":
		$Sprite.texture = load("res://items/Armour/IronHead.png")
	elif sprite == "IronChest":
		$Sprite.texture = load("res://items/Armour/IronChest.png")
	elif sprite == "IronBoots":
		$Sprite.texture = load("res://items/Armour/IronBoots.png")
	elif sprite == "IronPants":
		$Sprite.texture = load("res://items/Armour/IronPants.png")
	elif sprite == "GoldHead":
		$Sprite.texture = load("res://items/Armour/GoldHead.png")
	elif sprite == "GoldChest":
		$Sprite.texture = load("res://items/Armour/GoldChest.png")
	elif sprite == "GoldBoots":
		$Sprite.texture = load("res://items/Armour/GoldBoots.png")
	elif sprite == "bow":
		$Sprite.texture = load("res://items/Bow.png")
	elif sprite == "Mace":
		$Sprite.texture = load("res://items/Mace.png")
	elif sprite == "FlamingSword":
		$Sprite.texture = load("res://items/FlamingSword.png")
	elif sprite == "GoldAxe":
		$Sprite.texture = load("res://items/GoldAxe.png")
	elif sprite == "GoldDagger":
		$Sprite.texture = load("res://items/GoldDagger.png")
	elif sprite == "GoldHammer":
		$Sprite.texture = load("res://items/GoldHammer.png")
	elif sprite == "HolySword":
		$Sprite.texture = load("res://items/HolySword.png")
	elif sprite == "Cape":
		$Sprite.texture = load("res://items/Armour/Cape.png")
		#var colour = player.inventory[index]
		#var all = colour.split(".")
		#var curColour = all[7]
		$Sprite.modulate = Color(colour)
	elif sprite == "BattleAxe":
		$Sprite.texture = load("res://items/BattleAxe.png")
	elif sprite == "BatWing":
		$Sprite.texture = load("res://items/Crafting/BatWing.png")
	elif sprite == "BatFang":
		$Sprite.texture = load("res://items/Crafting/BatTooth.png")
	elif sprite == "SpiderEye":
		$Sprite.texture = load("res://items/Crafting/SpiderEye.png")
	elif sprite == "SpiderSilk":
		$Sprite.texture = load("res://items/Crafting/SpiderSilk.png")
	elif sprite == "Slime":
		$Sprite.texture = load("res://items/Crafting/Slime.png")
	elif sprite == "StringOfSlime":
		$Sprite.texture = load("res://items/Crafting/StringOfSlime.png")
	elif sprite == "Stick":
		$Sprite.texture = load("res://items/Crafting/Stick.png")
	elif sprite == "HeartOfWood":
		$Sprite.texture = load("res://items/Crafting/HeartOfWood.png")
# Called when the node enters the scene tree for the first time.

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
