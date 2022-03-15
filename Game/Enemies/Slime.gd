extends KinematicBody2D

onready var player = get_node("/root/World/YFirst/Player")
onready var world  = get_node("/root/World")
const EnemyHitSound = preload("res://Enemies/EnemyHitSound.tscn")


var health = 5
var hitCounter = 12
var firstTime = true

var dir    : Vector2       = Vector2()
var speed  : int           = 20
var prevPosition : Vector2 = Vector2()
#var damage : int     = 1
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func fast():
	speed = 40

func slow():
	speed = 20

func getNext():
	var curCell = world.water.world_to_map(self.position)
	#print(world.water.get_cell(17, 1))
	#print(world.water.get_cell(0, 0))
	#if world.water.get_cellv(curCell) != -1:
	#	print("water")
	#if world.water.get_cellv(curCell) == -1:
	#	print("dirt")
	speed = 40
	if health <= 0:
		$AnimationPlayer.play("Die")
	elif world.water.get_cellv(curCell) != -1:
		if firstTime:
			firstTime = false
			self.dir.x = 0
			self.dir.y = 0	
			var look = self.get_node("RayCast2D")
			look.cast_to = (player.position - self.position)
			look.force_raycast_update()
			self.dir = look.cast_to.normalized()

		if prevPosition.x == self.position.x:
			self.dir.x = self.dir.x * -1
		
		if prevPosition.y == self.position.y:
			self.dir.y = self.dir.y * -1
		speed = 40
		$AnimationPlayer.play("WaterJump")
	else:
		firstTime = true
		self.dir.x = 0
		self.dir.y = 0	
		var look = self.get_node("RayCast2D")
		look.cast_to = (player.position - self.position)
		look.force_raycast_update()
		self.dir = look.cast_to.normalized()

		$AnimationPlayer.play("Jump")
		
	var distance = self.position.distance_to(player.position)
	if distance > 10*16:
		#print("not chasing")
		speed = 0
	
func jumpNormal():
	pass
	
func jumpWater():
	pass
	
func die():
	self.queue_free()
	
func _process(delta):
	var distance = self.position.distance_to(player.position)
	if distance < 10*16:
		prevPosition = self.position
		var motion = self.dir * self.speed
		self.move_and_slide(motion)

# Called when the node enters the scene tree for the first time.
func _ready():
	self.dir.x = 0
	self.dir.y = 0	
	var look = self.get_node("RayCast2D")
	look.cast_to = (player.position - self.position)
	
	look.force_raycast_update()
	self.dir = look.cast_to.normalized()
	$AnimationPlayer.play("Jump")
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var r = float(rng.randi_range(0, 255))/255
	var g = float(rng.randi_range(0, 255))/255
	var b = float(rng.randi_range(0, 255))/255
	var c = Color(r, g, b)
	$Sprite.modulate = c


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_area_entered(area):
	if area.is_in_group("Weapon"):
		health -= player.getDamage()
		hitCounter = 12
		var enemyHitSound = EnemyHitSound.instance()
		get_tree().current_scene.add_child(enemyHitSound)
		#print("PAIN")
	if area.is_in_group("Arrow"):
		area.owner.kill()

