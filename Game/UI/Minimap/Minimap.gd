extends Polygon2D

onready var player = get_node("/root/World/YFirst/Player")

var minimapCell = preload("res://UI/Minimap/MinimapCell.tscn")


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _process(delta):
	
	#### index = 3 

	self.position.x = player.position.x + 6*16+10
	self.position.y = player.position.y - 5*16 - 6

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in 7:
		for j in 7:
			var curMini = minimapCell.instance()
			curMini.index = i + j*7
			
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
