extends Node

onready var world  = get_node("/root/World")
onready var player = get_node("/root/World/YFirst/Player")
onready var paths  = get_node("/root/World/DirtPathTileMap")
onready var cliffs = get_node("/root/World/DirtCliffTileMap")
onready var water  = get_node("/root/World/WaterTileSet")
onready var bridge = get_node("/root/World/BridgeTilemap")

var batEnemy = preload("res://Enemies/Bat.tscn")
var spider   = preload("res://Enemies/Spider.tscn")
var grass    = preload("res://World/Grass.tscn")
var rock     = preload("res://World/Rock.tscn")
var bush     = preload("res://World/Bush.tscn")

var chunkX = 20
var chunkY = 12
var tileSize = 16
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


		#Terrain
		# e = empty
		# c = cliff
		# x = dead tile for cliff
		# p = path
		# b = bridge
		# t = tree
		# w = water
		# g = grass
		# r = rock
		# R = rock on path

#		#                   MM
#		output += "eeeeeeeeeeeeeeeeeeee"
#		output += "eeeeeeeeeeeeeeeeeeee"
#		output += "eeeeeeeeeeeeeeeeeeee"
#		output += "eeeeeeeeeeeeeeeeeeee"
#		output += "eeeeeeeeeeeeeeeeeeee"
#		output += "eeeeeeeeeeeeeeeeeeee"
#		#half               MM
#		output += "eeeeeeeeeeeeeeeeeeee"
#		output += "eeeeeeeeeeeeeeeeeeee"
#		output += "eeeeeeeeeeeeeeeeeeee"
#		output += "eeeeeeeeeeeeeeeeeeee"
#		output += "eeeeeeeeeeeeeeeeeeee"
#		output += "eeeeeeeeeeeeeeeeeeee"

			#Enemies
			# s = spider
			# b = bat
			# t = tree
#		#                   MM
#		output += "eeeeeeeeeeeeeeeeeeee"
#		output += "eeeeeeeeeeeeeeeeeeee"
#		output += "eeeeeeeeeeeeeeeeeeee"
#		output += "eeeeeeeeeeeeeeeeeeee"
#		output += "eeeeeeeeeeeeeeeeeeee"
#		output += "eeeeeeeeeeeeeeeeeeee"
#		#half               MM
#		output += "eeeeeeeeeeeeeeeeeeee"
#		output += "eeeeeeeeeeeeeeeeeeee"
#		output += "eeeeeeeeeeeeeeeeeeee"
#		output += "eeeeeeeeeeeeeeeeeeee"
#		output += "eeeeeeeeeeeeeeeeeeee"
#		output += "eeeeeeeeeeeeeeeeeeee"

func drawURChunk():
	var output = ""
	
	var randomChunk = RandomNumberGenerator.new()
	randomChunk.randomize()
	var whichChunk = randomChunk.randi_range(0, 3)
	if whichChunk == 0:
		#Terrain
		output += "cxcxcxcxepppcxcxcxcx"
		output += "xxxxxxxxepppxxxxxxxx"
		output += "cxggcxcxeeppeeeecxcx"
		output += "xxggxxxxeeppeteexxxx"
		output += "eeeewwwweepppppppppe"
		output += "pppppppweepppppppppp"
		output += "pppppppppeeppppppppp"
		output += "ppppppppperpppeepppp"
		output += "egggppppgeeeppegggpp"
		output += "eeeeeeppgeeeppegReee"
		output += "cxcxcxppeeeeppeeeecx"
		output += "xxxxxxppppppppppppxx"
		#Enemies
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeteeeeee"
		output += "eeeseeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeebeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		
	if whichChunk == 1:
		output += "wwwwwwwwwbbwwwwwwwww"
		output += "wwwwwwwwwbbwwwwwwwww"
		output += "wwwwwwwwwbbwwwwwwwww"
		output += "wwwwwwwwwbbwwwwwwwww"
		output += "wwwwwwwwbbbbwwwwwwww"
		output += "wwwwwwwwbbbbbbbbbbbb"
		output += "wwwwwwwwbbbbbbbbbbbb"
		output += "wwwwwwwwbbbbwwwwwwww"
		output += "wwwwwwwwwwwwwwwwwwww"
		output += "wwwwwwwwwwwwwwwwwwww"
		output += "wwwwwwwwwwwwwwwwwwww"
		output += "wwwwwwwwwwwwwwwwwwww"
		
		#                   MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeseeeeeeeeee"
		#half               MM
		output += "eeeeeeeeeeeseeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
	if whichChunk == 2:

		#                   MM
		output += "eeeeteteggeeeepppppp"
		output += "etgggeeeeeeeepppeepp"
		output += "gegteeeeeeeeeeppcxpp"
		output += "tgtggggeeeeeeeppxxpp"
		output += "eeeggegeeeeeeeeepppp"
		output += "ggggteeeeeeeeeeeeeee"
		#half               MM
		output += "ereeetgeeeeeeeeeeeee"
		output += "eeeeggteeeeeeeeeeeee"
		output += "eeeggeeeeeeeeeeeeeee"
		output += "eegggggeeeteeeeeeeee"
		output += "eeeetegeeeeeeeeeeeee"
		output += "eteeggggeteteggteegg"
		
		#Enemies
		#                   MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeteeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		#half               MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeteeteeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
	
	return output
		
	
func drawULChunk():
	var output = ""
	var randomChunk = RandomNumberGenerator.new()
	randomChunk.randomize()
	var whichChunk = randomChunk.randi_range(0, 3)
	if whichChunk == 0:
		#Terrain
		# e = empty
		# c = cliff
		# x = dead tile for cliff
		# p = path
		# b = bridge
		# t = tree
		# w = water
		# g = grass
		# r = rock
		# R = rock on path

#		#                   MM
		output += "cxeegeeeeeeeegggeecx"
		output += "xxeegeggeeppeeegeexx"
		output += "cxcxcxeeeeepeeeecxcx"
		output += "xxxxxxeeeeeppggexxxx"
		output += "eecxcxcxeeeehgggeecx"
		output += "pexxxxxxeeeeeeeeeexx"
#		#half               MM
		output += "ppeeeecxcxcxcxeggecx"
		output += "epeeeexxxxxxxxepegxx"
		output += "eeeecxcxcxeeeeeeeeee"
		output += "epppxxxxxxeeeppeeeee"
		output += "eeppeeepeeppeppeegge"
		output += "eeepepepppeepeeggeee"

			#Enemies
			# s = spider
			# b = bat
			# t = tree
#		#                   MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		#half               MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeebeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeebeeebeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		
	elif whichChunk == 1:
		#Terrain
		# e = empty
		# c = cliff
		# x = dead tile for cliff
		# p = path
		# b = bridge
		# t = tree
		# w = water
		# g = grass
		# r = rock
		# R = rock on path

#		#                   MM
		output += "eeeeeeeeeeeeepeepppp"
		output += "eeeteeeepeeeeeeppppw"
		output += "eeteeeeepeeeppppwwww"
		output += "eeeeeepeeeeepppwwwww"
		output += "eeeeeeeeepppppwwwwww"
		output += "eeepeppeeppwwwwwwwww"
		#half               MM
		output += "eeeeeeeeeppwwwwwwwww"
		output += "eeeeeeeeeepppwwwwwww"
		output += "eeeeeeeeeepppwwwwwww"
		output += "eeeeeeeepppwwwwwwwww"
		output += "eeeeeepppwwwwwwwwwww"
		output += "eeeeeeeeppwwwwwwwwww"

			#Enemies
			# s = spider
			# b = bat
			# t = tree
#		#                   MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
#		#half               MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
	elif whichChunk == 2:
		#Terrain
		# e = empty
		# c = cliff
		# x = dead tile for cliff
		# p = path
		# b = bridge
		# t = tree
		# w = water
		# g = grass
		# r = rock
		# R = rock on path

#		#                   MM
		output += "eeeeteeeeppeeeeeeeee"
		output += "eeggeeeeeppeeeeeeeee"
		output += "eeeetgeeeeepppppeeee"
		output += "eeeeeteeeeeeeeeepppe"
		output += "eeeetgteetetgeeeeepp"
		output += "pptgeeeetgtetgtggepp"
		#half               MM
		output += "pppegegggeetetggpppe"
		output += "epppeetggteeeeeppeee"
		output += "eeppppetetgepppeeeee"
		output += "eeepppggggpppeeeeeee"
		output += "eteegpppppppeeetggcx"
		output += "eeeeeppppeeeeeeeeexx"

			#Enemies
			# s = spider
			# b = bat
			# t = tree
#		#                   MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeteeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeteeeeeeeeeeeee"
		#half               MM
		output += "eeeeeeeeeeeteeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
	return output
	
	
func drawDRChunk():
	var output = ""
	var randomChunk = RandomNumberGenerator.new()
	randomChunk.randomize()
	var whichChunk = randomChunk.randi_range(0, 3)
	if whichChunk == 0:
				#Terrain
		# e = empty
		# c = cliff
		# x = dead tile for cliff
		# p = path
		# b = bridge
		# t = tree
		# w = water
		# g = grass
		# r = rock
		# R = rock on path

#		#                   MM
		output += "eepppppppppppppppwww"
		output += "pppppwwwwwwwbbppwwww"
		output += "pppwwwwwwwwwbbpwwwww"
		output += "ppwwwwwppwwwbbwwwwww"
		output += "ppwwwwpRpwwwbbwwwwww"
		output += "ppwwwwpppwwwbbpppppp"
#		#half               MM
		output += "ppwwwwwwwwwwbbpppppp"
		output += "ppwwwwwwwwwwwwwwwwww"
		output += "ppwwwwwwwwwwwwwwwwww"
		output += "pppwwwwwwwwwwwwwwwww"
		output += "pppppppppppwwwwwwwww"
		output += "eeeeeppppppwwwwwwwww"

			#Enemies
			# s = spider
			# b = bat
			# t = tree
#		#                   MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
#		#half               MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
	elif whichChunk == 1:

		#Terrain
		# e = empty
		# c = cliff
		# x = dead tile for cliff
		# p = path
		# b = bridge
		# t = tree
		# w = water
		# g = grass
		# r = rock
		# R = rock on path

#		#                   MM
		output += "eeRppeeeeepeepeeeeee"
		output += "reeppepeeeeeeeeppere"
		output += "eereeeeeeeerepppeeee"
		output += "eeeppeeeeeeeeeeeeere"
		output += "peeeeeeeeeeeppeeeeee"
		output += "pppeeeereeeeeeeppepe"
#		#half               MM
		output += "eeeeeppeeeeepeeeepee"
		output += "epppeeeppeeeepeeppre"
		output += "ppepeepppeppeeeepeee"
		output += "pppprpeepeppeepeppep"
		output += "peepeppeprppepeppeee"
		output += "eeeepeppeeppeepepeee"

			#Enemies
			# s = spider
			# b = bat
			# t = tree
#		#                   MM
		output += "ebeeeeeeeeeeeeeeeese"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeseeeeseeeeeeeeee"
#		#half               MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
	elif whichChunk == 2:
		#Terrain
		# e = empty
		# c = cliff
		# x = dead tile for cliff
		# p = path
		# b = bridge
		# t = tree
		# w = water
		# g = grass
		# r = rock
		# R = rock on path

#		#                   MM
		output += "cxcxcxcxcxcxcxcxcxcx"
		output += "xxxxxxxxxxxxxxxxxxxx"
		output += "cxcxcxcxcxcxcxcxcxcx"
		output += "xxxxxxxxxxxxxxxxxxxx"
		output += "cxcxcxcxcxcxcxcxeeee"
		output += "xxxxxxxxxxxxxxxxeepp"
		#half               MM
		output += "cxcxcxcxcxcxeeeepepe"
		output += "xxxxxxxxxxxxepeppgee"
		output += "cxcxcxcxeeeepeppgeee"
		output += "xxxxxxxxeegepeeeeeee"
		output += "cxcxeeeeepepgpeeeeee"
		output += "xxxxeeeeppeeeeeeeeee"

			#Enemies
			# s = spider
			# b = bat
			# t = tree
#		#                   MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
#		#half               MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
	return output
	
func drawDLChunk():
	var output = ""
	var randomChunk = RandomNumberGenerator.new()
	randomChunk.randomize()
	var whichChunk = randomChunk.randi_range(0, 3)
	if whichChunk == 0:
		#Terrain
		# e = empty
		# c = cliff
		# x = dead tile for cliff
		# p = path
		# b = bridge
		# t = tree
		# w = water
		# g = grass
		# r = rock
		# R = rock on path

#		#                   MM
		output += "cxcxcxeegegeeecxcxcx"
		output += "xxxxxxeteteteeeteexx"
		output += "cxcxcxeeeeeeeteeeecx"
		output += "xxxxxxeeteeeeeeeeexx"
		output += "eeeecxewwbbwweeecxcx"
		output += "eeeexxwwwbbwwwwwxxxx"
#		#half               MM
		output += "eeeecxwwwbbwwwwppecx"
		output += "eeeexxpwwbbwwwppeexx"
		output += "eeeeeeppwbbwwwpggeee"
		output += "eeeeeeeeebbeegggggee"
		output += "eeeeeeeeeeeeegggggee"
		output += "eeeeeeeeeeeeeeeegeee"

			#Enemies
			# s = spider
			# b = bat
			# t = tree
#		#                   MM
		output += "eeeeeeeeeseseeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
#		#half               MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
	elif whichChunk == 1:
				#Terrain
		# e = empty
		# c = cliff
		# x = dead tile for cliff
		# p = path
		# b = bridge
		# t = tree
		# w = water
		# g = grass
		# r = rock
		# R = rock on path

#		#                   MM
		output += "tttttttppppptttttttt"
		output += "ttttttpptttppttttttt"
		output += "tttttpptttttpptttttt"
		output += "ttttppttttttpppttttt"
		output += "tttpppttttttttpptttt"
		output += "ppppppttttttttpppttt"
#		#half               MM
		output += "pppptttttttttttppttt"
		output += "ttttttttttttttttpptt"
		output += "tttttttttttttppppttt"
		output += "tttttttttttppptppttt"
		output += "ttgtttttttpppttttttg"
		output += "teeerrtttpptttttteee"

			#Enemies
			# s = spider
			# b = bat
			# t = tree
#		#                   MM
		output += "eeeeeeeeeteeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeet"
#		#half               MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
	elif whichChunk == 2:
		#Terrain
		#Terrain
# e = empty
# c = cliff
# x = dead tile for cliff
# p = path
# b = bridge
# t = tree
# w = water
# g = grass
# r = rock
# R = rock on path

#Enemies
# s = spider
# b = bat
# t = tree
		#                   MM
		output += "eeeeteteggeeepwwwwww"
		output += "etgggeeeeeeeeppwwwww"
		output += "gegteeeeeeeeeppwwwww"
		output += "tgtggggeeeeeeepppwww"
		output += "eeeggegeeeeeeeeepppp"
		output += "ggggteeeeeeeeeeeeeee"
		#half               MM
		output += "ereeetgeeeeeeeeeeeee"
		output += "eeeeggteeeeeeeeeeeee"
		output += "eeeggeeeeeeeeeeeeeee"
		output += "eegggggeeeteeeeeeeee"
		output += "eeeetegeeeeeeeeeeeee"
		output += "eteeggggeteteggteegg"
		
		#Enemies
		#                   MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeteeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		#half               MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeteeteeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		
	return output
	
	
func drawLRChunk():
	var output = ""
	var randomChunk = RandomNumberGenerator.new()
	randomChunk.randomize()
	var whichChunk = randomChunk.randi_range(0, 3)
	if whichChunk == 0:
		#Terrain
		# e = empty
		# c = cliff
		# x = dead tile for cliff
		# p = path
		# b = bridge
		# t = tree
		# w = water
		# g = grass
		# r = rock
		# R = rock on path

#		#                   MM
		output += "eecxcxxxegggggeeeeee"
		output += "eexxxxcxggggggeeeeee"
		output += "eeeecxcxcxcxcxeeeeee"
		output += "eeeexxxxxxxxxxeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
#		#half               MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeewwwweeeeeee"
		output += "eeeeeeewwwwwwweeeeee"
		output += "eeteteeeewwwweeeeeee"
		output += "eeeeeeeewwweeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"

			#Enemies
			# s = spider
			# b = bat
			# t = tree
#		#                   MM
		output += "eeeeeeeeeebeeeeeeeee"
		output += "eeeeeeeeeeeseeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
#		#half               MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeteeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
	elif whichChunk == 1:
		#Terrain
		# e = empty
		# c = cliff
		# x = dead tile for cliff
		# p = path
		# b = bridge
		# t = tree
		# w = water
		# g = grass
		# r = rock
		# R = rock on path

#		#                   MM
		output += "wwwbbwwwwwbbwwwwwwww"
		output += "wwbbbbbbbbbbbwwwwwww"
		output += "wwbbbbbbbbbbbwwwwwww"
		output += "wwwbbwwwwwbbwwwwwwww"
		output += "wwwbbwwwwwbbwwwwwwww"
		output += "bbbbbbwwwwbbwwwwwwww"
#		#half               MM
		output += "bbbbbbwwwwbbwwwwwwww"
		output += "wwwbbwwwwwbbwwwwwwww"
		output += "wwwwwwwwwbbbbbbbbbbb"
		output += "wwwwwwwwwbbbbbbbbbbb"
		output += "wwwwwwwwwwbbwwwwwwww"
		output += "wwwwwwwwwweewwwwwwww"

			#Enemies
			# s = spider
			# b = bat
			# t = tree
#		#                   MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
#		#half               MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
	elif whichChunk == 2:
				#Terrain
		# e = empty
		# c = cliff
		# x = dead tile for cliff
		# p = path
		# b = bridge
		# t = tree
		# w = water
		# g = grass
		# r = rock
		# R = rock on path

#		#                   MM
		output += "gggggggggggggggggggg"
		output += "ggggggggpppppgtggggg"
		output += "gggggtppppppppgggggg"
		output += "ggggppppggggppggtggg"
		output += "ggppppggtgggppppgggg"
		output += "ppppggggggggggpppppp"
#		#half               MM
		output += "ppppgggtggggggpppppp"
		output += "gggggggggggpppppgggg"
		output += "gtggtgggggpppggggggg"
		output += "ggggggggppppgggggggg"
		output += "ggggggggpppgggtggggg"
		output += "gggggggpppgggggggggg"

			#Enemies
			# s = spider
			# b = bat
			# t = tree
#		#                   MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
#		#half               MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeteeeeeeeeee"
	return output
	
	
func drawUDChunk():
	var output = ""
	var randomChunk = RandomNumberGenerator.new()
	randomChunk.randomize()
	var whichChunk = randomChunk.randi_range(0, 3)
	if whichChunk == 0:
				#Terrain
		# e = empty
		# c = cliff
		# x = dead tile for cliff
		# p = path
		# b = bridge
		# t = tree
		# w = water
		# g = grass
		# r = rock
		# R = rock on path

#		#                   MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
#		#half               MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"

			#Enemies
			# s = spider
			# b = bat
			# t = tree
#		#                   MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
#		#half               MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
	elif whichChunk == 1:
		pass
	elif whichChunk == 2:
		pass
	return output
	
	
func drawULRChunk():
	var output = ""
	var randomChunk = RandomNumberGenerator.new()
	randomChunk.randomize()
	var whichChunk = randomChunk.randi_range(0, 3)
	return output
	

func drawUDLChunk():
	var output = ""
	var randomChunk = RandomNumberGenerator.new()
	randomChunk.randomize()
	var whichChunk = randomChunk.randi_range(0, 3)
	return output
	

func drawUDRChunk():
	var output = ""
	var randomChunk = RandomNumberGenerator.new()
	randomChunk.randomize()
	var whichChunk = randomChunk.randi_range(0, 3)
	return output
	
	
func drawDRLChunk():
	var output = ""
	var randomChunk = RandomNumberGenerator.new()
	randomChunk.randomize()
	var whichChunk = randomChunk.randi_range(0, 3)
	return output
	
func drawUDLRChunk():
	var output = ""
	var randomChunk = RandomNumberGenerator.new()
	randomChunk.randomize()
	var whichChunk = randomChunk.randi_range(0, 3)
	return output

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
