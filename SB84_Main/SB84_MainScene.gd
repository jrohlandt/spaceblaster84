extends Node

# Member variables
var gameIsRunning :bool = false



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if gameIsRunning == false:
		if Input.is_action_pressed("ui_accept"):
			gameIsRunning = true
			get_node("Label_info").set_text("Running")
	else:
		if Input.is_action_pressed("ui_cancel"):
			gameIsRunning = false
			get_node("Label_info").set_text("Game over")
			
