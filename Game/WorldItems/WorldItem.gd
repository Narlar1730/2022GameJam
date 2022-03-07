extends KinematicBody2D

onready var player = get_node("/root/World/YFirst/Player")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var stats : String = "bow.blue.test"

var clock = 0
var inc = 0

func updateClocks():
	clock = clock+1

func getRarity():
	var all = stats.split(".")
	var out = all[1]
	return out
	
func setRarity(rar):
	if rar == "red":
		$Blur.modulate = Color("FFAAA8")	
	elif rar == "orange":
		$Blur.modulate = Color("FF9933")	
	elif rar == "yellow":
		$Blur.modulate = Color("FFFFBF")	
	elif rar == "green":
		$Blur.modulate = Color("98FB98")	
	elif rar == "blue":
		#print("howdy")
		$Blur.modulate = Color("03A9F4")

	elif rar == "indigo":
		$Blur.modulate = Color("9892B1")
	elif rar == "violet":
		$Blur.modulate = Color("CC99FF")	
	elif rar == "rainbow":
		$Blur.modulate = Color("0000FF")	

func getColour():
	var all = stats.split(".")
	var out = all[7]
	return out

func getItem():
	var all = stats.split(".")
	var out = all[0]
	return out
		
func setSprite(sprite):
	if sprite == "sword":
		$Item.texture = load("res://items/Sword.png")
	elif sprite == "IronHead":
		$Item.texture = load("res://items/Armour/IronHead.png")
	elif sprite == "IronChest":
		$Item.texture = load("res://items/Armour/IronChest.png")
	elif sprite == "IronBoots":
		$Item.texture = load("res://items/Armour/IronBoots.png")
	elif sprite == "GoldHead":
		$Item.texture = load("res://items/Armour/GoldHead.png")
	elif sprite == "GoldChest":
		$Item.texture = load("res://items/Armour/GoldChest.png")
	elif sprite == "GoldBoots":
		$Item.texture = load("res://items/Armour/GoldBoots.png")
	elif sprite == "bow":
		$Item.texture = load("res://items/Bow.png")
	elif sprite == "Mace":
		$Item.texture = load("res://items/Mace.png")
	elif sprite == "FlamingSword":
		$Item.texture = load("res://items/FlamingSword.png")
	elif sprite == "GoldAxe":
		$Item.texture = load("res://items/GoldAxe.png")
	elif sprite == "GoldDagger":
		$Item.texture = load("res://items/GoldDagger.png")
	elif sprite == "GoldHammer":
		$Item.texture = load("res://items/GoldHammer.png")
	elif sprite == "HolySword":
		$Item.texture = load("res://items/HolySword.png")
	elif sprite == "Cape":
		$Item.texture = load("res://items/Armour/Cape.png")
		$Item.modulate = Color(getColour())

func rarSwitch(inc):
	var out = ""
	if inc == 0:
		out = "red"
	elif inc == 1:
		out = "orange"
	elif inc == 2:
		out = "yellow"
	elif inc == 3:
		out = "green"
	elif inc == 4:
		out = "blue"
	elif inc == 5:
		out = "indigo"
	elif inc == 6:
		out = "violet"
	return out

func _process(delta):
	updateClocks()
	var rar = getRarity()
	if rar == "rainbow":
		if clock % 20 == 0:
			inc = inc + 1
			if inc >= 7:
				inc = 0
		var newRar = rarSwitch(inc)
		setRarity(newRar)
		

# Called when the node enters the scene tree for the first time.
func _ready():
	#Draw Sprite
	var type = getItem()
	setSprite(type)
	#Draw Rarity
	var rar = getRarity()
	#print(rar)
	setRarity(rar)
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		if clock > 30:
			var success = player.insertInventory(stats)
		#hitTimer = immunity
			if success:
				self.queue_free()
		#enemies += 1
	pass # Replace with function body.
