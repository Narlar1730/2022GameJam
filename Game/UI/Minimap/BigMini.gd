extends Polygon2D


onready var player = get_node("/root/World/YFirst/Player")
onready var world  = get_node("/root/World")
var miniCell = preload("res://UI/Minimap/BigMiniCell.tscn")

var vis = true
var mod = false


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _process(delta):
	
	#### index = 3 

	self.position.x = player.position.x - 75
	self.position.y = player.position.y - 75
	
	if vis:
		self.visible = true
	else:
		self.visible = false
		
func addBossCell():
	var bossx = world.bossx
	var bossy = world.bossy
	var bossCell = miniCell.instance()
	bossCell.index = -3
	bossCell.position.x = bossx*15
	bossCell.position.y = bossy*15
	self.add_child(bossCell)

# Called when the node enters the scene tree for the first time.
func _ready():

	self.z_index = 15
	for i in 10:
		for j in 10:
			var curMiniCell = miniCell.instance()
			curMiniCell.index = j*10+i
			curMiniCell.position.x = j*15
			curMiniCell.position.y = i*15
			self.add_child(curMiniCell)
			
	# Add boss cell

			
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
