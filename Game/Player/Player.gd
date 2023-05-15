extends KinematicBody2D

const PlayerHurtSound = preload("res://Player/PlayerHurtSound.tscn")

var item  = preload("res://items/Item.tscn")
var arrow = preload("res://Effects/Arrow.tscn") 

onready var world  = get_node("/root/World/")

const secondScript1 = preload("res://Player/Secondary.gd")
var secondScript = secondScript1.new()
const shooter = preload("res://Player/Shoot.gd")
var shoots = shooter.new()
#Global Variables
var intMax = 9223372036854775806
var intMin = -9223372036854775807
#Player Declarations
export var ACCELERATION = 500
export var MAX_SPEED    = 80
export var ROLL_SPEED   = 120
export var FRICTION     = 500
var hitTimer : float    = 0
var health              = 10
var maxHealth           = 10
var enemies             = 0
var immunity : float    = 60
var damage              = 2
var luck                = 0
var resistance          = 0
var shotSpeed           = 5
var shotcounter         = 0
var xp                  = 0
var nextLevel           = 10
var levelupTimer        = 0
var secondaryTimer      = 0
var xpFlag              = false

#Handle Iventory
var inventory = []
var curCursor = -1
var clickedCursor = -1
var mouseClicked = false
var updateFrame = false

#Handle Minimap
var visitedCells = []
var clock        = 0
var curCell      = Vector2()

#GIMME DAT SHMONEY $$$
var money = 0

#Variable So we don't have to worry about pressing every time we want to attack
var attackButtonDown = false
var pressedAttacks = []
var effect = "none"

enum {
	MOVE,
	ROLL,
	ATTACK,
	BOWATTACK,
	BOWMOVE,
	ATTACKMOVE
}

var state = MOVE
var velocity = Vector2.ZERO
var roll_vector = Vector2.DOWN

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")
onready var swordHitbox = $HitboxPivot/SwordHitbox

func updateVistedCells():
	var pos : Vector2 = Vector2()
	pos.x = floor(((self.position.x)/16)/20)
	pos.y = floor(((self.position.y)/16)/12)
	curCell = pos
	if !visitedCells.has(pos):
		#print("UPDATING POS: ", curCell)
		visitedCells.push_back(pos)
	
	#print(visitedCells)

func getCurrentEquippedWeapon():
	var curWeapon = inventory[50]
	#print(curWeapon)
	var splitList = curWeapon.split(".")

	var curType = splitList[6]
	return curType
	

func addXP(value):
	xp = xp + value
	if xp > nextLevel:
		xp = xp - nextLevel
		nextLevel = nextLevel*1.5
		levelupTimer = 60

func addHealth(h):
	var tmp = health + h
	if tmp > maxHealth:
		health = maxHealth
	else:
		health = tmp

func getDamage():
	var out = 0
	var cur = inventory[50].split(".")
	#print(cur)
	var wepDam = int(cur[4])
	#print(wepDam)
	out = damage + wepDam
	#print(str(out))
	return out

func updateClickCursor(val):
	while clickedCursor != val:
		clickedCursor = val

func updateCursor(val):
	while(curCursor!=val):
		curCursor = val

func doDamage(dam):
	var arm = getArmour()
	dam = dam - arm
	if dam < 1:
		dam = 1
	if hitTimer == 0:
		health = health - dam
		hitTimer = immunity
		var playerHurtSound = PlayerHurtSound.instance()
		get_tree().current_scene.add_child(playerHurtSound)

func handleHits():
	if hitTimer < 0:
		hitTimer = 0
	else:
		self.modulate = Color(1.0, (immunity-hitTimer)/immunity , (immunity-hitTimer)/immunity, 1.0)
		if enemies > 0 and hitTimer == 0 and state!=ROLL:
			var curColour = self.modulate
			doDamage(1)
		hitTimer = hitTimer - 1

func isStackableItem(item):
	var out = false
	var all = item.split(".")
	var itemType = all[2]
	if itemType == "crafting":
		var maxSize = int(all[5])
		if maxSize > 1:
			out = true
	
	return out
		
func getArmour():
	var head = inventory[40]
	var chest = inventory[44]
	var pants = inventory[46]
	var boots = inventory[48]
	
	var headVal  = 0
	var chestVal = 0
	var pantsVal = 0
	var bootsVal = 0
	
	var headSplit  = head.split(".")
	if headSplit.size() > 4:
		headVal    = int(headSplit[4])
	var chestSplit = chest.split(".")
	if chestSplit.size() > 4:
		chestVal   = int(chestSplit[4])
	var pantsSplit = pants.split(".")
	if pantsSplit.size() > 4:
		pantsVal   = int(pantsSplit[4])
	var bootsSplit = boots.split(".")
	if bootsSplit.size() > 4:
		bootsVal   = int(bootsSplit[4])
	
	var out = headVal + chestVal + pantsVal + bootsVal
	
	return out

func insertInventory(item):
	var out = false
	var counter = 0
	var itemStackAble = isStackableItem(item)
	for i in inventory:
		if i == "" and !out and counter < 40:
			inventory[counter] = item
			out = true
		elif counter < 40 and !out and itemStackAble:
			var itemAll = item.split(".")
			var itemType = itemAll[0]
			var curItem = inventory[counter]
			var curItemList = curItem.split(".")
			var curBelow  = curItemList[0]
			var curAmount = int(curItemList[4])
			var curMax    = int(curItemList[5])
			if curAmount < curMax and curBelow == itemType:
				curItemList[4] = str(curAmount+1)
				var setString = ""
				for j in curItemList:
					setString = setString + j
					setString = setString + "."
				setString.erase(setString.length() - 1, 1)
				inventory[counter] = setString
				#print(setString)
				out = true
		counter += 1
	return out

func getItemType(itemToType):
	var all = itemToType.split(".")
	var curItem = "empty"
	if all.size() > 1:
		curItem = all[2]
	return curItem	

func setEffect():
	var curWep = inventory[50]
	var all = curWep.split(".")
	var curEffect = all[5]
	if curEffect == "F":
		effect = "fire"
	else:
		effect = "none"

func swapInventory(pos1, pos2):
	var equipped = false
	if pos1 == 40 or pos2 == 40:
		equipped = true
		var curType = ""
		if pos1 != 40:
			curType = getItemType(inventory[pos1])
		else:
			curType = getItemType(inventory[pos2])
		if curType == "head":
			var cur1 = inventory[pos1]
			var cur2 = inventory[pos2]
	
			inventory[pos1] = cur2
			inventory[pos2] = cur1
	elif pos1 == 42 or pos2 == 42:
		equipped = true
		var curType = ""
		if pos1 != 42:
			curType = getItemType(inventory[pos1])
		else:
			curType = getItemType(inventory[pos2])
		if curType == "cape":
			var cur1 = inventory[pos1]
			var cur2 = inventory[pos2]
	
			inventory[pos1] = cur2
			inventory[pos2] = cur1	
		
	elif pos1 == 44 or pos2 == 44:
		equipped = true
		var curType = ""
		if pos1 != 44:
			curType = getItemType(inventory[pos1])
		else:
			curType = getItemType(inventory[pos2])
		if curType == "chest":
			var cur1 = inventory[pos1]
			var cur2 = inventory[pos2]
	
			inventory[pos1] = cur2
			inventory[pos2] = cur1
	elif pos1 == 46 or pos2 == 46:
		equipped = true
		var curType = ""
		if pos1 != 46:
			curType = getItemType(inventory[pos1])
		else:
			curType = getItemType(inventory[pos2])
		if curType == "pants":
			var cur1 = inventory[pos1]
			var cur2 = inventory[pos2]
	
			inventory[pos1] = cur2
			inventory[pos2] = cur1	
	elif pos1 == 48 or pos2 == 48:
		equipped = true
		var curType = ""
		if pos1 != 48:
			curType = getItemType(inventory[pos1])
		else:
			curType = getItemType(inventory[pos2])
		if curType == "boots":
			var cur1 = inventory[pos1]
			var cur2 = inventory[pos2]
	
			inventory[pos1] = cur2
			inventory[pos2] = cur1
	elif pos1 == 50 or pos2 == 50:
		equipped = true
		var curType = ""
		if pos1 != 50:
			curType = getItemType(inventory[pos1])
		else:
			curType = getItemType(inventory[pos2])
		if curType == "primary":
			var cur1 = inventory[pos1]
			var cur2 = inventory[pos2]
	
			inventory[pos1] = cur2
			inventory[pos2] = cur1	
	elif pos1 == 51 or pos2 == 51:
		equipped = true
		var curType = ""
		if pos1 != 51:
			curType = getItemType(inventory[pos1])
		else:
			curType = getItemType(inventory[pos2])
		if curType == "secondary":
			var cur1 = inventory[pos1]
			var cur2 = inventory[pos2]
	
			inventory[pos1] = cur2
			inventory[pos2] = cur1	
	else:
		var cur1 = inventory[pos1]
		var cur2 = inventory[pos2]
	
		inventory[pos1] = cur2
		inventory[pos2] = cur1
		
	if equipped:
		var colour = inventory[42]
		var all = colour.split(".")
		var curColour = all[7]
		$Cape.modulate = Color(curColour)
		
		setEffect()
		#$Cape.modulate = 
	world.reloadInventory()

func _ready():
	#$Cape.visible = false
	#$Cape.modulate = Color("FFC0CB")
	$Cape.modulate = Color("444444")
	self.set_collision_mask_bit(5, false)
	self.set_collision_layer_bit(5, false)
	self.set_collision_mask_bit(4, false)
	self.set_collision_mask_bit(3, true)
	self.set_collision_mask_bit(2, true)
	for i in 56:
		if i == 0:
			#inventory.push_back("")
			#inventory.push_back("bow.red.primary.Bow.1.N/A.bow.AAAAAA")
			inventory.push_back("Bomb.orange.secondary.Bomb.30.N/A.iron.AAAAAA")
		elif i == 40:
			inventory.push_back("IronHead.orange.head.Iron Head.1.N/A.iron.AAAAAA")
		elif i == 42:
			inventory.push_back("Cape.red.cape.A cape.1.N/A.cloth.4444BB")
			var colour = inventory[42]
			var all = colour.split(".")
			var curColour = all[7]
			$Cape.modulate = Color(curColour)
		elif i == 50:
			inventory.push_back("sword.indigo.primary.Bad Sword.1.N/A.sword.AAAAAA")
		elif i == 44:
			inventory.push_back("IronChest.violet.chest.Iron Chest.1.N/A.iron.AAAAAA")
		elif i == 46:
			inventory.push_back("IronPants.green.pants.Iron Pants.1.N/A.iron.AAAAAA")
		elif i == 48:
			inventory.push_back("IronBoots.blue.boots.Iron Boots.1.N/A.iron.AAAAAA")
		else:
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

func attackSecondary():
	var secondary = inventory[51]
	var splitList = secondary.split(".")
	var timer = int(splitList[4])
	var curItem = splitList[0]
	if secondaryTimer == 0:
		secondaryTimer = timer
		if curItem == "Bomb":
			var xvel = velocity.x/20
			var yvel = velocity.y/20
			secondScript.bomb(self.position.x, self.position.y, xvel, yvel, owner)
		if curItem == "Tragger":
			var xBul : int = 0
			var yBul : int = 0
			if pressedAttacks.has("s"):
				yBul += 1
			if pressedAttacks.has("w"):
				yBul -= 1
			if pressedAttacks.has("a"):
				xBul -= 1
			if pressedAttacks.has("d"):
				xBul += 1
			var input_vector = Vector2.ZERO
			if pressedAttacks.size() == 0:

				input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
				input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
				xBul += input_vector.x
				yBul += input_vector.y
				#yBul += 1
			if xBul == 0 and yBul == 0:
				yBul += 1

			secondScript.tragger(xBul, yBul, self.position.x, self.position.y, owner, input_vector)
		
	pass

func _physics_process(delta):
	
	var xpWidth = int(120.0 * (float(xp)/nextLevel))

	$XPBar.polygon = [Vector2(-60, 70), Vector2(-60+xpWidth, 70), Vector2(-60+xpWidth, 72), Vector2(-60, 72)]

	if levelupTimer > 0:
		levelupTimer -= 1
		if levelupTimer % 10 == 0 and xpFlag:
			xpFlag = false
			$XPBar.color = Color("7dFF33")
		elif levelupTimer % 10 == 0:
			xpFlag = true
			$XPBar.color = Color("FFFFFF")
	
	if secondaryTimer > 0:
		secondaryTimer -= 1

	#$Cape.frame = $Sprite.frame
	if shotcounter > 0:
		shotcounter -= 1
	
	if Input.is_action_just_pressed("AttackDown"):
		if !pressedAttacks.has("s"):
			pressedAttacks.push_back("s")
		attackButtonDown = true
	if Input.is_action_just_pressed("AttackUp"):
		if !pressedAttacks.has("w"):
			pressedAttacks.push_back("w")
		attackButtonDown = true
	if Input.is_action_just_pressed("AttackRight"):
		if !pressedAttacks.has("d"):
			pressedAttacks.push_back("d")
		attackButtonDown = true
	if Input.is_action_just_pressed("AttackLeft"):
		if !pressedAttacks.has("a"):
			pressedAttacks.push_back("a")
		attackButtonDown = true
	
	if Input.is_action_just_pressed("SecondaryPressed"):
		var secondary = inventory[51]
		if secondary.length() > 0:
			attackSecondary()
	
	if Input.is_action_just_released("AttackDown"):
		pressedAttacks.erase("s")
	if Input.is_action_just_released("AttackUp"):
		pressedAttacks.erase("w")
	if Input.is_action_just_released("AttackRight"):
		pressedAttacks.erase("d")
	if Input.is_action_just_released("AttackLeft"):
		pressedAttacks.erase("a")
	match state:
		MOVE:
			move_state(delta)
		
		ROLL:
			roll_state(delta)
			
		ATTACK:
			attack_state(delta)
		BOWATTACK:
			#print("Firing!")
			bow_attack_state(delta)
		ATTACKMOVE:
			attack_move_state(delta)
		BOWMOVE:
			bow_move_state(delta)
	## Do hit timer
	handleHits()
	
	#Handle Clock and update cells visited
	clock += 1
	if clock % 50 == 0:
		updateVistedCells()
		
	if clock == 1000:
		clock = 0
	
	#Handle Death
	if health == 0:
		print("Game Over")
		get_tree().quit()


func bowMove(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized() #Makes it move at the right speed diagonally
	velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)

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
	#input_vector.x = 0
	#input_vector.y = 0
	
	if Input.is_action_just_pressed("AttackDown"):
		if !pressedAttacks.has("s"):
			pressedAttacks.push_back("s")
		attackButtonDown = true
	if Input.is_action_just_pressed("AttackUp"):
		if !pressedAttacks.has("w"):
			pressedAttacks.push_back("w")
		attackButtonDown = true
	if Input.is_action_just_pressed("AttackRight"):
		if !pressedAttacks.has("d"):
			pressedAttacks.push_back("d")
		attackButtonDown = true
	if Input.is_action_just_pressed("AttackLeft"):
		if !pressedAttacks.has("a"):
			pressedAttacks.push_back("a")
		attackButtonDown = true


	#print(pressedAttacks)
	
	if Input.is_action_just_released("AttackDown"):
		pressedAttacks.erase("s")
	if Input.is_action_just_released("AttackUp"):
		pressedAttacks.erase("w")
	if Input.is_action_just_released("AttackRight"):
		pressedAttacks.erase("d")
	if Input.is_action_just_released("AttackLeft"):
		pressedAttacks.erase("a")
	
	#print(pressedAttacks)
	
	if pressedAttacks.size() == 0:
		attackButtonDown = false
	else:
		var vec1 = Vector2(0, 0)
		if pressedAttacks.has("s"):
			vec1.y += 1
		if pressedAttacks.has("w"):
			vec1.y -= 1
		if pressedAttacks.has("d"):
			vec1.x += 1
		if pressedAttacks.has("a"):
			vec1.x -= 1
		vec1 = vec1.normalized()	
		if input_vector != Vector2.ZERO:
			input_vector = Vector2.ZERO
			if pressedAttacks.has("s"):

				#input_vector.x += 0
				#input_vector.y += 1
				input_vector = input_vector.normalized()
				if getCurrentEquippedWeapon() == "bow":
					animationTree.set("parameters/MoveBowAttack/blend_position", vec1)
					state = BOWMOVE
				else:
					animationTree.set("parameters/MoveAttack/blend_position", vec1)
					state = ATTACKMOVE
			elif pressedAttacks.has("w"):
				#input_vector.x += 0
				#input_vector.y += -1
				input_vector = input_vector.normalized()
				if getCurrentEquippedWeapon() == "bow":
					animationTree.set("parameters/MoveBowAttack/blend_position", vec1)
					state = BOWMOVE
				else:
					animationTree.set("parameters/MoveAttack/blend_position", vec1)
					state = ATTACKMOVE
			elif pressedAttacks.has("d"):
				#input_vector.x += 1
				#input_vector.y += 0
				input_vector = input_vector.normalized()
				if getCurrentEquippedWeapon() == "bow":
					animationTree.set("parameters/MoveBowAttack/blend_position", vec1)
					state = BOWMOVE
				else:
					animationTree.set("parameters/MoveAttack/blend_position", vec1)
					state = ATTACKMOVE
			elif pressedAttacks.has("a"):
				#input_vector.x += -1
				#input_vector.y += 0
				input_vector = input_vector.normalized()
				if getCurrentEquippedWeapon() == "bow":
					animationTree.set("parameters/MoveBowAttack/blend_position", vec1)
					state = BOWMOVE
				else:
					animationTree.set("parameters/MoveAttack/blend_position", vec1)
					state = ATTACKMOVE
		else:
			if pressedAttacks.has("s"):

				input_vector.x += 0
				input_vector.y += 1
				input_vector = input_vector.normalized()
				if getCurrentEquippedWeapon() == "bow":
					animationTree.set("parameters/BowAttack/blend_position", vec1)
					state = BOWATTACK
				else:
					animationTree.set("parameters/Attack/blend_position", vec1)
					state = ATTACK
			elif pressedAttacks.has("w"):
				input_vector.x += 0
				input_vector.y += -1
				input_vector = input_vector.normalized()
				if getCurrentEquippedWeapon() == "bow":
					animationTree.set("parameters/BowAttack/blend_position", vec1)
					state = BOWATTACK
				else:
					animationTree.set("parameters/Attack/blend_position", vec1)
					state = ATTACK
			elif pressedAttacks.has("d"):
				input_vector.x += 1
				input_vector.y += 0
				input_vector = input_vector.normalized()
				if getCurrentEquippedWeapon() == "bow":
					animationTree.set("parameters/BowAttack/blend_position", vec1)
					state = BOWATTACK
				else:
					animationTree.set("parameters/Attack/blend_position", vec1)
					state = ATTACK
			elif pressedAttacks.has("a"):
				input_vector.x += -1
				input_vector.y += 0
				input_vector = input_vector.normalized()
				if getCurrentEquippedWeapon() == "bow":
					animationTree.set("parameters/BowAttack/blend_position", vec1)
					state = BOWATTACK
				else:
					animationTree.set("parameters/Attack/blend_position", vec1)
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
	
func bow_attack_state(delta):
	bowMove(delta)
	velocity = move_and_slide(velocity)
	animationState.travel("BowAttack")
	
func bow_move_state(delta):
	bowMove(delta)
	velocity = move_and_slide(velocity)
	animationState.travel("MoveBowAttack")

func attack_state(delta):
	#velocity = velocity.move_toward(Vector2.ZERO, FRICTION/2 * delta)
	bowMove(delta)
	velocity = move_and_slide(velocity)
	animationState.travel("Attack")
	#move()
	
func attack_move_state(delta):
	bowMove(delta)
	velocity = move_and_slide(velocity)
	animationState.travel("MoveAttack")
	
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

func shoot(xBul, yBul, enchant):
	if shotcounter == 0:
		var vel = Vector2.ZERO
		vel.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		vel.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		vel = vel.normalized()
		shoots.shoot(xBul, yBul, self.position.x, self.position.y, enchant, vel, owner, self)


func getCurEnchant():
	var curWep   = inventory[50]
	var wepSplit = curWep.split(".")
	var curEnch  = wepSplit[5] 
	
	return curEnch

func attack_animation_finished():
	if attackButtonDown:
		if getCurrentEquippedWeapon() == "bow":
			var shooting : bool = false
			var xBul : int = 0
			var yBul : int = 0
			var enchant = getCurEnchant()
	
			if pressedAttacks.has("s"):
				shooting = true
				yBul += 1
			if pressedAttacks.has("w"):
				shooting = true
				yBul -= 1
			if pressedAttacks.has("a"):
				shooting = true
				xBul -= 1
			if pressedAttacks.has("d"):
				xBul += 1
				shooting = true
	
			if shooting:
				if enchant == "DS":
					shoot(xBul, yBul, enchant)
				else:
					shoot(xBul, yBul, enchant)

			pass
		else:

			pass
	state = MOVE

func addEnemy():
	enemies += 1
	
func subEnemy():
	enemies -= 1

func _on_Area2D_body_entered(body):
	#print("Entered")
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
