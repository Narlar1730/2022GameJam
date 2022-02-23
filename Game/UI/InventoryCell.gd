extends Polygon2D

onready var player = get_node("/root/World/YFirst/Player")


var item = preload("res://items/Item.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var index = -1
var drawStats = false
var firstDraw = true
var hoverTimer = 0


func drawStatsFun(val):
	self.get_node("StatsBox/Label").modulate = Color("0000FF")
	self.get_node("StatsBox/Label2").modulate = Color("00FF00")
	self.get_node("StatsBox/Label3").modulate = Color("FF0000")
	if firstDraw:
		if index < 40 and index % 10 < 5:
			var curX = self.get_node("StatsBox").position.x
			self.get_node("StatsBox").position.x = curX + 20
		else:
			var curX = self.get_node("StatsBox").position.x
			self.get_node("StatsBox").position.x = curX - 40
			
		self.get_node("StatsBox").position.y = self.get_node("StatsBox").position.y - 10
		firstDraw = false
	self.get_node("StatsBox").visible = true

func _process(delta):
	if index == player.curCursor:
		hoverTimer += 1
		drawStats = true
	else:
		hoverTimer = 0
		drawStats = false
		firstDraw = true
	
	if drawStats:
		if player.inventory[index] != "" and hoverTimer > 30:
			drawStatsFun(index)
	else:
		self.get_node("StatsBox").position.x = 0
		self.get_node("StatsBox").position.y = 0
		self.get_node("StatsBox").visible = false
	
	
func setItems(itemName):
	var curItem = item.instance()
	curItem.setSprite(itemName)
	curItem.position.x += 0
	curItem.position.y += 0
	curItem.z_index = 12
	curItem.index = index
	self.add_child(curItem)

# Called when the node enters the scene tree for the first time.
func _ready():
	#print(player.inventory)
	var curArray = player.getInventory()
	var curVal = curArray[index]
	var curItemArr = curVal.split(".")
	var curItems = curItemArr[0]
	#var backup = curVal
	#print(curArray)
	if curItems != "":
		setItems(curItems)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Area2D_mouse_exited():
	drawStats = false
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

	self.modulate = Color("FFFFFF")
	#self.modulate = Color("FFFFFF")
	pass # Replace with function body.


