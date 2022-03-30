extends KinematicBody2D

var value : String = "bronze"

onready var player = get_node("/root/World/YFirst/Player")
onready var world  = get_node("/root/World/")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if value == "bronze":
		$AnimatedSprite.modulate = Color("CD7F32")
	elif value == "silver":
		$AnimatedSprite.modulate = Color("BEC2CB")
	elif value == "gold":
		$AnimatedSprite.modulate = Color("FFFF00")
	elif value == "platinum":
		$AnimatedSprite.modulate = Color("FFFFFF")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		var money = 0
		if value == "bronze":
			money = 1
		elif value == "silver":
			money = 100
		elif value == "gold":
			money = 10000
		elif value == "platinum":
			money = 1000000
		player.money = player.money+money
		world.coinPickup = true
		self.queue_free()
	pass # Replace with function body.
