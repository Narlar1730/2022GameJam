extends KinematicBody2D

onready var player = get_node("/root/World/YFirst/Player")
onready var world  = get_node("/root/World")

var attack         = preload("res://Enemies/Plant attack.tscn")

var health = 10
var speed  = 50
var curState = "idle"
var attackCounter = 0

var dir    : Vector2 = Vector2()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func setAnimation():
	if curState == "idle":
		$AnimatedSprite.animation = "Idle"
	elif curState == "attack":
		$AnimatedSprite.animation = "Attack"
	elif curState == "moving":
		$AnimatedSprite.animation = "Walk"

func _physics_process(delta):
	self.dir.x = 0
	self.dir.y = 0	
	var look = self.get_node("RayCast2D")
	look.cast_to = (player.position - self.position)
	look.force_raycast_update()
	self.dir = look.cast_to.normalized()
	var motion = self.dir * self.speed
	var distance = self.position.distance_to(player.position)
	if distance < 5*8:
		attackCounter += 1
		curState = "attack"
		if attackCounter % 30 == 0:
			var curAttack = attack.instance()
			curAttack.position.x = self.position.x
			curAttack.position.y = self.position.y + 4
			get_tree().get_root().get_node("/root/World/YFirst").add_child(curAttack)
	elif distance < 5*20:
		attackCounter = 0
		curState = "moving"
		self.move_and_slide(motion)
	else:
		curState = "idle"
	
	setAnimation()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
