extends Polygon2D

onready var player = get_node("/root/World/YFirst/Player")
onready var world  = get_node("/root/World")

var index = -1
var mod   = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func xyToMazeCell(x, y):
	x = x + 6
	y = y + 6
	var curCell = y*6+x
	return curCell

func reloadCell():
	self.position.x = (index / 7)*7
	self.position.y = (index % 7)*7

# 9, 6

#-313 + 20*16 + 9*16 = xorigin
#4 + 6*16 = yorigin
#-313, 4

func _process(delta):
	var allCells = player.visitedCells
	var curCell  = player.curCell
	var curX = 3 - index / 7 
	var curY = 3 - index % 7 
	
	var xMax = curCell.x - 4
	var xMin = curCell.x + 4
	var yMax = curCell.y - 4
	var yMin = curCell.y + 4

	
	var draw = 0
	
	var bossx = world.bossx
	var bossy = world.bossy
	
	for i in allCells:
		var vX = i.x
		var vY = i.y
		if xMax < vX and vX < xMin and yMax < vY and vY < yMin:
			var xDif = curCell.x - vX
			var yDif = curCell.y - vY
			if curY == yDif and curX == xDif:
				if vX == bossx-5 and vY == bossy-5:
					mod = 1
				else:
					mod = 0
				draw = 1
	
	if index == 24:
		self.visible = true
	elif draw == 1:
		if mod == 2:
			self.modulate = Color("88FF88")
		elif mod == 1:
			self.modulate = Color("FF8888")
		elif mod == 0:
			self.modulate = Color("888888")
		self.visible = true
	else:
		self.visible = false
	
	pass
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
