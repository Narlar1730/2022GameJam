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
			var int1 = rng.randi_range(0, 12)
			var itemType = ""
			#var itemString = ""
			var statsString = ""
			var colour = ""
			# "ITEM.RAR.TYPE.NAME.DAM/PROT.MAG.TYPE.COLOUR"

			if int1 == 0:
				itemType = "BattleAxe"
				statsString = itemType + ".red.primary." + itemType + ".5.N/A.axe.CC1111"
			#itemType = "sword"
			elif int1 == 1:
				itemType = "Bow"
				statsString = "bow" + ".red.primary.some " + itemType + ".2.N/A.bow.CC1111"
			elif int1 == 2:
				itemType = "FlamingSword"
				statsString = itemType + ".red.primary." + itemType + ".6.N/A.sword.CC1111"
			elif int1 == 3:
				itemType = "GoldAxe"
				statsString = itemType + ".red.primary." + itemType + ".4.N/A.axe.CC1111"
			elif int1 == 4:
				itemType = "GoldDagger"
				statsString = itemType + ".red.primary." + itemType + ".2.N/A.sword.CC1111"
			elif int1 == 5:
				itemType = "GoldHammer"
				statsString = itemType + ".red.primary." + itemType + ".6.N/A.hammer.CC1111"
			elif int1 == 6:
				itemType = "HolySword"
				statsString = itemType + ".red.primary." + itemType + ".8.N/A.sword.CC1111"
			elif int1 == 7:
				itemType = "Mace"
				statsString = itemType + ".red.primary." + itemType + ".6.N/A.hammer.CC1111"
				#itemType = "bow"
			elif int1 == 8:
				itemType = "IronHead"
				statsString = itemType + ".red.head." + itemType + ".1.N/A.head.CC1111"
			elif int1 == 9:
				itemType = "IronChest"
				statsString = itemType + ".red.chest." + itemType + ".1.N/A.chest.CC1111"
			elif int1 == 10:
				itemType = "IronPants"
				statsString = itemType + ".red.pants." + itemType + ".1.N/A.pants.CC1111"
			elif int1 == 11:
				itemType = "IronBoots"
				statsString = itemType + ".red.boots." + itemType + ".1.N/A.boots.CC1111"
			else:
				var r = float(rng.randi_range(0, 255))/255
				var g = float(rng.randi_range(0, 255))/255
				var b = float(rng.randi_range(0, 255))/255
				var c = Color(r, g, b)
				#print(c.to_html())
				itemType = "Cape"
				statsString = itemType + ".red.cape.some " + itemType + ".2.N/A.Cape." + c.to_html()
				#print(statsString)
		
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
