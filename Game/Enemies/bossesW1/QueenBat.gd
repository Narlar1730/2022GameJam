extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _process(delta):
	$AnimationPlayer.animation_set_next("Flight")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Area2D_area_entered(area):
	print("entered!" + str(area))
	pass # Replace with function body.
