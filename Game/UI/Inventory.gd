extends CanvasLayer

var cell = preload("res://UI/InventoryCell.tscn")
onready var player = get_node("/root/World/YFirst/Player")
onready var world  = get_node("/root/World")

var allCells = []

var pauseTimer = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func updateClocks():
	if pauseTimer < 0:
		pauseTimer = 0
	elif pauseTimer > 0:
		pauseTimer -= 1

	
func _process(delta):
	updateClocks()
	if Input.is_action_pressed("MouseClick") and !player.mouseClicked:
		#print("Clicked!")
		player.mouseClicked = true
		#player.clickedCursor = player.curCursor
		player.updateClickCursor(player.curCursor)
		#print(player.curCursor)
		#print(player.clickedCursor)
		
		#print(player.curCursor)
	if Input.is_action_just_released("MouseClick"):
		#print("Released!")
		#print("MouseReleased")
		if player.clickedCursor != -1 and player.curCursor != -1:
			player.swapInventory(player.clickedCursor, player.curCursor)
			#var t1 = allCells[player.clickedCursor]
			#var t2 = allCells[player.curCursor]
			
			#t1.index = player.curCursor
			#t2.index = player.clickedCursor
			
			#allCells[player.clickedCursor] = t2
			#allCells[player.curCursor] = t1
		player.clickedCursor = -1
		player.mouseClicked = false
		
	if Input.is_action_just_released("MouseClick"):
		var healthTxt = "Health: " + str(player.health) + "/" + str(player.maxHealth)
		var damageTxt = "Damage: " + str(player.getDamage())
	

	if world.coinPickup:
		var playerMoney = player.money
		var p = 0
		var g = 0
		var s = 0
		var b = 0

		while playerMoney >= 1000000:
			p += 1
			playerMoney -= 1000000
		
		while playerMoney >= 10000:
			g += 1
			playerMoney -= 10000
		
		while playerMoney >= 100:
			s += 1
			playerMoney -= 100
		
		b = playerMoney
		
		#print(b)
			
		var platText = "P: " + str(p)
		var goldText = "G: " + str(g)
		var silvText = "S: " + str(s)
		var bronText = "B: " + str(b)
		
		get_node("HealthText11").text = platText
		get_node("HealthText12").text = goldText
		get_node("HealthText13").text = silvText
		get_node("HealthText14").text = bronText

		world.coinPickup = false
	#print(pauseTimer)
	pass


# Called when the node enters the scene tree for the first time.
func _ready():
	## Set text
	for i in 2:
		for j in 6:
			var cell1 = cell.instance()
			cell1.position.x = 22*i+260
			cell1.position.y = 22*j+24
			cell1.z_index = 11
			cell1.modulate = Color("DDDDDD")
			cell1.index = 40 + i + j*2
			self.add_child(cell1)
	
	var healthTxt = "Health: " + str(player.health) + "/" + str(player.maxHealth)
	var damageTxt = "Damage: " + str(player.getDamage())
	var luckTxt   = "Luck: "   + str(player.luck)
	var speedTxt  = "Speed: "  + str(player.ACCELERATION/100)
	
	get_node("HealthText").text = healthTxt
	get_node("HealthText2").text = damageTxt
	get_node("HealthText3").text = luckTxt
	get_node("HealthText4").text = speedTxt
	
	var playerMoney = player.money
	var p = 0
	var g = 0
	var s = 0
	var b = 0

	while playerMoney >= 1000000:
		p += 1
		playerMoney -= 1000000
	
	while playerMoney >= 10000:
		g += 1
		playerMoney -= 10000
	
	while playerMoney >= 100:
		s += 1
		playerMoney -= 100
	
	b = playerMoney
	
	var platText = "P: " + str(p)
	var goldText = "G: " + str(g)
	var silvText = "S: " + str(s)
	var bronText = "B: " + str(b)
	
	get_node("HealthText11").text = platText
	$HealthText11.modulate = Color("FFFFFF")
	get_node("HealthText12").text = goldText
	$HealthText12.modulate = Color("FFFF00")
	get_node("HealthText13").text = silvText
	$HealthText13.modulate = Color("BEC2CB")
	get_node("HealthText14").text = bronText
	$HealthText14.modulate = Color("CD7F32")
	
	for i in 10:
		for j in 4:
			var cell1 = cell.instance()
			cell1.position.x = 22*i+20
			cell1.position.y = 68+j*22
			cell1.z_index = 11
			cell1.modulate = Color("DDDDDD")
			cell1.index = i + j*10
			#allCells.push_back(cell1)
			#print(cell1.index)
			self.add_child(cell1)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
