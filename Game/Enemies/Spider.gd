extends KinematicBody2D

const EnemyDeathEffect = preload("res://Effects/EnemyDeathEffect.tscn")
const EnemyHitSound = preload("res://Enemies/EnemyHitSound.tscn")
var item       = preload("res://WorldItems/WorldItem.tscn")
var coin       = preload("res://WorldItems/Coin.tscn")
var worldHeart = preload("res://WorldItems/WorldHeart.tscn")
onready var player = get_node("/root/World/YFirst/Player")
onready var world  = get_node("/root/World")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var health     = 10
var hitCounter = 0
var moveTimer  = 0
var lifeClock : int = 0
var effect          = "none"
var effectCounter   = 0


var dir    : Vector2 = Vector2()
var speed  : int     = 60
var damage : int     = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func spawnLoot():
	var areWeSpawning = RandomNumberGenerator.new()
	areWeSpawning.randomize()
	var spawn = areWeSpawning.randi_range(0, 100)
	if spawn < 10:
		var wort = item.instance()
		wort.position.x = self.position.x
		wort.position.y = self.position.y
		var itemType = "SpiderEye"
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
	elif spawn == 35:
		var wort = item.instance()
		wort.position.x = self.position.x
		wort.position.y = self.position.y
		var itemType = "SpiderSilk"
		var statsString = itemType + ".yellow.crafting." + itemType + ".1.10.crafting.AAAAAA"
		wort.stats = statsString
		world.add_child(wort)
	elif spawn < 40:
		var cHeart = worldHeart.instance()
		cHeart.position.x = self.position.x
		cHeart.position.y = self.position.y
		get_tree().get_root().get_node("/root/World/YFirst/YGrass").add_child(cHeart)

func _process(delta):
	lifeClock += 1
	if health <= 0:
		player.addXP(3)
		var enemyDeathEffect = EnemyDeathEffect.instance()
		get_parent().add_child(enemyDeathEffect)
		enemyDeathEffect.global_position = global_position
		spawnLoot()
		#world.spawnLoot(self.position.x, self.position.y)
		self.queue_free()

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
	
	if hitCounter < 0:
		hitCounter = 0
	elif hitCounter > 0:
		hitCounter = hitCounter - 1
		
	if lifeClock > 125:
		lifeClock = 0
		
	
		
#	self.dir.x = 0
#	self.dir.y = 0	
#	var look = self.get_node("RayCast2D")
#	look.cast_to = (player.position - self.position)
#	look.force_raycast_update()
#	self.dir = look.cast_to.normalized()
	
#	var motion = self.dir * self.speed
	
	if lifeClock == 0:
		var dirRNG = RandomNumberGenerator.new()
		dirRNG.randomize()
		var DirTrue = dirRNG.randi_range(0, 2)
		self.dir.x = 0
		self.dir.y = 0	
		var look = self.get_node("RayCast2D")
		if DirTrue == 2:
			look.cast_to = (player.position - self.position)
		else:
			var rngX1 = dirRNG.randi_range(-100, 100)
			var rngY1 = dirRNG.randi_range(-100, 100)
			var rngX2 = dirRNG.randi_range(-100, 100)
			var rngY2 = dirRNG.randi_range(-100, 100)
			var sec   = Vector2()
			var one   = Vector2()
			sec.x = rngX1
			sec.y = rngY1
			one.x = rngX2
			one.y = rngY2
			look.cast_to = (sec - one)
		look.force_raycast_update()
		self.dir = look.cast_to.normalized()
		
	var motion = self.dir * self.speed
	if hitCounter > 0:
		var look = self.get_node("RayCast2D")
		look.cast_to - player.position - self.position
		look.force_raycast_update()
		self.dir = look.cast_to.normalized()
		motion = self.dir*self.speed
		motion = motion*-1.2
		hitCounter -=1
	
	var distance = self.position.distance_to(player.position)
	if distance < 10*16 and lifeClock < 100:
		self.move_and_slide(motion)



#func _on_Area2D_area_entered(area):
#	health = health - area.damage
#	hitCounter = 12 
#	pass # Replace with function body.
func addEffect(eff):
	if eff != "none" and effect == "none":
		effect = eff

func _on_Hurtbox_area_entered(area):
	if area.is_in_group("Weapon"):
		if area.is_in_group("Bomb"):
			health -= player.getDamage()*10
		else:
			health -= player.getDamage()
		hitCounter = 18
		var enemyHitSound = EnemyHitSound.instance()
		addEffect(area.owner.effect)
		get_tree().current_scene.add_child(enemyHitSound)
	if area.is_in_group("Arrow"):
		area.owner.kill()
