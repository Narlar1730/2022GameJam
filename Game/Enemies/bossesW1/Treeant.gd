extends KinematicBody2D

onready var player = get_node("/root/World/YFirst/Player")
onready var world  = get_node("/root/World")

var health     = 60
var hitCounter = 0
var moveTimer  = 0
var lifeClock : int = 0


var dir    : Vector2 = Vector2()
var speed  : int     = 60
var damage : int     = 1

var curCell      = Vector2()

var battleMode = false


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _process(delta):
	var pos = Vector2()
	pos.x = floor(((self.position.x)/16)/20)
	pos.y = floor(((self.position.y)/16)/12)
	curCell = pos
	var playerCell = player.curCell
	if curCell == playerCell and !battleMode:
		battleMode = true
		#print("Entered")
		$AnimatedSprite.animation = "Attack2"
	if curCell != playerCell:
		battleMode = false
		#print("Exited")
	if health <= 0:
		self.queue_free()
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_area_entered(area):
	if area.is_in_group("Weapon"):
		#print("HIT")
		health = health - player.damage
		
		hitCounter = 18
	pass # Replace with function body.
