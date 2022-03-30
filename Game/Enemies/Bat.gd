extends KinematicBody2D

const EnemyDeathEffect = preload("res://Effects/EnemyDeathEffect.tscn")
const EnemyHitSound = preload("res://Enemies/EnemyHitSound.tscn")
var item       = preload("res://WorldItems/WorldItem.tscn")
var coin       = preload("res://WorldItems/Coin.tscn")
onready var player = get_node("/root/World/YFirst/Player")
onready var world  = get_node("/root/World")

var knockback = Vector2.ZERO
var dir    : Vector2 = Vector2()
var speed  : int     = 40
var damage : int     = 1

var hitCounter : int = 0

onready var stats = $Stats

func _ready():
	pass
	#print(stats.max_health)
	#print(stats.health)

func _physics_process(delta):
	self.dir.x = 0
	self.dir.y = 0	
	var look = self.get_node("RayCast2D")
	look.cast_to = (player.position - self.position)
	look.force_raycast_update()
	self.dir = look.cast_to.normalized()
	
	var motion = self.dir * self.speed
	if hitCounter > 0:
		motion = motion*-1.2
		hitCounter -=1
	elif hitCounter <= 0:
		hitCounter = 0
	else:
		hitCounter -= 1
	
	#knockback = knockback.move_toward(Vector2.ZERO, 200 * delta)
	#knockback = move_and_slide(knockback)
	
	var distance = self.position.distance_to(player.position)
	if distance < 5*16:
		self.move_and_slide(motion)

func _on_Hurtbox_area_entered(area):
	if area.is_in_group("Weapon"):
		stats.health -= player.getDamage()
		hitCounter = 12
		var enemyHitSound = EnemyHitSound.instance()
		get_tree().current_scene.add_child(enemyHitSound)

	if area.is_in_group("Arrow"):
		area.owner.kill()
	
func spawnLoot():
	var areWeSpawning = RandomNumberGenerator.new()
	areWeSpawning.randomize()
	var spawn = areWeSpawning.randi_range(0, 100)
	if spawn < 10:
		var wort = item.instance()
		wort.position.x = self.position.x
		wort.position.y = self.position.y
		var itemType = "BatWing"
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
		var itemType = "BatFang"
		var statsString = itemType + ".yellow.crafting." + itemType + ".1.10.crafting.AAAAAA"
		wort.stats = statsString
		world.add_child(wort)
	

func _on_Stats_no_health():
	player.addXP(2)
	queue_free()
	var enemyDeathEffect = EnemyDeathEffect.instance()
	get_parent().add_child(enemyDeathEffect)
	enemyDeathEffect.global_position = global_position
	spawnLoot()
	#world.spawnLoot(self.position.x, self.position.y)
