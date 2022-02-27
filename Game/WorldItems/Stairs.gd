extends Sprite

onready var player = get_node("/root/World/YFirst/Player")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass





func _on_Area2D_area_entered(area):
	#print("entered!")
	#print(area.get_groups())
	if area.is_in_group("Player"):
		player.health = 10
		get_tree().get_root().get_node("Global").setPlayer(player.inventory)
		get_tree().change_scene("res://World2.tscn")

		print("Travel!")
	pass # Replace with function body.
