extends KinematicBody2D

onready var player = get_node("/root/World/YFirst/Player")
onready var world  = get_node("/root/World")

var attack         = preload("res://Enemies/Plant attack.tscn")

var health = 20
var speed  = 50
var curState = "idle"
var attackCounter = 0
var hitCounter = 0
var immunity = 12
var deathCounter = 20

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
	elif curState == "hurt":
		$AnimatedSprite.animation = "Hurt"
	elif curState == "dying":
		$AnimatedSprite.animation = "Dead"

func _physics_process(delta):
	self.dir.x = 0
	self.dir.y = 0	
	var look = self.get_node("RayCast2D")
	look.cast_to = (player.position - self.position)
	look.force_raycast_update()
	self.dir = look.cast_to.normalized()
	var motion = self.dir * self.speed
	var distance = self.position.distance_to(player.position)
	if health < 0:
		curState = "dying"
		if deathCounter > 0:
			deathCounter -= 1
		else:
			self.queue_free()
	elif hitCounter > 0:
		hitCounter -= 1
		curState = "hurt"
		self.modulate = Color(1.0, (immunity-hitCounter)/immunity , (immunity-hitCounter)/immunity, 1.0)
	elif distance < 5*8:
		attackCounter += 1
		curState = "attack"
		if attackCounter % 30 == 0:
			var curAttack = attack.instance()
			curAttack.position.x = self.position.x
			curAttack.position.y = self.position.y + 4
			get_tree().get_root().get_node("/root/World/YFirst").add_child(curAttack)
	elif distance < 5*16:
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


func _on_Area2D_area_entered(area):
	if area.is_in_group("Weapon"):
		print("Here")
		health -= player.damage
		hitCounter = immunity
	pass # Replace with function body.
