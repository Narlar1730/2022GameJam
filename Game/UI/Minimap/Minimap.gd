extends Polygon2D

onready var player = get_node("/root/World/YFirst/Player")
onready var world  = get_node("/root/World")
var minimapCell = preload("res://UI/Minimap/MinimapCell.tscn")

var vis = true

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _process(delta):
	
	#### index = 3 

	self.position.x = player.position.x + 6*16+10
	self.position.y = player.position.y - 5*16 - 6
	
	if vis:
		self.visible = true
	else:
		self.visible = false

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in 7:
		for j in 7:
			var curMini = minimapCell.instance()
			curMini.index = i + j*7
			curMini.z_index = 12
			self.add_child(curMini)
			curMini.reloadCell()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
