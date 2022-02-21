extends Node2D

const GrassEffect = preload("res://Effects/GrassEffect.tscn")

onready var world  = get_node("/root/World/")

var coin = preload("res://WorldItems/Coin.tscn")

func spawnGrassLoot():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var int1 = rng.randi_range(0, 10)
	if int1 == 10:
		var curCoin = coin.instance()
		curCoin.position.x = self.position.x+8
		curCoin.position.y = self.position.y+4
		world.add_child(curCoin)
	

func create_grass_effect():
	var grasseffect = GrassEffect.instance()
	get_parent().add_child(grasseffect)
	grasseffect.global_position = global_position

func _on_Hurtbox_area_entered(area):
	create_grass_effect()
	spawnGrassLoot()
	queue_free()
