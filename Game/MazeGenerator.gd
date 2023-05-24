extends Node2D

var mazeSize : int = 10
var maze = []
var rng = RandomNumberGenerator.new()
# Size of minimap
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func getValidMovesHelper(moves, tile):
	var out = true
	var surrounding = []
	if moves.has(tile+mazeSize):
		surrounding.push_front(1)
	if moves.has(tile-mazeSize):
		surrounding.push_front(1)
	if moves.has(tile-1):
		surrounding.push_front(1)
	if moves.has(tile+1):
		surrounding.push_front(1)
		
	if(surrounding.size() > 1):
		out = false
	return out

func getValidMoves(moves, tile, walls):
	var out = [];
	if(!moves.has(tile-1)):
		if(!walls.has(tile-1)):
			if(getValidMovesHelper(moves, tile-1)):
				out.push_front(tile-1)
	if(!moves.has(tile+1)):
		if(!walls.has(tile+1)):
			if(getValidMovesHelper(moves, tile+1)):
				out.push_front(tile+1)
	if(!moves.has(tile+mazeSize)):
		if(!walls.has(tile+mazeSize)):
			if(getValidMovesHelper(moves, tile+mazeSize)):
				out.push_front(tile+mazeSize)
	if(!moves.has(tile-mazeSize)):
		if(!walls.has(tile-mazeSize)):
			if(getValidMovesHelper(moves, tile-mazeSize)):
				out.push_front(tile-mazeSize)
	
	return out
	
func genMazeHelper(moves, walls):
	var stacks = []
	for i in moves.size():
		stacks.push_back(moves[i])
	var curTile = 0
	var allMoves = []
	var randNum = 0
	var sizeStack = stacks.size()
	var rng = RandomNumberGenerator.new()
	while(stacks.size() > 0):
		sizeStack = stacks.size()
		curTile = stacks[sizeStack-1]
		#print("Stack Size: ", sizeStack)
		allMoves = getValidMoves(moves, curTile, walls)
		if(allMoves.size() == 0):
			stacks.pop_back()
		else:
			rng.randomize()
			randNum = rng.randi_range(0, allMoves.size()-1)
			moves.push_back(allMoves[randNum])
			stacks.push_back(allMoves[randNum])
		
	
	return moves

func shuffleList(toShuffle):
	var shuffled = []
	var indexList = range(toShuffle.size())
	for i in range(toShuffle.size()):
		randomize()
		var x = randi()%indexList.size()
		shuffled.append(toShuffle[x])
		indexList.remove(x)
		toShuffle.remove(x)
	return shuffled

func genMaze():
	var total = mazeSize*mazeSize
	# Setup maze
	var out = []
	for i in mazeSize*mazeSize:
		out.push_front(1)
		
	#Setup walls
	var walls = []
	for i in mazeSize:
		walls.push_front(i)
		#walls.push_front(i+379)
		walls.push_front(i+total-mazeSize-1)
		walls.push_front(i*mazeSize)
		walls.push_front(i*mazeSize-1)
		
	var moves = []
	##Middle
	moves.push_front(mazeSize*mazeSize/2 + mazeSize/2)
	moves.push_front(mazeSize*mazeSize/2 + mazeSize/2 + 1)
	moves.push_front(mazeSize*mazeSize/2 + mazeSize/2 - 1)
	moves.push_front(mazeSize*mazeSize/2 + mazeSize/2 + mazeSize)
	moves.push_front(mazeSize*mazeSize/2 + mazeSize/2 - mazeSize)
	#adding extra length to entrance of maze
	var randCoinFlip = rng.randi_range(0, 1)
	if(randCoinFlip == 1):
		moves.push_front(mazeSize*mazeSize/2 + mazeSize/2 + 2)
	randCoinFlip = rng.randi_range(0, 1)
	if(randCoinFlip == 1):
		moves.push_front(mazeSize*mazeSize/2 + mazeSize/2 - 2)
		randCoinFlip = rng.randi_range(0, 1)
	if(randCoinFlip == 1):
		moves.push_front(mazeSize*mazeSize/2 + mazeSize/2 + 2*mazeSize)
	randCoinFlip = rng.randi_range(0, 1)
	if(randCoinFlip == 1):
		moves.push_front(mazeSize*mazeSize/2 + mazeSize/2 - 2*mazeSize)
	
	print(moves)
	moves = shuffleList(moves)
	print(moves)
	
	moves = genMazeHelper(moves, walls)

	# Entrance
	#moves.push_front(11)
	
	var validExits = []
	for i in mazeSize:
		var curVal = i+total-2*mazeSize
		if moves.has(curVal):
			validExits.push_back(curVal)
		curVal = i+mazeSize
		if moves.has(curVal):
			validExits.push_back(curVal)
			
	
	for i in moves.size():
		var cur2 = moves[i]
		out[cur2] = 0
		
	#Set Entrance
	#out[11] = 2
	#maze = out
	out[mazeSize*mazeSize/2 + mazeSize/2] = 4
	
	maze = out
	var curIndex = 0
	for i in maze:
		#print(curIndex)
		if i != 1 and maze[curIndex] != 3:
			if isDeadEnd(curIndex):
				maze[curIndex] = 2
		curIndex += 1
			
	out = maze
	#Set Exit

	rng.randomize()
	var randNum = rng.randi_range(0, validExits.size()-1)
	if(validExits[randNum] > mazeSize*3):
		out[validExits[randNum]+mazeSize] = 3
	else:
		out[validExits[randNum]-mazeSize] = 3
			
	return out

func isDeadEnd(tile):
	
	var out = false
	var up = tile - 1
	var down = tile + 1
	var left = tile - mazeSize
	var right = tile + mazeSize
	
	var surrounding = 0
	if maze[up] == 1:
		surrounding += 1
	if maze[down] == 1:
		surrounding += 1
	if maze[left] == 1:
		surrounding += 1
	if maze[right] == 1:
		surrounding += 1
		
	if surrounding == 3:
		out = true
		
	return out


func printMaze():
	#print("here-1")
	maze = genMaze()
	#print("here0")
	#print(maze)
	#print("here")
	#drawMaze(maze)
	var curString = ""
	for i in mazeSize:
		curString = ""
		for j in mazeSize:
			curString = str(curString, maze[i*mazeSize + j])
		#print(curString)

func _ready():
	maze = genMaze()
	#drawMaze(maze)
	var curString = ""
	#for i in mazeSize:
	#	curString = ""
	#	for j in mazeSize:
	#		curString = str(curString, maze[i*mazeSize + j])
	#	print(curString)

	#drawMini()



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
