extends KinematicBody2D

const EnemyHitSound = preload("res://Enemies/EnemyHitSound.tscn")
onready var player = get_node("/root/World/YFirst/Player")
onready var world  = get_node("/root/World")

var item       = preload("res://WorldItems/WorldItem.tscn")
var coin       = preload("res://WorldItems/Coin.tscn")
var attack         = preload("res://Enemies/Plant attack.tscn")
var worldHeart = preload("res://WorldItems/WorldHeart.tscn")

var health = 20
var speed  = 50
var curState = "idle"
var attackCounter = 0
var hitCounter = 0
var immunity = 12
var deathCounter = 20
var effect = "none"
var effectCounter = 0

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

func spawnLoot():
	var areWeSpawning = RandomNumberGenerator.new()
	areWeSpawning.randomize()
	var spawn = areWeSpawning.randi_range(0, 100)
	if spawn < 10:
		var wort = item.instance()
		wort.position.x = self.position.x
		wort.position.y = self.position.y
		var itemType = "Stick"
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
		var itemType = "HeartOfWood"
		var statsString = itemType + ".yellow.crafting." + itemType + ".1.10.crafting.AAAAAA"
		wort.stats = statsString
		world.add_child(wort)
	elif spawn < 40:
		var cHeart = worldHeart.instance()
		cHeart.position.x = self.position.x
		cHeart.position.y = self.position.y
		get_tree().get_root().get_node("/root/World/YFirst/YGrass").add_child(cHeart)

func _physics_process(delta):
	if effect == "fire":
		$Effect.visible = true
		if effectCounter == 0:
			effectCounter = 12
			
			var rng = RandomNumberGenerator.new()
			rng.randomize()
			var randNum = rng.randi_range(0, 6)
			if randNum <= 1:
				health -= 2
				var enemyHitSound = EnemyHitSound.instance()
				get_tree().current_scene.add_child(enemyHitSound)
			elif randNum == 2:
				effect = "none"
		else:
			effectCounter -= 1
	else:
		$Effect.visible = false
		
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
			spawnLoot()
			player.addXP(3)
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
func addEffect(eff):
	if eff != "none" and effect == "none":
		effect = eff

func _on_Area2D_area_entered(area):
	if area.is_in_group("Weapon"):
		#print("Here")
		if area.is_in_group("Bomb"):
			health -= player.getDamage()*10
		else:
			health -= player.getDamage()
		hitCounter = immunity
		var enemyHitSound = EnemyHitSound.instance()
		addEffect(area.owner.effect)
		get_tree().current_scene.add_child(enemyHitSound)
	if area.is_in_group("Arrow"):
		area.owner.kill()
