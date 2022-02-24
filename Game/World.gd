extends Node2D

#Preset Values
var tileSize : int = 16
var chunkX : int   = 20
var chunkY : int   = 12
#var HUD    : bool  = true

var pauseGame     : bool = false
var unpause       : bool = false
var inventoryOpen : bool = false
#Load in necessary tiles
onready var player = get_node("/root/World/YFirst/Player")
onready var paths  = get_node("/root/World/DirtPathTileMap")
onready var cliffs = get_node("/root/World/DirtCliffTileMap")
onready var water  = get_node("/root/World/WaterTileSet")
onready var bridge = get_node("/root/World/BridgeTilemap")
var maze     = preload("res://MazeGenerator.gd")
var batEnemy = preload("res://Enemies/Bat.tscn")
var spider   = preload("res://Enemies/Spider.tscn")
var grass    = preload("res://World/Grass.tscn")
var rock     = preload("res://World/Rock.tscn")
var bush     = preload("res://World/Bush.tscn")
var heartF   = preload("res://UI/FullHeart.tscn")
var heartH   = preload("res://UI/HalfHeart.tscn")
var invent   = preload("res://UI/Inventory.tscn")
var item     = preload("res://WorldItems/WorldItem.tscn")
var coin     = preload("res://WorldItems/Coin.tscn")


var current = []


#Clocks
var pauseTimer = 0

func updateClocks():
	#Pause clock
	if pauseTimer < 0:
		pauseTimer = 0
	elif pauseTimer > 0:
		#print(pauseTimer)
		pauseTimer -= 1


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
# here, x, y aren't actual segments, they are chunks, x20*y12
func spawnLoot(x, y):
	var areWeSpawning = RandomNumberGenerator.new()
	areWeSpawning.randomize()
	var spawn = areWeSpawning.randi_range(0, 10)
	if spawn == 0:
		var wort = item.instance()
		wort.position.x = x
		wort.position.y = y
		var rng = RandomNumberGenerator.new()
		rng.randomize()
		var int1 = rng.randi_range(0, 1)
		var itemType = ""
		var colour = ""
		if int1 == 0:
			
			itemType = "sword"
		else:
			itemType = "bow"
		
		var int2 = rng.randi_range(0, 6)
		colour = wort.rarSwitch(int2)
		var stats = str(itemType, ".", colour)
		var statsString = itemType + ".red.primary.some " + itemType + ".1.N/A"
		wort.stats = statsString
		self.add_child(wort)
	elif spawn < 4:
		var curCoin = coin.instance()
		curCoin.position.x = x
		curCoin.position.y = y
		self.add_child(curCoin)
	elif spawn < 5:
		var curCoin = coin.instance()
		curCoin.value = "silver"
		curCoin.position.x = x
		curCoin.position.y = y
		self.add_child(curCoin)
		#print("SPAWNING LOOT")
	
	

	
var inventory = invent.instance()

func reloadInventory():
	inventory.queue_free()
	inventory = invent.instance()
	self.add_child(inventory)

func open_inventory():
	#pauseTimer = 100
	pauseGame = true
	inventory.pauseTimer = 20
	inventoryOpen = true
	#inventory.PAUSE_MODE_PROCESS
	self.add_child(inventory)
	
	#self.add_child(inventory)
	#inventory.show()
	#for i in 100000:
	#	print(i)
	#get_tree().paused = true
	#get_tree().paused = false
		


func _process(delta):
	if inventoryOpen and Input.is_action_pressed("OpenInventory") and pauseTimer == 0: 
		pauseTimer = 20
		inventoryOpen = false
		pauseGame = false
		inventory.queue_free()
		inventory = invent.instance()
		#unpause = true
		#get_tree().paused = true
		#inventory = invent.instance()
		#player.inventory = player.backUpInv
		#inventory.doInventory()
	elif Input.is_action_pressed("OpenInventory") and !pauseGame and pauseTimer == 0:
		pauseTimer = 20

		#print(player.inventory)
		#print("here")
		open_inventory()
	
	
	
	updateClocks()
		

func drawWall(x, y):
	for i in 10:
		for j in 6:
			cliffs.set_cell(x*chunkX/2+i, y*chunkY/2+j, 0)
			
		cliffs.update_bitmask_region(Vector2(x*chunkX/2-1, y*chunkY/2-1), Vector2(x*chunkX/2+chunkX/2, y*chunkY/2+chunkY/2))

func drawDeadEnd(x, y):
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var int1 = rng.randi_range(0, 1)
	var rng2 = RandomNumberGenerator.new()
	rng2.randomize()
	var int2 = rng2.randi_range(0, 2)
	if(int2 == 0):
		for i in 4:
			for j in 4:
				var curGrass = grass.instance()
				curGrass.position.x = x*chunkX*tileSize+(8+i)*tileSize
				curGrass.position.y = y*chunkY*tileSize+(4+j)*tileSize
				get_tree().get_root().get_node("/root/World/YFirst/YGrass").add_child(curGrass)
				
		for i in 2:
			for j in 2:
				var curBat = batEnemy.instance()
				curBat.position.x = x*chunkX*tileSize+(2+i*16)*tileSize
				curBat.position.y = y*chunkY*tileSize+(2+j*8)*tileSize
				self.add_child(curBat)
	elif(int2 == 1):
		for i in 2:
			for j in 2:
				var curBat = batEnemy.instance()
				curBat.position.x = x*chunkX*tileSize+(9+i)*tileSize
				curBat.position.y = y*chunkY*tileSize+(5+j)*tileSize
				self.add_child(curBat)
				
		for i in 6:
			for j in 4:
				paths.set_cell(x*chunkX+i+7, y*chunkY+j+4, 0)
		paths.update_bitmask_region(Vector2(x*chunkX-1, y*chunkY-1), Vector2(x*chunkX+chunkX, y*chunkY+chunkY))
			
	elif(int2 == 2):
		for i in 20:
			for j in 12:
				rng2 = RandomNumberGenerator.new()
				rng2.randomize()
				var int3 = rng2.randi_range(0, 10)
				#print(int3)
				if int3 < 8:
					paths.set_cell(x*chunkX+i, y*chunkY+j, 0)
					rng2.randomize()
					var spawnSpider = rng2.randi_range(0, 200)
					if spawnSpider > 198:
						var curSpider = spider.instance()
						curSpider.position.x = x*chunkX*tileSize + i*tileSize+8
						curSpider.position.y = y*chunkY*tileSize + j*tileSize+8
						self.add_child(curSpider)
				elif int3 < 9:
					var curRock = rock.instance()
					curRock.position.x = x*chunkX*tileSize+i*tileSize+8
					curRock.position.y = y*chunkY*tileSize+j*tileSize+8
					get_tree().get_root().get_node("/root/World/YFirst/YRock").add_child(curRock)
				
		paths.update_bitmask_region(Vector2(x*chunkX-1, y*chunkY-1), Vector2(x*chunkX+chunkX, y*chunkY+chunkY))	

func drawURChunk(x, y):
	pass
	
func drawULChunk(x, y):
	pass
	
func drawDRChunk(x, y):
	pass
	
func drawDLChunk(x, y):
	pass
	
func drawLRChunk(x, y):
	pass
	
func drawUDChunk(x, y):
	pass

func drawChunk0(x, y):
	##Add the paths
	for i in 20:
		for j in 2:
			paths.set_cell(x*chunkX+i, y*chunkY+j+5, 0)
			
	for i in 12:
		for j in 2:
			paths.set_cell(x*chunkX+j+9, y*chunkY+i, 0)
	
	
	##Add a bat
	var curBat = batEnemy.instance()
	curBat.position.x = x*chunkX*tileSize+10*tileSize
	curBat.position.y = y*chunkY*tileSize+6*tileSize
	self.add_child(curBat)
	
	##Add a cliff
	for i in 3:
		for j in 2:
			cliffs.set_cell(x*chunkX/2+i, y*chunkY/2+j, 0)
	
	##Add a tree
	var curTree = bush.instance()
	curTree.position.x = x*chunkX*tileSize+15*tileSize
	curTree.position.y = y*chunkY*tileSize+9*tileSize
	get_tree().get_root().get_node("/root/World/YFirst/YBush").add_child(curTree)
	
	
	##add grass
	for i in 2:
		for j in 2:
			var curGrass = grass.instance()
			curGrass.position.x = x*chunkX*tileSize+(3+i)*tileSize
			curGrass.position.y = y*chunkY*tileSize+(9+j)*tileSize
			get_tree().get_root().get_node("/root/World/YFirst/YGrass").add_child(curGrass)
	
	paths.update_bitmask_region(Vector2(x*chunkX-1, y*chunkY-1), Vector2(x*chunkX+chunkX, y*chunkY+chunkY))
	cliffs.update_bitmask_region(Vector2(x*chunkX/2-1, y*chunkY/2-1), Vector2(x*chunkX/2+chunkX/2, y*chunkY/2+chunkY/2))


func getSurrounding(tileNo, MazeSize):
	var out = ""
	var left   = current[tileNo-MazeSize]
	var right  = current[tileNo+MazeSize]
	var up     = current[tileNo-1]
	var down   = current[tileNo+1]
	if up != 1:
		out = str(out, "u")
	if down != 1:
		out = str(out, "d")
	if left != 1:
		out = str(out, "l")
	if right !=1:
		out = str(out, "r")

	#print(out)
	
	return out

func drawChunk(x, y, tileNo, MazeSize):
	var surrounding = []
	surrounding = getSurrounding(tileNo, MazeSize)
	
	
	var randomChunk = RandomNumberGenerator.new()
	randomChunk.randomize()
	var whichChunk = randomChunk.randi_range(0, 3)
	
	
	if "u" in surrounding and  whichChunk != 3:
		for i in 2:
			for j in 6:
				var path = RandomNumberGenerator.new()
				path.randomize()
				var pathVar = path.randi_range(0, 10)
				if pathVar < 9:
					paths.set_cell(x*chunkX+9+i, y*chunkY+j, 0)
				if pathVar == 9:
					var curGrass = grass.instance()
					curGrass.position.x = x*chunkX*tileSize+(9+i)*tileSize
					curGrass.position.y = y*chunkY*tileSize+(j)*tileSize
					get_tree().get_root().get_node("/root/World/YFirst/YGrass").add_child(curGrass)
	if "d" in surrounding and  whichChunk != 3:
		for i in 2:
			for j in 6:
				var path = RandomNumberGenerator.new()
				path.randomize()
				var pathVar = path.randi_range(0, 10)
				if pathVar < 9:
					paths.set_cell(x*chunkX+9+i, y*chunkY+j+6, 0)
				if pathVar == 9:
					var curGrass = grass.instance()
					curGrass.position.x = x*chunkX*tileSize+(9+i)*tileSize
					curGrass.position.y = y*chunkY*tileSize+(6+j)*tileSize
					get_tree().get_root().get_node("/root/World/YFirst/YGrass").add_child(curGrass)
	if "l" in surrounding and whichChunk != 3:
		for i in 10:
			for j in 2:
				var path = RandomNumberGenerator.new()
				path.randomize()
				var pathVar = path.randi_range(0, 10)
				if pathVar < 9:
					paths.set_cell(x*chunkX+i, y*chunkY+j+5, 0)
				if pathVar == 9:
					var curGrass = grass.instance()
					curGrass.position.x = x*chunkX*tileSize+(i)*tileSize
					curGrass.position.y = y*chunkY*tileSize+(5+j)*tileSize
					get_tree().get_root().get_node("/root/World/YFirst/YGrass").add_child(curGrass)
	if "r" in surrounding and whichChunk != 3:
		for i in 10:
			for j in 2:
				var path = RandomNumberGenerator.new()
				path.randomize()
				var pathVar = path.randi_range(0, 10)
				if pathVar < 9:
					paths.set_cell(x*chunkX+9+i, y*chunkY+5+j, 0)
				if pathVar == 9:
					var curGrass = grass.instance()
					curGrass.position.x = x*chunkX*tileSize+(9+i)*tileSize
					curGrass.position.y = y*chunkY*tileSize+(5+j)*tileSize
					get_tree().get_root().get_node("/root/World/YFirst/YGrass").add_child(curGrass)
	
	## Grassy = 0
	if whichChunk == 0:
		for i in 20:
			for j in 12:
				if $DirtPathTileMap.get_cell(x*chunkX+i, y*chunkY+j) == $DirtPathTileMap.INVALID_CELL:
					var grassRNG = RandomNumberGenerator.new()
					grassRNG.randomize()
					var grassVar = grassRNG.randi_range(0, 10)
					if grassVar < 7:
						var curGrass = grass.instance()
						curGrass.position.x = x*chunkX*tileSize+i*tileSize
						curGrass.position.y = y*chunkY*tileSize+j*tileSize
						get_tree().get_root().get_node("/root/World/YFirst/YGrass").add_child(curGrass)

	## Mid = 1
	elif whichChunk == 1:
		for i in 20:
			for j in 12:
				if $DirtPathTileMap.get_cell(x*chunkX+i, y*chunkY+j) == $DirtPathTileMap.INVALID_CELL:
					var grassRNG = RandomNumberGenerator.new()
					grassRNG.randomize()
					var grassVar = grassRNG.randi_range(0, 10)
					if grassVar < 5:
						var curGrass = grass.instance()
						curGrass.position.x = x*chunkX*tileSize+i*tileSize
						curGrass.position.y = y*chunkY*tileSize+j*tileSize
						get_tree().get_root().get_node("/root/World/YFirst/YGrass").add_child(curGrass)
					elif grassVar < 7:
						var curTree = bush.instance()
						curTree.position.x = x*chunkX*tileSize+i*tileSize
						curTree.position.y = y*chunkY*tileSize+j*tileSize
						get_tree().get_root().get_node("/root/World/YFirst/YBush").add_child(curTree)
	## Forest = 2
	elif whichChunk == 2:
		for i in 20:
			for j in 12:
				if $DirtPathTileMap.get_cell(x*chunkX+i, y*chunkY+j) == $DirtPathTileMap.INVALID_CELL:
					var grassRNG = RandomNumberGenerator.new()
					grassRNG.randomize()
					var grassVar = grassRNG.randi_range(0, 10)
					if grassVar < 3:
						var curTree = bush.instance()
						curTree.position.x = x*chunkX*tileSize+i*tileSize
						curTree.position.y = y*chunkY*tileSize+j*tileSize
						get_tree().get_root().get_node("/root/World/YFirst/YBush").add_child(curTree)
	# Water					
	elif whichChunk == 3:
		for i in 20:
			for j in 12:
				if (i == 9 or i == 10) or (j == 5 or j == 6):
					#bridge.set_cell(x*chunkX+i, y*chunkY+j, 0)
					bridge.set_cell(x*chunkX+i, y*chunkY+j, 0)
				else:
					water.set_cell(x*chunkX+i, y*chunkY+j, 0)
				
	bridge.update_bitmask_region(Vector2(x*chunkX-1, y*chunkY-1), Vector2(x*chunkX+chunkX, y*chunkY+chunkY))
	water.update_bitmask_region(Vector2(x*chunkX-1, y*chunkY-1), Vector2(x*chunkX+chunkX, y*chunkY+chunkY))
	paths.update_bitmask_region(Vector2(x*chunkX-1, y*chunkY-1), Vector2(x*chunkX+chunkX, y*chunkY+chunkY))
	cliffs.update_bitmask_region(Vector2(x*chunkX/2-1, y*chunkY/2-1), Vector2(x*chunkX/2+chunkX/2, y*chunkY/2+chunkY/2))

	


# Called when the node enters the scene tree for the first time.
func _ready():
	#print("here!")
	var curMaze = maze.new()
	curMaze.printMaze()
	var mazeSize = curMaze.mazeSize
	current = curMaze.maze
	
	var curIndex = 0
	for i in mazeSize:
		for j in mazeSize:
			var curTile = current[curIndex]
			if(curTile == 1):
				drawWall(i-5, j-5)
			elif(curTile == 0):
				drawChunk(i-5, j-5, curIndex, mazeSize)
			elif(curTile == 2):
				drawDeadEnd(i-5, j-5)
			curIndex = curIndex + 1
			
	## Draw chunks
	#for i in 5:
	#	for j in 5:
	#		if i != 2 or j != 2:
	#			drawChunk(i-2, j-2)
			#cliffs.set_cell(10+i, 10+j, 0)
			
	#Add health
	for i in player.health/2:
		var curFull = heartF.instance()
		var curHalf = heartH.instance()
		curFull.index = i
		curHalf.index = i
		self.add_child(curHalf)
		self.add_child(curFull)
		



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
