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

#Enemies
# s = spider
# b = bat
# t = tree

func drawURChunk():
	var output = ""
	
	var randomChunk = RandomNumberGenerator.new()
	randomChunk.randomize()
	var whichChunk = randomChunk.randi_range(0, 3)
	whichChunk = 0
	print("here")
	if whichChunk == 0:
		#Terrain
		output  = "cxcxcxcxepppcxcxcxcx"
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
	
	return output
		
	
func drawULChunk():
	var output = ""
	var randomChunk = RandomNumberGenerator.new()
	randomChunk.randomize()
	var whichChunk = randomChunk.randi_range(0, 3)
	return output
	
	
func drawDRChunk():
	var output = ""
	var randomChunk = RandomNumberGenerator.new()
	randomChunk.randomize()
	var whichChunk = randomChunk.randi_range(0, 3)
	return output
	
func drawDLChunk():
	var output = ""
	var randomChunk = RandomNumberGenerator.new()
	randomChunk.randomize()
	var whichChunk = randomChunk.randi_range(0, 3)
	return output
	
	
func drawLRChunk():
	var output = ""
	var randomChunk = RandomNumberGenerator.new()
	randomChunk.randomize()
	var whichChunk = randomChunk.randi_range(0, 3)
	return output
	
	
func drawUDChunk():
	var output = ""
	var randomChunk = RandomNumberGenerator.new()
	randomChunk.randomize()
	var whichChunk = randomChunk.randi_range(0, 3)
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
	

func drawUDRChunk(x, y):
	var output = ""
	var randomChunk = RandomNumberGenerator.new()
	randomChunk.randomize()
	var whichChunk = randomChunk.randi_range(0, 3)
	return output
	
	
func drawDRLChunk(x, y):
	var output = ""
	var randomChunk = RandomNumberGenerator.new()
	randomChunk.randomize()
	var whichChunk = randomChunk.randi_range(0, 3)
	return output
	
func drawUDLRChunk(x, y):
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
