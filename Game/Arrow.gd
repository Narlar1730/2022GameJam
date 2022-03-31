extends KinematicBody2D

var xVel : int = 0
var yVel : int = 0
var life : int = 75
var effect = "none"

var vel : Vector2 = Vector2()

# Components

func kill():
	queue_free()

func _physics_process(delta):
	
	life -= 1
	
	vel.x = xVel
	vel.y = yVel

	vel = move_and_slide(vel)
	
	if vel.x != xVel || vel.y != yVel:
		queue_free()

	
	if life == 0:
		queue_free()

# Called when the node enters the scene tree for the first time.
func _ready():
	if effect == "fire":
		$Effect.visible = true
	else:
		$Effect.visible = false
	pass 


func _on_Area2D_area_entered(area):
	pass # Replace with function body.
