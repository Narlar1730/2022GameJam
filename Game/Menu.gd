extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var inside = false

func _process(delta):
	if Input.is_action_just_released("MouseClick") and inside:
		print("Clicked right!")		
	
# Called when the node enters the scene tree for the first time.

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_mouse_entered():
	$Area2D/Button.modulate = Color("DDDDDD")
	inside = true



func _on_Area2D_mouse_exited():
	$Area2D/Button.modulate = Color("FFFFFF")
	inside = false

