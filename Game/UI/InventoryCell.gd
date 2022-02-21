extends Polygon2D

onready var player = get_node("/root/World/YFirst/Player")


var item = preload("res://items/Item.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var index = -1

func _process(delta):
	
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	#print(player.inventory)
	var curArray = player.getInventory()
	var curVal = curArray[index]
	var curItemArr = curVal.split(".")
	var curItems = curItemArr[0]
	#var backup = curVal
	#print(curArray)
	if curItems == "sword":
		var curItem = item.instance()
		curItem.setSprite("sword")
		curItem.position.x += 0
		curItem.position.y += 0
		curItem.z_index = 12
		curItem.index = index
		self.add_child(curItem)
	elif curItems == "bow":
		var curItem = item.instance()
		curItem.setSprite("bow")
		curItem.position.x += 0
		curItem.position.y += 0
		curItem.z_index = 12
		curItem.index = index
		self.add_child(curItem)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Area2D_mouse_exited():
	if !player.updateFrame:
		#print("LEEEEEEEEAVE")
		player.updateCursor(-1)
	#player.curCursor = -1
	self.modulate = Color("DDDDDD")
		
	player.updateFrame = false


func _on_Area2D_mouse_entered():
	player.updateFrame = true
	#print("entered: ", index)
	player.updateCursor(index)
	#print("Player: ", player.curCursor)
	#rint("Player 2: ", player.clickedCursor)
	#player.curCursor = index
	self.modulate = Color("FFFFFF")
	#self.modulate = Color("FFFFFF")
	pass # Replace with function body.


