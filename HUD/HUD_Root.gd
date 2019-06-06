extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#var highScore: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func setGameOver(highScore):
	get_node("Label_Game_Over").set_text("GAME OVER:\n\nHigh Score:\n" + str(highScore) + "\n\n\nPress Enter to\n\nPlay Again")
	get_node("Label_Game_Over").show()

func setRunning():
	get_node("Label_Game_Over").hide()
	get_node("Label_Menu").hide()
	
func setScore(score):
	get_node("Label_Score").set_text("Score: " + str(score))
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
