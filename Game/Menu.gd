extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var inside = false
var fullScreenTimer = 0

func updateClocks():

	#FullScreenClock
	if fullScreenTimer > 0:
		fullScreenTimer -= 1

func _process(delta):
	if Input.is_action_just_released("MouseClick") and inside:
		get_tree().change_scene("res://World.tscn")
	if Input.is_action_just_pressed("quitKey"):
		get_tree().quit()
	if Input.is_action_pressed("fullscreen") and !OS.window_fullscreen and fullScreenTimer == 0:
		OS.window_fullscreen = true
		fullScreenTimer = 40
	elif fullScreenTimer == 0 and Input.is_action_pressed("fullscreen"):
		OS.window_fullscreen = false
		fullScreenTimer = 40

	updateClocks()
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

