extends Node

# Member variables
var gameIsRunning :bool = false
var score: int = 0
var highScore: int = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func start_game():
	gameIsRunning = true
	score = 0
	$HUD_Root.setScore(score)
	$Label_info.set_text("Running")
	$HUD_Root.setRunning()
	
func run_game():
	if Input.is_action_pressed("ui_cancel"):
		gameIsRunning = false
		$Label_info.set_text("Game Over")
		if score > highScore:
			highScore = score
		$HUD_Root.setGameOver(highScore)
	elif Input.is_action_just_pressed("ui_select"):
		score += 1
		$HUD_Root.setScore(score)
		
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if Input.is_action_pressed("ui_quit"):
	#	quit()
		
	if gameIsRunning == true:
		run_game()
	else:
		if Input.is_action_pressed("ui_accept"):
			start_game()
			