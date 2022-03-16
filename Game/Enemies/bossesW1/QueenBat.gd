extends KinematicBody2D

onready var player = get_node("/root/World/YFirst/Player")
var stairs         = preload("res://WorldItems/Stairs.tscn")
onready var world  = get_node("/root/World")
var chest          = preload("res://WorldItems/Chest.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var maxHealth = 150
var health    = 150


var hitTimer = 0.0
var damTimer = 30.0

var dir    : Vector2  = Vector2()
var speed  : int      = 70
var curState : String = ""
var motion

var curCell      = Vector2()
var battleMode = false

func _process(delta):
	var pos = Vector2()
	pos.x = floor(((self.position.x)/16)/20)
	pos.y = floor(((self.position.y)/16)/12)
	curCell = pos
	var playerCell = player.curCell
	if health <= 0:
		var star   = stairs.instance()
		star.position.x = self.position.x
		star.position.y = self.position.y - 10
		star.scale.x = 0.33
		star.scale.y = 0.33
		world.add_child(star)
		var chest1 = chest.instance()
		chest1.position.x = self.position.x
		chest1.position.y = self.position.y+10
		world.add_child(chest1)
		player.addXP(25)
		self.queue_free()
	if curCell == playerCell and !battleMode:
		battleMode = true
		#get_child("He")
		#$HealthBox.
		#$HealthBox.position.x = player.position.x - 65
		#$HealthBox.position.y = player.position.y + 30
		$Outline.visible = true
		
		#print("Entered")
		#$AnimatedSprite.animation = "Attack2"
	if curCell != playerCell:
		$Outline.visible = false
		battleMode = false
		curState = "Flight"
		#print("Exited")
	
	if battleMode:
		if hitTimer > 0:
			hitTimer -= 1
			
		self.modulate = Color(1.0, (damTimer-hitTimer)/damTimer , (damTimer-hitTimer)/damTimer, 1.0)

		var healthWidth = int(120.0 * (float(health)/maxHealth))

		$Outline/Healthbar.polygon = [Vector2(-60, 120), Vector2(-60+healthWidth, 120), Vector2(-60+healthWidth, 125), Vector2(-60, 125)]


		if curState == "Flight":
			var distance = self.position.distance_to(player.position)
			if distance < 15*16:
				self.move_and_slide(motion)
		if health <= 0:
			self.queue_free()
	
func disableAll():
	$Area2D/CollisionPolygon2D.disabled   = true
	$Area2D/CollisionPolygon2D2.disabled  = true
	$Area2D/CollisionPolygon2D3.disabled  = true
	$Area2D/CollisionPolygon2D4.disabled  = true
	$Area2D/CollisionPolygon2D5.disabled  = true
	$Area2D/CollisionPolygon2D6.disabled  = true
	$Area2D/CollisionPolygon2D7.disabled  = true
	$Area2D/CollisionPolygon2D8.disabled  = true
	$Area2D/CollisionPolygon2D9.disabled  = true
	$Area2D/CollisionPolygon2D10.disabled = true
	$Area2D/CollisionPolygon2D11.disabled = true
	$Area2D/CollisionPolygon2D12.disabled = true
	$Area2D/CollisionPolygon2D13.disabled = true
	$Area2D/CollisionPolygon2D14.disabled = true
	$Area2D/CollisionPolygon2D15.disabled = true
	$Area2D/CollisionPolygon2D16.disabled = true
	$Area2D/CollisionPolygon2D17.disabled = true

var flightCounter  = 0
var screechCounter = 0
	
func flight_animation_finished():
	disableAll()
	self.dir.x = 0
	self.dir.y = 0	
	var look = self.get_node("RayCast2D")
	look.cast_to = (player.position - self.position)
	look.force_raycast_update()
	self.dir = look.cast_to.normalized()
	
	motion = self.dir * self.speed
	if !battleMode:
		$AnimationPlayer.play("Flight")
	elif flightCounter == 0:
		curState = "Stab"
		$AnimationPlayer.play("StabLeft")
	else:
		self.dir.x = 0
		self.dir.y = 0	

		curState = "Flight"
		$AnimationPlayer.play("Flight")
		flightCounter -= 1

func stab_right_done():
	disableAll()
	screechCounter = 4
	curState = "Screech"
	$AnimationPlayer.play("Screech")

func stab_left_done():
	disableAll()
	curState = "Stab"
	$AnimationPlayer.play("StabRight")

func screech_animation_finished():
	disableAll()
	if screechCounter == 0:
		flightCounter = 6
		curState = "Flight"
		self.dir.x = 0
		self.dir.y = 0	
		var look = self.get_node("RayCast2D")
		look.cast_to = (player.position - self.position)
		look.force_raycast_update()
		self.dir = look.cast_to.normalized()
	
		motion = self.dir * self.speed
		$AnimationPlayer.play("Flight")
	else:
		curState = "Screech"
		$AnimationPlayer.play("Screech")
		screechCounter -= 1

# Called when the node enters the scene tree for the first time.
func _ready():
	#$AnimationPlayer.get_animation("Flight")
	$AnimationPlayer.play("Flight")
	curState = "Screech"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func doDamage():
	hitTimer = damTimer
	health = health - player.getDamage()

func _on_Area2D_area_entered(area):
	if area.is_in_group("Player"):
		print("playah")
		#player.doDamage(1)
		player.addEnemy()
	if area.is_in_group("Weapon"):
		if area.is_in_group("Arrow"):
			area.owner.kill()
		doDamage()
	pass # Replace with function body.


func _on_Area2D_area_exited(area):
	if area.is_in_group("Player"):
		player.subEnemy()
		print("bye Playah")
	pass # Replace with function body.
