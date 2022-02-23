extends CanvasLayer

var cell = preload("res://UI/InventoryCell.tscn")
onready var player = get_node("/root/World/YFirst/Player")
onready var world  = get_node("/root/World")

var allCells = []

var pauseTimer = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func updateClocks():
	if pauseTimer < 0:
		pauseTimer = 0
	elif pauseTimer > 0:
		pauseTimer -= 1

	
func _process(delta):
	updateClocks()
	if Input.is_action_pressed("MouseClick") and !player.mouseClicked:
		#print("Clicked!")
		player.mouseClicked = true
		#player.clickedCursor = player.curCursor
		player.updateClickCursor(player.curCursor)
		print(player.curCursor)
		print(player.clickedCursor)
		
		#print(player.curCursor)
	if Input.is_action_just_released("MouseClick"):
		#print("Released!")
		#print("MouseReleased")
		if player.clickedCursor != -1 and player.curCursor != -1:
			player.swapInventory(player.clickedCursor, player.curCursor)
			#var t1 = allCells[player.clickedCursor]
			#var t2 = allCells[player.curCursor]
			
			#t1.index = player.curCursor
			#t2.index = player.clickedCursor
			
			#allCells[player.clickedCursor] = t2
			#allCells[player.curCursor] = t1
		player.clickedCursor = -1
		player.mouseClicked = false
	#print(pauseTimer)
	pass


# Called when the node enters the scene tree for the first time.
func _ready():
	## Set text
	for i in 2:
		for j in 6:
			var cell1 = cell.instance()
			cell1.position.x = 22*i+260
			cell1.position.y = 22*j+24
			cell1.z_index = 11
			cell1.modulate = Color("DDDDDD")
			cell1.index = 40 + i + j*2
			self.add_child(cell1)
	
	get_node("HealthText").text = "Health"		
	for i in 10:
		for j in 4:
			var cell1 = cell.instance()
			cell1.position.x = 22*i+20
			cell1.position.y = 68+j*22
			cell1.z_index = 11
			cell1.modulate = Color("DDDDDD")
			cell1.index = i + j*10
			#allCells.push_back(cell1)
			#print(cell1.index)
			self.add_child(cell1)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
