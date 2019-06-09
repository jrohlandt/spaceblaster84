extends Node

var RockL = preload("res://Rocks/Rock_large.tscn")
var RockM = preload("res://Rocks/Rock_Medium.tscn")
var RockS = preload("res://Rocks/Rock_Small.tscn")

var createRock = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	#Globals.set("gameRunning", true)
	
func _process(delta):
	
	if createRock == false: return
	
	var number = int(rand_range(1, 3))
	
	if number == 1:
		var rock = RockS.instance()
		add_child(rock)
		rock.set_owner(self)
		print("small")
	elif number == 2:
		var rock = RockM.instance()
		add_child(rock)
		rock.set_owner(self)
		print("medium")
	elif number == 3:
		var rock = RockL.instance()
		add_child(rock)
		rock.set_owner(self)
		print("large")
	
	createRock = false
		


func _on_Timer_timeout():
	#if Globals.get("gameRunning") == true
	createRock = true
