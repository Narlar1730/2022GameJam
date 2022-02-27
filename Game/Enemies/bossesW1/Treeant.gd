extends KinematicBody2D

var attack         = preload("res://Enemies/Plant attack.tscn")
const EnemyHitSound = preload("res://Enemies/EnemyHitSound.tscn")
var apple          = preload("res://Enemies/bossesW1/AppleAttack.tscn")
var chest          = preload("res://WorldItems/Chest.tscn")
var stairs         = preload("res://WorldItems/Stairs.tscn")

onready var player = get_node("/root/World/YFirst/Player")
onready var world  = get_node("/root/World")

var startHealth = 150
var health      = 10
var hitCounter  = 0
var moveTimer   = 0
var lifeClock : int = 0
var attackTimer = 0


var dir    : Vector2 = Vector2()
var speed  : int     = 60
var damage : int     = 1

var curCell      = Vector2()

var whichAttack = -1

var battleMode = false


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _process(delta):
	var pos = Vector2()
	pos.x = floor(((self.position.x)/16)/20)
	pos.y = floor(((self.position.y)/16)/12)
	curCell = pos
	var playerCell = player.curCell
	if curCell == playerCell and !battleMode:
		battleMode = true
		#get_child("He")
		#$HealthBox.
		#$HealthBox.position.x = player.position.x - 65
		#$HealthBox.position.y = player.position.y + 30
		$HealthBox.visible = true
		
		#print("Entered")
		#$AnimatedSprite.animation = "Attack2"
	if curCell != playerCell:
		$HealthBox.visible = false
		battleMode = false
		#print("Exited")
	
	if battleMode:
		if attackTimer == 0:
			var dirRNG = RandomNumberGenerator.new()
			dirRNG.randomize()
			var DirTrue = dirRNG.randi_range(0, 2)
			whichAttack = DirTrue
			attackTimer = 600
		else:
			attackTimer -= 1
		if whichAttack == 0:
			$AnimatedSprite.animation = "Walking"
			if attackTimer % 33:
				var look = self.get_node("RayCast2D")
				look.cast_to = (player.position - self.position)
				look.force_raycast_update()
				self.dir = look.cast_to.normalized()
			var motion = self.dir * self.speed
			self.move_and_slide(motion)
		elif whichAttack == 1:
			$AnimatedSprite.animation = "Attack1"
			var rand1 = RandomNumberGenerator.new()
			rand1.randomize()
			var x1 = rand1.randi_range(0, 19)
			var x2 = rand1.randi_range(0, 19)
			var x3 = rand1.randi_range(0, 19) 
			var x4 = rand1.randi_range(0, 19)
			var y1 = rand1.randi_range(0, 11)
			var y2 = rand1.randi_range(0, 11)
			var y3 = rand1.randi_range(0, 11)
			var y4 = rand1.randi_range(0, 11)
			
			if attackTimer % 80 == 0:
				var curAttack = attack.instance()
				curAttack.position.x = self.position.x + x1*6
				curAttack.position.y = self.position.y + y1*6
				get_tree().get_root().get_node("/root/World/YFirst").add_child(curAttack)
				var curAttack2 = attack.instance()
				curAttack2.position.x = self.position.x - x2*6
				curAttack2.position.y = self.position.y - y2*6
				get_tree().get_root().get_node("/root/World/YFirst").add_child(curAttack2)
				var curAttack3 = attack.instance()
				curAttack3.position.x = self.position.x + x3*6
				curAttack3.position.y = self.position.y + y3*6
				get_tree().get_root().get_node("/root/World/YFirst").add_child(curAttack3)
				var curAttack4 = attack.instance()
				curAttack4.position.x = self.position.x - x4*6
				curAttack4.position.y = self.position.y - y4*6
				get_tree().get_root().get_node("/root/World/YFirst").add_child(curAttack4)
			
			var printString = "pos1: " + str(x1) + ", " + str(y1) + " pos2: " + str(x2) + ", " + str(y2)
			print(printString)
			
		elif whichAttack == 2:
			if attackTimer % 80 == 0:
				var apple1 = apple.instance()
				apple1.position.x = self.position.x
				apple1.position.y = self.position.y
				var areWeSpawning = RandomNumberGenerator.new()
				areWeSpawning.randomize()
				var x1 = areWeSpawning.randi_range(-50, 50)
				var y1 = areWeSpawning.randi_range(-50, 50)

				apple1.xp1.x = x1
				apple1.xp1.y = y1
				get_tree().get_root().get_node("/root/World/YFirst").add_child(apple1)
			$AnimatedSprite.animation = "Attack2"
		var healthWidth = int(40.0 * (float(health)/startHealth))
		print(healthWidth)

		#$HealthBox.position.x = player.position.x/3 - 95
		#$HealthBox.position.y = player.position.y/3 + 45
		$HealthBox/HealthBar.polygon = [Vector2(0, 0), Vector2(healthWidth, 0), Vector2(healthWidth, 3), Vector2(0, 3)]
		#$HealthBox.position.x = player.position.x# - 65
		#$HealthBox.position.y = player.position.y# + 30
	
	if health <= 0:
		var star   = stairs.instance()
		star.position.x = self.position.x
		star.position.y = self.position.y - 10
		star.scale.x = 0.33
		star.scale.y = 0.33
		world.add_child(star)
		var chest1 = chest.instance()
		chest1.position.x = self.position.x
		chest1.position.y = self.position.y
		world.add_child(chest1)
		self.queue_free()
	

# Called when the node enters the scene tree for the first time.
func _ready():
	$HealthBox.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_area_entered(area):
	if area.is_in_group("Weapon"):
		#print("HIT")
		health = health - player.getDamage()
		
		hitCounter = 18
		var enemyHitSound = EnemyHitSound.instance()
		get_tree().current_scene.add_child(enemyHitSound)
	pass # Replace with function body.
