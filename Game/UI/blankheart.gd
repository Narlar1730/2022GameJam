extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var player = get_node("/root/World/YFirst/Player")

var index = -1


func _process(delta):
	
	#### index = 3 

	self.position.x = player.position.x - 8*16+18*index
	self.position.y = player.position.y - 5*16
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
