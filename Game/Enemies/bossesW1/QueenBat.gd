extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _process(delta):
	pass

func flight_animation_finished():
	$AnimationPlayer.play("Flight")

# Called when the node enters the scene tree for the first time.
func _ready():
	#$AnimationPlayer.get_animation("Flight")
	$AnimationPlayer.play("Flight")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Area2D_area_entered(area):
	if area.is_in_group("Weapon"):
		print("entered!")
	pass # Replace with function body.
