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
			# C = chest
			# S = slime
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
	var whichChunk = randomChunk.randi_range(0, 4)
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

	if whichChunk == 3:

		#                   MM
		output += "eeeeeeeeeppeeecxcxcx"
		output += "eeteeeepeeeeeexxxxxx"
		output += "eeeegepeeggeeeeecxcx"
		output += "eepeeeegreeeeeeexxxx"
		output += "eeegeeeeggeggeeeeeee"
		output += "epeeeeggegegeegeeeep"
		#half               MM
		output += "epeeeeeeegeeeeeeepge"
		output += "geeeeeegeeegeeepeeee"
		output += "eeeeeeeeeeegeepepeee"
		output += "wepeepegepeeepgeeeee"
		output += "wwwweeeeeepeegeegeee"
		output += "wwwwweeeeeeeeeeeteee"
		
		#Enemies
		#                   MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeebeSebeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		#half               MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
	elif whichChunk == 4:
		output += "eteeeeeegeeeeeeeeeee"
		output += "teeteeegeeeeeeewwwee"
		output += "teteeteegeeeewwwweee"
		output += "eeetteeggegeeeewwwee"
		output += "etteteegeeegewwwweee"
		output += "eeeteteeggeeeeewwwee"
		output += "tteeteteeggeggeegeee"
		output += "eeteetteeteeetetetee"
		output += "teeteeteteeeteeeteee"
		output += "eeteeeeteeeteeetteee"
		output += "eeteeteeeeeteetetete"
		output += "eeeteeteetteteeteete"
		
		#                   MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeweeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeweeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeseeeeeeeeee"
		#half               MM
		output += "eeeeeeeeeeeseeeeeeee"
		output += "eeeweeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
	return output
		
	
func drawULChunk():
	var output = ""
	var randomChunk = RandomNumberGenerator.new()
	randomChunk.randomize()
	var whichChunk = randomChunk.randi_range(0, 4)
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
	elif whichChunk == 3:
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
		output += "wwwwwppgpppeppwwwwww"
		output += "wwwwwpppppppwwwwwwww"
		output += "wwwwwwwbbwwwwwwwwwww"
		output += "wwwwwwwbbwwwwwwwwwww"
		output += "wbbbbwwbbwwwwwwwwwww"
		output += "bbbbbwwbbwwwwwwwwwww"
		#half               MM
		output += "bbbbbwwbbwwweeeewwww"
		output += "wwbbwwwbbbbbbbbeeeww"
		output += "wwbbbwwbbbbbbbbeeeww"
		output += "wwbbbbbbbbbeeeeewwww"
		output += "wwbbbbbbbbbwwwwwwwww"
		output += "wwwwwwwbbwwwwwwwwwww"

			#Enemies
			# s = spider
			# b = bat
			# t = tree
#		#                   MM
		output += "eeeeeeeeSeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		#half               MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeSeeeee"
		output += "eeeeeeeeeeeeeSeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
	elif whichChunk == 4:
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
		output += "eeeeeppppppgeeeeeeee"
		output += "eeeppppppppgegeeteee"
		output += "cxeppwwwwwwegegeeecx"
		output += "xxpppeewwwwweeegeexx"
		output += "eppppeeeewwwwwgegecx"
		output += "ppppeewwwwwegeegeexx"
		#half               MM
		output += "ppeeeeeewwwwwegeggee"
		output += "eeeereewwwweegggegee"
		output += "eeeerwwwwwegeeeeeeee"
		output += "ererewwwwwweeegtegee"
		output += "eeeewwwwwwwwweeggegg"
		output += "eereeeewwwwwwwwgeege"

			#Enemies
			# s = spider
			# b = bat
			# t = tree
#		#                   MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeSee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "beeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
#		#half               MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeweee"
		output += "eeeeeeeeeeeeeeeeecee"
		output += "eeeeeeeeeeeeeeeeeeee"
	return output
	
	
func drawDRChunk():
	var output = ""
	var randomChunk = RandomNumberGenerator.new()
	randomChunk.randomize()
	var whichChunk = randomChunk.randi_range(0, 4)
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
	elif whichChunk == 3:
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
		output += "pppppppppppRggeegeee"
		output += "pppppppppppReggegtee"
		output += "ppRRRRRRRppRgegeegee"
		output += "ppReeeeeRppRetgeegee"
		output += "ppReeepppppppppppppp"
		output += "ppReeepppppppppppppp"
		#half               MM
		output += "ppReeepppppppppppppp"
		output += "ppRReepppppppppppppp"
		output += "pppReeeppppeegeegeee"
		output += "pppReeeeppppggeteegg"
		output += "pppReeeeppppeggeggge"
		output += "RRRReeeeppppegegggee"

			#Enemies
			# s = spider
			# b = bat
			# t = tree
#		#                   MM
		output += "seeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeebeeeeeeeee"
#		#half               MM
		output += "eeeeeeeeebeeeeeeeeee"
		output += "seeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "ScSeeeeeeeeeeeeeeeee"
		output += "eseeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		
	elif whichChunk == 4:
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
		output += "cxcxcxcxcxeeeeeeeRee"
		output += "xxxxxxxxxxeeeReeeeee"
		output += "cxcxcxeeeeeeeeeeeeee"
		output += "xxxxxxeeeeeeeeeereee"
		output += "cxcxeeereeeReeeeeeee"
		output += "xxxxeeReeeeeeeeppeep"
		#half               MM
		output += "cxcxeeeeeeeeeeeeeepp"
		output += "xxxxeeeeeeeeepeeeeee"
		output += "cxcxeeereepeeeReeeee"
		output += "xxxxeeeeepeeeeeeReee"
		output += "cxeeeeeeepeeeeeeeeee"
		output += "xxeeeeeepeeereeeeeee"

			#Enemies
			# s = spider
			# b = bat
			# t = tree
#		#                   MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "ebeeeebeeeeeeeeeSeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeseeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeseeeseeeeeeee"
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
	var whichChunk = randomChunk.randi_range(0, 4)
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
		output += "ttttttpppppppptttttt"
		output += "tttttpppttttpppttttt"
		output += "ttttppptttttpppptttt"
		output += "tttpppptttttttpppttt"
		output += "ppppppttttttttpppptt"
#		#half               MM
		output += "pppptttttttttttppptt"
		output += "tttttttttttttttppppt"
		output += "tttttttttttppppppptt"
		output += "ttttttttttpppptppptt"
		output += "ttgttttttpppptttpppg"
		output += "teeerrttpppttttttppp"

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
	elif whichChunk == 3:
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
		output += "wwwwppwwwwwwwwwwwwww"
		output += "wwppppppppwwwwwwwwww"
		output += "wpppppppwwwwwwwwwwwp"
		output += "wwwppwwwwwwwwwpppppp"
		output += "wwwwwwwwwwpppppppppp"
		output += "wwwwpppppppppppppppp"
		#half               MM
		output += "wwwppppppppppppppppp"
		output += "wwppppwwwwwppppppppp"
		output += "wwppppwwwwwwwwwwwppp"
		output += "wwppppwwwwwwwwwwwwww"
		output += "wwpppppppppwwwwwwwww"
		output += "wwwwpppppppppwwwwwww"
		
		#Enemies
		#                   MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeceeeeeeeeeeeeeeee"
		output += "eeeeSeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeese"
		#half               MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		
	elif whichChunk == 4:
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
		output += "gggggggggrrrrrrrrrrr"
		output += "gwwwwwwwgrpppppppppr"
		output += "gwwwwwwwgrpppppppppr"
		output += "gggggggggrpprrrrrppr"
		output += "Trrrrrrrrrppreeerppr"
		output += "ppppppppppppreeerppr"
		#half               MM
		output += "ppppppppppppreeerppr"
		output += "Trrrrrrrrrrrreeerppr"
		output += "etetetetrrrrrrrrrppr"
		output += "teteteterppppppppppr"
		output += "etetetetrppppppppppr"
		output += "teteteteTppTrrrrrrrr"

			#Enemies
			# s = spider
			# b = bat
			# t = tree
#		#                   MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeseeeeesee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeseeeeeeeeeeeeeeeee"
#		#half               MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeseeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
	return output
	
	
func drawLRChunk():
	var output = ""
	var randomChunk = RandomNumberGenerator.new()
	randomChunk.randomize()
	var whichChunk = randomChunk.randi_range(0, 4)
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
		output += "wwwbbwwwwwbbwwwwwppw"
		output += "bbbbbbwwwwbbwwwwwppp"
#		#half               MM
		output += "bbbbbbwwwwbbwwwwwppp"
		output += "wwwbbwwwwwbbwwwwpppw"
		output += "wwwwwwwwwbbbbbbbbbbb"
		output += "wwwwwwwwwbbbbbbbbbbb"
		output += "wwwwwwwwwwbbwwwwwwpp"
		output += "wwwwwwwwwweewwwwwwwp"

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
	elif whichChunk == 3:
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
		output += "cxcxcxcxcxeeeeeeeeee"
		output += "xxxxxxxxxxeteeteeeee"
		output += "eeeteeeteeteeteeeeee"
		output += "eteeeteeeeeeeeteeeee"
		output += "eeeeeeeeewweeeetetee"
		output += "pppeeecxewwweepppppp"
		#half               MM
		output += "pppecxcxeewwpppppppp"
		output += "epppxxxxeepppppeeeee"
		output += "eppppeeeeppppppeeeee"
		output += "eeppppppppppeeeeeree"
		output += "cxeppppppppeeeereeee"
		output += "xxeeeeeeeeeeeeeeeeee"
		
		#Enemies
		#                   MM
		output += "eeeeeeeeeeeeeeceeeee"
		output += "eeeeeeeeeeeeeeeeeSee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		#half               MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeebee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeebeee"
	elif whichChunk == 4:
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
		output += "cxcxcxgeegegeggeegeg"
		output += "xxxxxxeeggeegegeegee"
		output += "cxcxgeggegeggggegggg"
		output += "xxxxggegeggggegeegeg"
		output += "egeeeggegeeeegeggege"
		output += "pppppppppppppppppppp"
		#half               MM
		output += "pppppppppppppppppppp"
		output += "ggegegggeeeegegeggee"
		output += "cxcxeegegegegeegggeg"
		output += "xxxxeggeggegegeeggee"
		output += "cxcxcxegegeggegeegee"
		output += "xxxxxxegegegegegeege"

			#Enemies
			# s = spider
			# b = bat
			# t = tree
#		#                   MM
		output += "eeeeeeeeeeeeeeeeewee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eweeeeeeeeeeeeeeeeee"
#		#half               MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeewee"
	return output
	
	
func drawUDChunk():
	var output = ""
	var randomChunk = RandomNumberGenerator.new()
	randomChunk.randomize()
	var whichChunk = randomChunk.randi_range(0, 4)
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
		output += "eeereeeegpppeeeeeeee"
		output += "eeeeeeeeggcxppeeeeee"
		output += "eeeeeeeeggxxppeeeeee"
		output += "eereeeegcxcxcxpeeeee"
		output += "eeeeeeggxxxxxxpeeeee"
#		#half               MM
		output += "eeeeegggcxcxcxpeeeee"
		output += "eeeeeeggxxxxxxpeeeee"
		output += "eeeeeeegggcxpppeeeee"
		output += "eeeeeeeeggxxpeeeeeee"
		output += "eereeeeeegpppeeeeree"
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
		output += "eeeeeeeeebbeeeeeeeee"
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
		output += "ppppeeeeeggeeepppppp"
		output += "wwwpeeeegggeepppwwww"
		output += "wwwwpeeeegggepwwwwww"
		output += "wwwwwpeeeggeepwwwwww"
		output += "wwwwwpeeeggepwwwwwww"
		output += "wwwwpeeeegggepwwwwww"
#		#half               MM
		output += "wwwwwpeeeggeeepwwwww"
		output += "wwwwwwpegggeepwwwwww"
		output += "wwwwwpeeegggpwwpwwww"
		output += "wwwwpeeeeggeepwwwwww"
		output += "wwwpeeeeeggeeppwwwww"
		output += "ppppeeeeeggeeepppppp"

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
		output += "eewwpwppwbbwwwwppwee"
		output += "wwwwpwwwwbbwwwwwwwww"
		output += "wwwwwppppbbpppwwwwww"
		output += "wwwppppppppRppwwwwww"
		output += "wwwwpppppppppwwwwwww"
		output += "wwwpppwwwbbwwwwwwwww"
#		#half               MM
		output += "wwwbbwwwwbbwwwwwwwww"
		output += "wwpbbpwwwbbwwwwwwwww"
		output += "wppbbppwwbbwwwwwwwww"
		output += "wwppppwwwbbwwwwwwwww"
		output += "wwwwwwwwwbbwwwwpwwww"
		output += "eewwppwwwbbwwwppwwee"

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
		output += "eeeseeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
	elif whichChunk == 3:
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
		output += "eeeeeeeeeppeetetgete"
		output += "eeeeeteeeppetggetgee"
		output += "eeteeeeepppeetteggee"
		output += "eeeeteepppetetgeteee"
		output += "eteeteppcxcxgeteeeee"
		output += "eeeteeppxxxxeteeteee"
		#half               MM
		output += "eteeteppcxeeeeteetee"
		output += "eeteteppxxeetggteete"
		output += "eeteeeeppeeggteeteee"
		output += "eeeteteppegeeteeeeee"
		output += "eteeeteeppeeteeeteee"
		output += "eteteeeeeppeeeeteete"
		
		#Enemies
		#                   MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "ebeeeeeeeeeeeeeeeebe"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		#half               MM
		output += "eeeeeeeeeebeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeebee"
		output += "ebeeeeeeeeeeeeeeeebe"
		output += "eeeeeeeeeeeeeeeeeeee"
	elif whichChunk == 4:
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
		output += "cxcxcxcxeppeeeegeege"
		output += "xxxxxxxxepppppppppeg"
		output += "ppppeecxepppppppppee"
		output += "ppppeexxgegeeeeeppee"
		output += "cxppeecxgeegeeeeppee"
		output += "xxppeexxegeegeeeppee"
		#half               MM
		output += "cxppeecxgeegeegeppee"
		output += "xxppppxxeeggeeppppee"
		output += "eeeepppppeepppppeege"
		output += "eeeeeeppppppppeeggee"
		output += "eeeeeeeeppppeegegeee"
		output += "eeeeeeeeeppeeeggeege"

			#Enemies
			# s = spider
			# b = bat
			# t = tree
#		#                   MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "ceseeeeeeeeeeeeeeeee"
		output += "sebeeeeeeeeeeeeeeeee"
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
	
	
func drawULRChunk():
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
		output += "cxeeeeeeeeeeeeeeeeee"
		output += "xxeeeeeeeppeeeeettee"
		output += "cxcxcxcxeepppeetttte"
		output += "xxxxxxxxeeeeppeettte"
		output += "eeeeeecxcxcxeppeetee"
		output += "eeeeeexxxxxxeeppeeee"
#		#half               MM
		output += "eeeeeeeeeecxcxcxeecx"
		output += "eeeeeeeeeexxxxxxeexx"
		output += "cxcxeeeeeeeeeeeeeecx"
		output += "xxxxeeeeeeeeeeeeeexx"
		output += "cxcxcxcxcxcxcxcxcxcx"
		output += "xxxxxxxxxxxxxxxxxxxx"

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
		output += "eeeeeeeseeeeeeeeeeee"
		output += "eeeeeeeeeseeeeeeeeee"
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
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeereeeeeeeeeeeereee"
		output += "eecxcxcxeeeeeeeeeeee"
		output += "eexxxxxxeeeeewweeeee"
		output += "ercxcxeeeeewwwweeeee"
		output += "eexxxxeeeeeeewwweeee"
		#half               MM
		output += "eeeeeeeeeeeeeewweeee"
		output += "eewwwgpggpggwwwweeee"
		output += "eeewwwepgewwwwcxeeee"
		output += "eeeeewwwewwweexxeeee"
		output += "eeRereewwwweeeeeeeee"
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
		output += "eeeeeeeeeTTeeeeeeeee"
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
		output += "wwwwwwwwwbbewwwwwwww"
		output += "wwwwwwwwwbbwwwwwwwww"
		output += "wwwwwwwpppppppwwwwww"
		output += "wwwwwpppppppppppwwww"
		output += "wwwwwwwwwwwwppppwwww"
		output += "bbpppeepppppppbbbbbb"
#		#half               MM
		output += "bbbbppppppppbbbbbbbb"
		output += "wwwwwwpppeewwwwwwwww"
		output += "wwwwwwwwwwwwwwwwwwww"
		output += "wwwwwwwwwwwwwwwwwwww"
		output += "wwwwwwwwwwwwwwwwwwww"
		output += "wwwwwwwwwwwwwwwwwwww"

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
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
	elif whichChunk == 3:
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
		output += "eeeeeeeppppppppeeeee"
		output += "eepppppppwwppppppeee"
		output += "ppppppwwwwwwpppppppp"
		#half               MM
		output += "pppwwwwwwwwwwwwppppp"
		output += "pwwwwwwwwwwwwwwwwwpp"
		output += "wwwwwwwwwwwwwwwwwwwp"
		output += "wwwwwwwwwwwwwwwwwwww"
		output += "wwwwwwwwwppppwwwwwww"
		output += "wwwwwwwpppppppwwwwww"

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
	

func drawUDLChunk():
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
		output += "eeeeeeeeeeeeeeeeeecx"
		output += "eteeeteeeeeeeeeeeexx"
		output += "eeeteeeeeeeeeecxcxcx"
		output += "eeeeeeeeeeeeeexxxxxx"
		output += "eeeeeeeecxcxcxcxcxcx"
		output += "eeeeeteexxxxxxxxxxxx"
#		#half               MM
		output += "eeeeeeeecxcxcxcxcxcx"
		output += "eeeeeteexxxxxxxxxxxx"
		output += "eeeteeeeeteteecxcxcx"
		output += "eewweeeeeeeeeexxxxxx"
		output += "eewwweeeeeeeteeeeecx"
		output += "eeeeweeeeeeeeeeeeexx"

			#Enemies
			# s = spider
			# b = bat
			# t = tree
#		#                   MM
		output += "eeeeeeeeesseeeeeeeee"
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
		output += "eeeeeeeeebbeeeeeeeee"
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
		output += "eeeeeeeeeppeeeeeeeee"
		output += "eeeteeeteppeteeteeee"
		output += "eeeeeteeetpeteeeetee"
		output += "eeteeeeetppteeeteeee"
		output += "eeeeeeteeppeeteteeee"
		output += "pppppppppppeeeeeeeee"
		#half               MM
		output += "eeeeeeeeeppeteteteee"
		output += "eeeeeteeeppeeeteeeee"
		output += "eeeteeeeeppeteetetee"
		output += "eteteeteeppetteeteee"
		output += "tteeteeteppeteteeeee"
		output += "eeteteteeppeteeeetee"

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
		output += "eeeeeeeeeeteeeeeeeee"
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

		#                   MM
		output += "eeewwweeeeeeeeeeeree"
		output += "eewwwwweeeeeeeeeeere"
		output += "eeeewwweeeeeerreeeer"
		output += "eerrrrrrrrrrreeeeeee"
		output += "rreeeeeeeeeeeeeeeecx"
		output += "eeeeeeeeeeeweeeeeexx"
#		#half               MM
		output += "eeeeeeewwbbwweegeeee"
		output += "eeteewwwwbbwwegggeee"
		output += "tttttttwwbbweeegggee"
		output += "eetteewwwbbwweeegggg"
		output += "ettttteewbbwwwwggeee"
		output += "eeeeteeeeppeeeeeeeee"

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
	elif whichChunk == 3:
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
		output += "eeeeeeeeeppeeeeeeeee"
		output += "eeeteeteepppeeteeeee"
		output += "eeteeeeeeepppeeeetee"
		output += "eeeeteeeeeeppppteeee"
		output += "eeeeeeteteeeppppppee"
		output += "ppeteeeeeeeteepppppp"
		#half               MM
		output += "pppppeeeeteeteeetepp"
		output += "ppppppeeeeeeeeeeeepp"
		output += "eeepppppppeeeeeeeppp"
		output += "eeeeeepppppppppppppe"
		output += "eteteeeeeepppppppeee"
		output += "eeeeeteeepppeeeeeete"

			#Enemies
			# s = spider
			# b = bat
			# t = tree
#		#                   MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeteeeeeeeeeeeeteee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
#		#half               MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeteeeeeeeeeeeeeteee"
		output += "eeeeeeeeeeeeeeeeeeee"
	return output
	

func drawUDRChunk():
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
		output += "eeeeeeeeeppeeeeecxcx"
		output += "eeeeRpeeeeeeeeeexxxx"
		output += "cxeeeppecxeeeeeecxee"
		output += "xxeeeppexxeeeeeexxee"
		output += "cxerepcxcxeeeecxcxee"
		output += "xxeppexxxxeeeexxxxep"
#		#half               MM
		output += "cxppcxcxeeeecxcxeepe"
		output += "xxpexxxxeeeexxxxppee"
		output += "eeeppecxcxcxcxppeeee"
		output += "weppeexxxxxxxxeepeee"
		output += "wtepepppepppeppeeecx"
		output += "wwteeeepppepeeeeeexx"

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
		output += "eeeeeeeeeebeeeeeeeee"
		#half               MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
	if whichChunk == 1:
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
		output += "weeettteeeeettteeeww"
		output += "wwwttteeeeeeeetttwww"
		output += "wwtteeeeeeeeeeeettww"
		output += "wtteeeeeeeeeeeeeetww"
		output += "tteeeeeeeereeeeeettt"
		output += "teeeeeeeeeeeeeeeeeee"
#		#half               MM
		output += "teeeeereeeeeeeeeeeee"
		output += "teeeeeeeeeeereeeettt"
		output += "ttteeeeeeeeeeeetttee"
		output += "wettteeeeeeeeettteew"
		output += "wweettteeeeeetteewww"
		output += "weeeeetteeeetteeeeww"

			#Enemies
			# s = spider
			# b = bat
			# t = tree
#		#                   MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeteeeeeeeee"
		output += "eeeeeeeteeeeeeeeeeee"
#		#half               MM
		output += "eeeeeeeeeeeteeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
	if whichChunk == 2:
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
		output += "eeeeeeeeeppeeeeeeeee"
		output += "eeteteeepppeeegggeee"
		output += "eeeteeeppppeggggeeee"
		output += "eeeeteeppeeeeeggggee"
		output += "eeteeeeppeeegggggeee"
		output += "eepppppppppppppppppp"
#		#half               MM
		output += "eepppppppppppppppppp"
		output += "eeppeeeeeeeeeeweeeee"
		output += "eepppppppppeewwweeee"
		output += "eepppppppppeeewwweee"
		output += "eeeeeeeeeppeewwwweee"
		output += "eeeeeeeeeppeeewweeee"

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
		output += "eeeeeeeeeseeeeeeeeee"
#		#half               MM
		output += "eeeeeeeeeseeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
	elif whichChunk == 3:
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
		output += "wwwwwwwwwbbwwwwwwwww"
		output += "wwwwwwwwwbbwwwwwwwww"
		output += "wwwwwwwwwbbwwwwwwwww"
		output += "pwwwwwwwwbbwwwwwwwww"
		output += "ppwwwwwbbbbbbwwwwwww"
		output += "ppbbbbbbbbbbbbbbbbbb"
		#half               MM
		output += "pppbbbbbbbbbbbbbbbbb"
		output += "pppwwwwbbbbbbwwwwwww"
		output += "pppwwwwwwbbwwwwwwwww"
		output += "ppwwwwwwwbbwwwwwwwww"
		output += "wwwwwwwwwbbwwwwwwwww"
		output += "wwwwwwwwwbbwwwwwwwww"

			#Enemies
			# s = spider
			# b = bat
			# t = tree
#		#                   MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "seeeeeeeeeeeeeeeeeee"
		output += "ceeeeeeeeSeeeeeeeeee"
#		#half               MM
		output += "seeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
	return output
	
	
func drawDRLChunk():
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
		output += "wwwppppppppppppppwww"
		output += "wwppppppppppppppppww"
		output += "wppppwwwwbbwwwwppppw"
		output += "pppwwwwwwbbewwwwwppp"
		output += "ppwwwwwwwbbwwwwwwwpp"
		output += "ppwwwwwwwbbwwwwwwwpp"
#		#half               MM
		output += "ppwwwwwwwbbwwwwwwwpp"
		output += "ppwwwwwwwbbwwwwwwwpp"
		output += "ppwwwwwwwbbwwwwwwwpp"
		output += "wwwwwwwwwbbwwwwwwwww"
		output += "wwwwwwwwwbbwwwwwwwww"
		output += "wppwwpwwpbbppwpwpwww"

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
	if whichChunk == 1:
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
		output += "eeeweeeecxcxcxcxcxcx"
		output += "eewwweeexxxxxxxxxxxx"
		output += "eeewwwweeecxcxcxeecx"
		output += "eeeeewwweexxxxxxeexx"
		output += "eeeeeeweeeeecxeeeeee"
		output += "eppeppeeeeeexxeeeeee"
#		#half               MM
		output += "ppepeppeeeeecxeeeeee"
		output += "eeteeeepeeeexxeeeeee"
		output += "etetetppeecxcxeeeeee"
		output += "eetetepeeexxxxeeeeee"
		output += "eeeeeeeepeeeeeeeeeee"
		output += "eeeeeeeeeppeeeeeeeee"

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
		output += "eeeseeeeeeeeeeeeeeee"
		output += "eeseeeeeeeeeeeeeebee"
		output += "eeeeeeeeeeeeeeeeeeee"
	if whichChunk == 2:
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
		output += "eeeeeeeegggeeeeeeeee"
		output += "eeeeereeeeeewwweeeee"
		output += "eecxcxcxeewwwewwweee"
		output += "eexxxxxxewwweeeeeeee"
		output += "eeeecxcxeeeeeeeeeeee"
		output += "ppppxxxxeeeeeepppppp"
#		#half               MM
		output += "pppppppeeeeeeppppppp"
		output += "eeeeeeppeeeeppeeeeee"
		output += "eeeeeeeppeeppeeeeeee"
		output += "eeeeeeeeppppeeeereee"
		output += "eeeReeeeeppeeeReeeee"
		output += "eeeeeeeeeppeeeeeeeee"

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
	elif whichChunk == 3:
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
		output += "eeeecxcxeeeeeeeeeeee"
		output += "wwwwxxxxeeeeeeeeeeee"
		output += "wwwwwwcxcxcxcxcxcxcx"
		output += "wwwwwwxxxxxxxxxxxxxx"
		output += "wwbbbbwwcxcxeeeeeeee"
		output += "bbbbbbwwxxxxeeeeeepp"
		#half               MM
		output += "bbbbbbwwwecxeeeeeepp"
		output += "wwbbbbwwwexxeepppppp"
		output += "wwwbbwwweecxeepppeee"
		output += "wwwbbwwweexxppppeeee"
		output += "wwwbbwwwepppppeeeeee"
		output += "wwwppppppppeeeeeeeee"

			#Enemies
			# s = spider
			# b = bat
			# t = tree
#		#                   MM
		output += "eeeeeeeeeeceeeeeeeee"
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
	
func drawUDLRChunk():
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
		output += "wwwwwwpppbbpppwwwwww"
		output += "wwwwwwwwpbbpwwwwwwww"
		output += "wwwwwwwwwbbwwwwwwwww"
		output += "pwwwwwwwwbbwwwwwwwwp"
		output += "ppwwwppppppppppwwwwp"
		output += "bbbbbbppeeggeppbbbbb"
#		#half               MM
		output += "bbbbbbeegggeeepbbbbb"
		output += "ppwwwpeeeggeeppwwwwp"
		output += "pwwwwwpppbbpppwwwwwp"
		output += "pwwwwwwwwbbwwwwwwwww"
		output += "wwwwwwwwpbbpwwwwwwww"
		output += "wwwwwwpppbbppppwwwww"

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
		output += "eeeeeeeeeteeeeeeeeee"
		#half               MM
		output += "eeeeeeeeeeceeeeeeeee"
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
		output += "eeewweeeeppeeeeeeeee"
		output += "eewwwwweepppppeeeeee"
		output += "eebbbbbeeeeppppecxee"
		output += "eewwwwweeeeeepppxxee"
		output += "eeewwereeeeteepppeee"
		output += "pppeeeeeeeeeeeeppeee"
#		#half               MM
		output += "pppppeeggeeggeeppppp"
		output += "eeppppeeggggeeppeeee"
		output += "eeeeppeeeeeeeeppeeee"
		output += "eeeepppeeeeeepppeeee"
		output += "eeeeeppeeeeeppeeeeee"
		output += "eeeeepppppppppeeeeee"

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
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeggeeeeeeeeeeeee"
		output += "eewweeggeeeeeecxcxee"
		output += "eeeweegeeeeeeexxxxee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "pppppppppppppppppppp"
#		#half               MM
		output += "pppppppppppppppppppp"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "ewwwweeeeeeeeReeeeee"
		output += "eewwwwweeeeeeeereeee"
		output += "ewwwwweeeeereeeereee"
		output += "eeeeeeeeeeeeeeeeeeee"

			#Enemies
			# s = spider
			# b = bat
			# t = tree
#		#                   MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eebeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
#		#half               MM
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeesee"
		output += "eeeeeeeeeeeeeeeeeeee"
		output += "eeeeeeeeeeeeeeeeeeee"
	elif whichChunk == 3:
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
		output += "eeeeeteeeeeeeeeteeee"
		output += "eeeeteeeeeeeteetgeee"
		output += "eteeeeewwwwweeeeteee"
		output += "eeteewwwwwwwwwweeeee"
		output += "eeeeeeewwwwwwwwweeee"
		output += "eeeeeewwwwwwwwwteeee"
		#half               MM
		output += "eeeewwwwwwwwweeeeeee"
		output += "eeteeewwwwwweeeeteee"
		output += "eeeeewwwwweeeeeeeeee"
		output += "eteeeewweeeeeeteeeee"
		output += "eeeteeeeeeeeeeeeeeee"
		output += "eteeeeeeeeeeeeeteeee"

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

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
