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
	
	var number = int(rand_range(1, 4))
	if number == 1:
		var rock = RockS.instance()
		rock.set_name("rock_small")
		get_parent().add_child(rock)
#		rock.set_owner(self)
	elif number == 2:
		var rock = RockM.instance()
		rock.set_name("rock_medium")		
		get_parent().add_child(rock)
#		rock.set_owner(self)
	elif number == 3:
		var rock = RockL.instance()
		rock.set_name("rock_large")		
		get_parent().add_child(rock)
#		rock.set_owner(self)
	
	createRock = false
		


func _on_Timer_timeout():
	if ProjectSettings.get("gameIsRunning") == true:
		createRock = true
