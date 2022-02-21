extends KinematicBody2D

var item = preload("res://items/Item.tscn")

onready var world  = get_node("/root/World/")

export var ACCELERATION = 500
export var MAX_SPEED = 80
export var ROLL_SPEED = 120
export var FRICTION = 500
var hitTimer : float = 0
var health = 6
var enemies = 0
var immunity : float = 60
var damage = 4

#Handle Iventory
var inventory = []
var curCursor = -1
var clickedCursor = -1
var mouseClicked = false
var updateFrame = false

#GIMME DAT SHMONEY $$$
var money = 0


enum {
	MOVE,
	ROLL,
	ATTACK
}

var state = MOVE
var velocity = Vector2.ZERO
var roll_vector = Vector2.DOWN

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")
onready var swordHitbox = $HitboxPivot/SwordHitbox

func updateClickCursor(val):
	while clickedCursor != val:
		clickedCursor = val

func updateCursor(val):
	while(curCursor!=val):
		curCursor = val

func doDamage(dam):
	health = health - dam
	hitTimer = immunity

func handleHits():
	if hitTimer < 0:
		hitTimer = 0
	else:
		self.modulate = Color(1.0, (immunity-hitTimer)/immunity , (immunity-hitTimer)/immunity, 1.0)
		if enemies > 0 and hitTimer == 0 and state!=ROLL:
			var curColour = self.modulate
			doDamage(1)
		hitTimer = hitTimer - 1
		
func insertInventory(item):
	var out = false
	var counter = 0
	for i in inventory:
		if i == "" and !out:
			inventory[counter] = item
			out = true
		counter += 1
		
	return out
	
func swapInventory(pos1, pos2):
	print("SWIGGITY")
	var cur1 = inventory[pos1]
	var cur2 = inventory[pos2]
	
	inventory[pos1] = cur2
	inventory[pos2] = cur1
	world.reloadInventory()

func _ready():
	self.set_collision_mask_bit(5, false)
	self.set_collision_layer_bit(5, false)
	self.set_collision_mask_bit(4, false)
	self.set_collision_mask_bit(3, true)
	self.set_collision_mask_bit(2, true)
	for i in 40:
		inventory.push_back("")
	animationTree.active = true
	swordHitbox.knockback_vector = roll_vector
	
	
func getInventory():
	var out = []
	for i in inventory:
		var curVal = i
		if typeof(curVal) != TYPE_STRING:
			var instant = item.instance()
			instant = curVal
			out.push_back(instant)
		else:
			out.push_back(i)
	
	return out

func getDamage():
	return damage

func _physics_process(delta):
	match state:
		MOVE:
			move_state(delta)
		
		ROLL:
			roll_state(delta)
			
		ATTACK:
			attack_state(delta)
	
	## Do hit timer
	handleHits()
	
	#Handle Death
	if health == 0:
		print("Game Over")
		get_tree().quit()


func move_state(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized() #Makes it move at the right speed diagonally
	
	
	if input_vector != Vector2.ZERO:
		roll_vector = input_vector
		swordHitbox.knockback_vector = input_vector
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Run/blend_position", input_vector)
		animationTree.set("parameters/Attack/blend_position", input_vector)
		animationTree.set("parameters/Roll/blend_position", input_vector)
		animationState.travel("Run")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	move()
	
	if Input.is_action_just_pressed("AttackDown"):
		input_vector.x = 0
		input_vector.y = 1
		input_vector = input_vector.normalized()
		animationTree.set("parameters/Attack/blend_position", input_vector)
		state = ATTACK
	elif Input.is_action_just_pressed("AttackUp"):
		input_vector.x = 0
		input_vector.y = -1
		input_vector = input_vector.normalized()
		animationTree.set("parameters/Attack/blend_position", input_vector)
		state = ATTACK
	elif Input.is_action_just_pressed("AttackRight"):
		input_vector.x = 1
		input_vector.y = 0
		input_vector = input_vector.normalized()
		animationTree.set("parameters/Attack/blend_position", input_vector)
		state = ATTACK
	elif Input.is_action_just_pressed("AttackLeft"):
		input_vector.x = -1
		input_vector.y = 0
		input_vector = input_vector.normalized()
		animationTree.set("parameters/Attack/blend_position", input_vector)
		state = ATTACK
	
	if Input.is_action_just_pressed("roll"):
		state = ROLL
	
func roll_state(delta):
	self.set_collision_mask_bit(5, true)
	self.set_collision_layer_bit(5, true)
	self.set_collision_mask_bit(4, false)
	self.set_collision_mask_bit(3, false)
	self.set_collision_mask_bit(2, false)
	velocity = roll_vector * ROLL_SPEED
	animationState.travel("Roll")
	move()
	
	
func attack_state(delta):
	velocity = velocity.move_toward(Vector2.ZERO, FRICTION/2 * delta)
	velocity = move_and_slide(velocity)
	animationState.travel("Attack")
	#move()
	
func move():
	velocity = move_and_slide(velocity)
	
func roll_animation_finished():
	velocity = velocity * 0.8
	state = MOVE
	self.set_collision_mask_bit(5, false)
	self.set_collision_layer_bit(5, false)
	self.set_collision_mask_bit(4, true)
	self.set_collision_mask_bit(3, true)
	self.set_collision_mask_bit(2, true)
	
func attack_animation_finished():
	state = MOVE


func _on_Area2D_body_entered(body):
	if body.is_in_group("Enemy"):
		#hitTimer = immunity
		enemies += 1
		#print("Damage: ", body.damage)

		#print("Ouchie")
	else:
		pass
		#print("In grass or tree or some shit IDK")
	pass # Replace with function body.


func _on_Area2D_body_exited(body):
	if body.is_in_group("Enemy"):
		enemies -= 1
	pass # Replace with function body.
