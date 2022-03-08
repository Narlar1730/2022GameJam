extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#0 -4
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var int1 = rng.randi_range(0, 4)
	$Sprite.set_frame(int1)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
