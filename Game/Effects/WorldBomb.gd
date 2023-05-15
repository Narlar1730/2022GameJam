extends KinematicBody2D

var effect = "fire"

var fuseTimer = 5
var burn1Fuse = fuseTimer
var burn2Fuse = fuseTimer
var burn3Fuse = fuseTimer
var burn4Fuse = fuseTimer
var dir    : Vector2 = Vector2()
var speed  : int     = 40

func _physics_process(delta):
	print(self.speed)
	if self.speed > 0:
		self.speed -= 1
	if self.speed < 0:
		self.speed += 1

		
	var motion = self.dir * self.speed
	self.move_and_slide(motion)


func burn1Done():
	if burn1Fuse == 0:
		$AnimationPlayer.play("Burn2")
	else:
		burn1Fuse -= 1
		$AnimationPlayer.play("Burn1")
	
func burn2Done():
	if burn2Fuse == 0:
		$AnimationPlayer.play("Burn3")
	else:
		burn2Fuse -= 1
		$AnimationPlayer.play("Burn2")
	
func burn3Done():
	if burn3Fuse == 0:
		$AnimationPlayer.play("Burn4")
	else:
		burn3Fuse -= 1
		$AnimationPlayer.play("Burn3")
	
func burn4Done():
	if burn4Fuse == 0:
		$AnimationPlayer.play("Blast")
	else:
		burn4Fuse -= 1
		$AnimationPlayer.play("Burn4")
	
func blastDone():
	self.queue_free()
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Burn1")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
