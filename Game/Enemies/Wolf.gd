extends KinematicBody2D

const EnemyDeathEffect = preload("res://Effects/EnemyDeathEffect.tscn")
const EnemyHitSound = preload("res://Enemies/EnemyHitSound.tscn")
onready var player = get_node("/root/World/YFirst/Player")
onready var world  = get_node("/root/World")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var curState = "Idle"
var nextAnimation = false
var health = 10
var moving = false
var dir    : Vector2 = Vector2()
var speed  : int     = 90
var runningCounter = 0

func die():
	player.addXP(5)
	queue_free()

func playNext():
	moving = false
	if curState == "Idle":
		$AnimationPlayer.play("Idle")
	elif curState == "Die":
		$AnimationPlayer.play("Die")
	elif curState == "Running":
		$AnimationPlayer.play("Run")
		moving = true
	elif curState == "Howl":
		$AnimationPlayer.play("Howl")
	elif curState == "Leap":
		moving = true
		$AnimationPlayer.play("Leap")

func animationDone():
	var distance = self.position.distance_to(player.position)
	print(distance)
	if health <= 0:
		curState = "Die"
	elif distance < 6*16 and distance > 3*16 and runningCounter > 0:
		runningCounter -= 1
		curState = "Running"
	elif distance < 6*16 and distance > 3*16:
		runningCounter = 3
		curState = "Howl"
	elif distance < 6*16:
		if curState == "Leap":
			curState = "Running"
		else:
			curState = "Leap"
	else:
		curState = "Idle"
		
	playNext()

func _process(delta):
	if player.position.x < self.position.x:
		$Sprite.set_flip_h(true)
	else:
		$Sprite.set_flip_h(false)
	if moving and curState == "Running":
		self.dir.x = 0
		self.dir.y = 0	
		var look = self.get_node("RayCast2D")
		look.cast_to = (player.position - self.position)
		look.force_raycast_update()
		self.dir = look.cast_to.normalized()
	
		var motion = self.dir * self.speed
		self.move_and_slide(motion)
	elif moving:
		var motion = self.dir * self.speed*1.2
		self.move_and_slide(motion)
	pass
# Called when the node enters the scene tree for the first time.
func _ready():
	var colRNG = RandomNumberGenerator.new()
	colRNG.randomize()
	var col = colRNG.randi_range(0, 10)
	if col < 2:
		$Sprite.modulate = Color("777777")
	elif col < 4:
		$Sprite.modulate = Color("80461b")
	elif col < 6:
		$Sprite.modulate = Color("333333")
	elif col < 9:
		$Sprite.modulate = Color("536872")
	else:
		health = 20
		self.scale.x = 1.1
		self.scale.y = 1.1
	$AnimationPlayer.play("Idle")

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_area_entered(area):
	if area.is_in_group("Weapon"):
		print("Hurt")
		health = health - player.getDamage()
		#hitCounter = 18
		var enemyHitSound = EnemyHitSound.instance()
		get_tree().current_scene.add_child(enemyHitSound)
	if area.is_in_group("Arrow"):
		area.owner.kill()
