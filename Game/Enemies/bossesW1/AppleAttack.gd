extends KinematicBody2D

onready var player = get_node("/root/World/YFirst/Player")

var dir    : Vector2 = Vector2()
var speed  : int     = 60
var damage : int     = 1
var prevX  : float
var prevY  : float
var life   : int     = 2000

var xp1 = Vector2()

var curRotation = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _process(delta):
	$Sprite.rotation_degrees = curRotation
	curRotation = curRotation + 5
	life = life - 1
	prevX = self.position.x
	prevY = self.position.y
	var motion = self.dir * self.speed
	self.move_and_slide(motion)
	#print(prevX)
	#print(prevY)
	#print(self.position.x)
	#print(self.position.y)
	if self.position.x == prevX or self.position.y == prevY or life <= 0:
		self.queue_free()

# Called when the node enters the scene tree for the first time.
func _ready():
	prevX = self.position.x
	prevY = self.position.y
	self.dir.x = 0
	self.dir.y = 0	
	var look = self.get_node("RayCast2D")



	look.cast_to = (xp1)
	look.force_raycast_update()
	self.dir = look.cast_to.normalized()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_area_entered(area):
	if area.is_in_group("Weapon"):
		life = 0
	pass # Replace with function body.
