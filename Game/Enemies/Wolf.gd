extends KinematicBody2D

const EnemyDeathEffect = preload("res://Effects/EnemyDeathEffect.tscn")
const EnemyHitSound = preload("res://Enemies/EnemyHitSound.tscn")
onready var player = get_node("/root/World/YFirst/Player")
onready var world  = get_node("/root/World")

var item       = preload("res://WorldItems/WorldItem.tscn")
var coin       = preload("res://WorldItems/Coin.tscn")
var attack         = preload("res://Enemies/Plant attack.tscn")
var worldHeart = preload("res://WorldItems/WorldHeart.tscn")
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
var effect = "none"
var effectCounter = 0

func die():
	spawnLoot()
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

func spawnLoot():
	var areWeSpawning = RandomNumberGenerator.new()
	areWeSpawning.randomize()
	var spawn = areWeSpawning.randi_range(0, 100)
	if spawn < 10:
		var wort = item.instance()
		wort.position.x = self.position.x
		wort.position.y = self.position.y
		var itemType = "WolfSkin"
		var statsString = itemType + ".red.crafting." + itemType + ".1.10.crafting.AAAAAA"
		wort.stats = statsString
		world.add_child(wort)
	elif spawn < 30:
		var curCoin = coin.instance()
		#curCoin.value = "silver"
		curCoin.position.x = self.position.x
		curCoin.position.y = self.position.y
		world.add_child(curCoin)
	elif spawn < 35:
		var curCoin = coin.instance()
		curCoin.value = "silver"
		curCoin.position.x = self.position.x
		curCoin.position.y = self.position.y
		world.add_child(curCoin)
	elif spawn < 40:
		var cHeart = worldHeart.instance()
		cHeart.position.x = self.position.x
		cHeart.position.y = self.position.y
		get_tree().get_root().get_node("/root/World/YFirst/YGrass").add_child(cHeart)

func animationDone():
	var distance = self.position.distance_to(player.position)
	#print(distance)
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

	if effect == "fire":
		$Effect.visible = true
		if effectCounter == 0:
			effectCounter = 12
			
			var rng = RandomNumberGenerator.new()
			rng.randomize()
			var randNum = rng.randi_range(0, 6)
			if randNum <= 1:
				health -= 1
				var enemyHitSound = EnemyHitSound.instance()
				get_tree().current_scene.add_child(enemyHitSound)
			elif randNum == 2:
				effect = "none"
		else:
			effectCounter -= 1
	else:
		$Effect.visible = false	

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
func addEffect(eff):
	if eff != "none" and effect == "none":
		effect = eff

func _on_Area2D_area_entered(area):
	if area.is_in_group("Weapon"):
		#print("Hurt")
		health = health - player.getDamage()
		#hitCounter = 18
		addEffect(area.owner.effect)
		var enemyHitSound = EnemyHitSound.instance()
		get_tree().current_scene.add_child(enemyHitSound)
	if area.is_in_group("Arrow"):
		area.owner.kill()

