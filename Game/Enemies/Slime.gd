extends KinematicBody2D

onready var player = get_node("/root/World/YFirst/Player")
onready var world  = get_node("/root/World")
const EnemyHitSound = preload("res://Enemies/EnemyHitSound.tscn")
var item       = preload("res://WorldItems/WorldItem.tscn")
var coin       = preload("res://WorldItems/Coin.tscn")
var worldHeart = preload("res://WorldItems/WorldHeart.tscn")
var health = 5
var hitCounter = 12
var firstTime = true
var effect = "none"
var effectCounter = 0

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
	
func spawnLoot():
	var areWeSpawning = RandomNumberGenerator.new()
	areWeSpawning.randomize()
	var spawn = areWeSpawning.randi_range(0, 100)
	if spawn < 10:
		var wort = item.instance()
		wort.position.x = self.position.x
		wort.position.y = self.position.y
		var itemType = "Slime"
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
		var itemType = "StringOfSlime"
		var statsString = itemType + ".yellow.crafting." + itemType + ".1.10.crafting.AAAAAA"
		wort.stats = statsString
		world.add_child(wort)
	elif spawn < 40:
		var cHeart = worldHeart.instance()
		cHeart.position.x = self.position.x
		cHeart.position.y = self.position.y
		get_tree().get_root().get_node("/root/World/YFirst/YGrass").add_child(cHeart)

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
		player.addXP(2)
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
	spawnLoot()
	self.queue_free()
	
func _process(delta):
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
func addEffect(eff):
	if eff != "none" and effect == "none":
		effect = eff

func _on_Area2D_area_entered(area):
	if area.is_in_group("Weapon"):
		health -= player.getDamage()
		hitCounter = 12
		var enemyHitSound = EnemyHitSound.instance()
		addEffect(area.owner.effect)
		get_tree().current_scene.add_child(enemyHitSound)
		#print("PAIN")
	if area.is_in_group("Arrow"):
		area.owner.kill()

