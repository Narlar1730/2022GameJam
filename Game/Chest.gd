extends KinematicBody2D

onready var player = get_node("/root/World/YFirst/Player")
onready var world  = get_node("/root/World")
var item     = preload("res://WorldItems/WorldItem.tscn")

var health = 1
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _process(delta):
	if health < 0:
		var howMany = RandomNumberGenerator.new()
		howMany.randomize()
		var num = howMany.randi_range(1, 3)
		for i in num:
			var wort = item.instance()
			wort.position.x = self.position.x + i*6
			wort.position.y = self.position.y + i*6
			var rng = RandomNumberGenerator.new()
			rng.randomize()
			var int1 = rng.randi_range(0, 6)
			var itemType = ""
			#var itemString = ""
			var statsString = ""
			var colour = ""
			if int1 == 0:
				itemType = "BattleAxe"
				statsString = itemType + ".red.primary." + itemType + ".5.N/A"
			#itemType = "sword"
			elif int1 == 1:
				itemType = "Bow"
				statsString = itemType + ".red.primary.some " + itemType + ".2.N/A"
			elif int1 == 2:
				itemType = "FlamingSword"
				statsString = itemType + ".red.primary." + itemType + ".6.N/A"
			elif int1 == 3:
				itemType = "GoldAxe"
				statsString = itemType + ".red.primary." + itemType + ".4.N/A"
			elif int1 == 4:
				itemType = "GoldDagger"
				statsString = itemType + ".red.primary." + itemType + ".2.N/A"
			elif int1 == 5:
				itemType = "GoldHammer"
				statsString = itemType + ".red.primary." + itemType + ".6.N/A"
			elif int1 == 6:
				itemType = "HolySword"
				statsString = itemType + ".red.primary." + itemType + ".8.N/A"
			else:
				itemType = "Mace"
				statsString = itemType + ".red.primary." + itemType + ".6.N/A"
				#itemType = "bow"
		
			var int2 = rng.randi_range(0, 6)
			colour = wort.rarSwitch(int2)
			var stats = str(itemType, ".", colour)
			wort.stats = statsString
			world.add_child(wort)
		self.queue_free()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_area_entered(area):
	if area.is_in_group("Weapon"):
		health = health - player.getDamage()
	pass # Replace with function body.
