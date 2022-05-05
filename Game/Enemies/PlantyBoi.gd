extends KinematicBody2D

var curState = "NONE" 
var spore

func die():
	self.queue_free()
	
func getNextAnimation():
	if curState == "IDLE":
		$AnimationPlayer.play("Grow")
		curState = "GROW"
	elif curState == "GROW":
		$AnimationPlayer.play("Whip")
		curState = "WHIP"
	elif curState == "WHIP":
		$AnimationPlayer.play("Spore")
		curState = "SPORE"
	elif curState == "SPORE":
		$AnimationPlayer.play("Dead")
		curState = "DEAD"
	elif curState == "DEAD":
		die()

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Idle")
	curState = "IDLE"

