extends KinematicBody2D

onready var player = get_node("/root/World/YFirst/Player")
onready var world  = get_node("/root/World")

var startHealth = 60
var health      = 60
var hitCounter  = 0
var moveTimer   = 0
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
		#get_child("He")
		#$HealthBox.
		#$HealthBox.position.x = player.position.x - 65
		#$HealthBox.position.y = player.position.y + 30
		$HealthBox.visible = true
		
		#print("Entered")
		#$AnimatedSprite.animation = "Attack2"
	if curCell != playerCell:
		$HealthBox.visible = false
		battleMode = false
		#print("Exited")
	
	if battleMode:
		var healthWidth = int(40.0 * (float(health)/startHealth))
		print(healthWidth)

		#$HealthBox.position.x = player.position.x/3 - 95
		#$HealthBox.position.y = player.position.y/3 + 45
		$HealthBox/HealthBar.polygon = [Vector2(0, 0), Vector2(healthWidth, 0), Vector2(healthWidth, 3), Vector2(0, 3)]
		#$HealthBox.position.x = player.position.x# - 65
		#$HealthBox.position.y = player.position.y# + 30
	
	if health <= 0:
		self.queue_free()
	

# Called when the node enters the scene tree for the first time.
func _ready():
	$HealthBox.visible = false
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
